class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Avaliação AlzTrack'),
        centerTitle: true,
        leading: Icon(Icons.local_hospital_rounded),
        actions: [IconButton(icon: Icon(Icons.info_outline), onPressed: () {})],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.medical_services, size: 80, color: Colors.teal),
            SizedBox(height: 20),
            Text(
              'Bem-vindo à AlzTrack',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 16.0, horizontal: 24.0),
              child: Text(
                'Este aplicativo ajuda você a rastrear e avaliar problemas de saúde relacionados à alzheimer. Vamos começar!',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16, color: Colors.black54),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MainFormPage()),
                );
              },
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30)),
              ),
              child: Text('Iniciar avaliação', style: TextStyle(fontSize: 18)),
            ),
          ],
        ),
      ),
    );
  }
}
