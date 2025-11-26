Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA476D10397
	for <igt-dev@archiver.kernel.org>; Wed, 26 Nov 2025 08:53:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9BF0C10E22E;
	Wed, 26 Nov 2025 08:53:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lwZay/vB";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C34910E22E
 for <igt-dev@lists.freedesktop.org>; Wed, 26 Nov 2025 08:53:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764147228; x=1795683228;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-id:content-transfer-encoding:mime-version;
 bh=6CnguTQd7ZwTmP7DhZ4S6H2qmqOFc6VF7Y4Blr6WC5c=;
 b=lwZay/vBjPBZ/etbBc0d+B7qOu+q7HKiWGe5fcPXgTmpMlQY7q92A/Bn
 c5KMc+tCFLM3kX+mY0ZpJ+Y6lECn7bSpuvpU1iehAfxKNNDbN4fs4hC12
 JfaSqMOVmyPdPmDJdg4jjXA1E4qYAVwiM62mKQlsq9vDoALesRFZKZdEl
 X6O6+6Wusdfv+BjNz2s8e7J4B1BbbauMZq+ZAAen6Q9dhPd6sS/d1wtTw
 PNZnxzgv3B9n9ZFiCdr/r4ZLQsxzowu9aDWPLnzWE/RLkJ3VKzSwPpHu/
 cZfrv8Rh/XOmNfDXHxmazdTWIfIMKJ3QFswB/1xf9qfP9O6xu3llyvFwt w==;
X-CSE-ConnectionGUID: J8P/lnxjQH2VUvizdvnOsw==
X-CSE-MsgGUID: SR8f6P5gRumCThmA88aUtw==
X-IronPort-AV: E=McAfee;i="6800,10657,11624"; a="65366265"
X-IronPort-AV: E=Sophos;i="6.20,228,1758610800"; d="scan'208";a="65366265"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2025 00:53:48 -0800
X-CSE-ConnectionGUID: 3CiaKq4kSE6PJ1KMOJ+LIA==
X-CSE-MsgGUID: HbKeWF8kQqqvfheAGCg0YQ==
X-ExtLoop1: 1
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2025 00:53:48 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 26 Nov 2025 00:53:47 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Wed, 26 Nov 2025 00:53:47 -0800
Received: from CY3PR05CU001.outbound.protection.outlook.com (40.93.201.60) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 26 Nov 2025 00:53:47 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yOt5RJi9DFHKAPqS4XGYizYOhiekqL787XWo4GAW7bvHafrIuj08Xc+ka8lJR8v26qa5jpvHMCihalWn6aluGtheI8jCRh6AUKQRIvv0xZQYmAf87/eZOhZ1CYb9lJ/C5YfueDGdFbnbOHze5/0W8hyB/XLv3vsUCboPc5jboYJK+BTBuGbp9AuVgytYka/tNnjaaNO1XRgi1puYAkS0eTfKYcwPAnmePVbwXDbRt/Zm6QascIzXJrvwQ0RRBV/pVdJWyD6pV14XKlmppdov3Msb94G0aJFIDgM7Zfvp9C5VtJYpzBL0S9agjLl1A7XUAulD0XVrPqfLhToqO8O/Ew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6CnguTQd7ZwTmP7DhZ4S6H2qmqOFc6VF7Y4Blr6WC5c=;
 b=vwa43uCaBEHWS+V0eAhxfkgp1MWbXQGIFUYPkllaOAjsSZBB3zNUH2in7ZKbyF8TMt+UgdeA5djWPbdaKRkP3PsrHVAL6CvfrxI/4qs6EwaLXRVaMslik33+uRUTyA8rBORrdVtC63S5B1G/IMkxlNWjQfFJmPsxE3uB62/nea3NkgVTgJLdGdLZqFMlrPdmLq1a0x0es1dmWfvBaDy0AxGpknfE2E35vb+SX5ychIdBcUnyHEh3wKjHiXCDl47vdW0d5Opkjtrn0isfUdKylQt3WHtcft4hG6suEnCo7GkDFa89FABmx4c45NctdgdSArvTEj/dcyo6jZLOzQh4+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DS0PR11MB7733.namprd11.prod.outlook.com (2603:10b6:8:dc::19) by
 PH0PR11MB4887.namprd11.prod.outlook.com (2603:10b6:510:30::18) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9366.11; Wed, 26 Nov 2025 08:53:41 +0000
Received: from DS0PR11MB7733.namprd11.prod.outlook.com
 ([fe80::41a9:1573:32ad:202c]) by DS0PR11MB7733.namprd11.prod.outlook.com
 ([fe80::41a9:1573:32ad:202c%6]) with mapi id 15.20.9366.009; Wed, 26 Nov 2025
 08:53:40 +0000
From: "Hellstrom, Thomas" <thomas.hellstrom@intel.com>
To: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, "Sharma, 
 Nishit" <nishit.sharma@intel.com>
Subject: Re: [PATCH i-g-t v8 02/10] lib/xe: Add synchronous helpers for VM
 bind/unbind operations
Thread-Topic: [PATCH i-g-t v8 02/10] lib/xe: Add synchronous helpers for VM
 bind/unbind operations
Thread-Index: AQHcWwOAM6zXca8ackSRNrud5r6k/7UErksA
Date: Wed, 26 Nov 2025 08:53:40 +0000
Message-ID: <fd5a1f08b26ef9816b2d7ae4ba0cd4d26e96d395.camel@intel.com>
References: <20251121162537.77551-1-nishit.sharma@intel.com>
 <20251121162537.77551-3-nishit.sharma@intel.com>
In-Reply-To: <20251121162537.77551-3-nishit.sharma@intel.com>
Accept-Language: en-SE, en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.54.3 (3.54.3-2.fc41) 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS0PR11MB7733:EE_|PH0PR11MB4887:EE_
x-ms-office365-filtering-correlation-id: 0a41b598-e63b-42d6-3def-08de2cc94c0d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|10070799003|38070700021; 
x-microsoft-antispam-message-info: =?utf-8?B?TDhqcndvclVEVlIxcmhTbmNoY3M2OXhSVVJiYUVyajRnMlk2UkFaWHFpOWla?=
 =?utf-8?B?cjJvZVZDeHZGMzJldnNRUEtpUEtzK3Q1bm1KVmlHR0x6Z0pQVG1NSU9RK2hv?=
 =?utf-8?B?eVRHOC83WXN1bmNJRHYxYStUSkErL3d0dmI3eEN3ZDcwQkV6NUN2ODVoTEU2?=
 =?utf-8?B?QzVIQ2RIN21JVTVmRTRCWjlsd3RSQjRQY1ByOERhTTQ3aUpGRzB1eHZhZVBM?=
 =?utf-8?B?dUI3Vk5SbXRSNXRCdEg1WkNidkgveUhJcmd0QW9vK2JuSGtYdE52d013Qno4?=
 =?utf-8?B?QmZVMlJoZW9ZaU1LY1cyT3hsZTlZM2FyQWxrZ3ZSd255WUJsTGtLVzFtblZq?=
 =?utf-8?B?WVdPY0lSYkxVSTF1Ky81VFhXcUIvLytER3hEdVBQajFrMFRHZ2pzQi9KVU1x?=
 =?utf-8?B?NlI5TVh4SXlHR21jMkZFZFBNNHhiTm5rYkVLNFBxUWFNNUhYL1NaNGhmbzVF?=
 =?utf-8?B?aHR5bUkyVCt6U0dhNy9OMXd2eXJwZ0gvNGpBUzhjSnhhQUdwUm9zQ3NoTTNL?=
 =?utf-8?B?dy93RFM5cTE0WStpTlZSZkE5V2c3c21QR3JNcVJLUnBOQTdIMmpxbG5QN0xr?=
 =?utf-8?B?M25haDliRHgwRnFrZ1dkWmJES05ZUGtpZXdHekVPUWUyTUh2TDliMS9ZZDF4?=
 =?utf-8?B?SVZBcWU3anFwLzRQR1F6d2pYU2hwVmN6bURWWVdrOWFuNm1ZKy9zcUY4N044?=
 =?utf-8?B?VDRvaTkyM1NMeUVFcithKzlWL3U4RXJsQ0IraTYrYW9ZdU9TczVyeHo5eHVT?=
 =?utf-8?B?NnUrS3dDVUxTSCt5SHBMTzJLRVBBd1drOWZjNmJjNVM3czl5WGdYMm9OUDRT?=
 =?utf-8?B?Z2xBdzRsWGo4Y0JQeXI5NmZETzJ3V1gwQzVOUnBObE1tRkZGcWI5UC9UZDA0?=
 =?utf-8?B?VTlqc0RpK0NQVTFVdnpIcFllRmhnMXZVSWhzTndTaFdKTVU3MHlGRmw2a0Zy?=
 =?utf-8?B?a0l1QTJORGxSY24zUGpjamRpNmR3UHF2enM1UXlrZlRmeVJ6UW5aaVdlUG9u?=
 =?utf-8?B?M25YYXBhdGVBdlJMRDk5QTZCU2VQM1JaR0Mzai81V2Y1OGlIRC9ObDZzYkha?=
 =?utf-8?B?QUJiVm5naWF3OENJQ3BNQklYZktaeWU2THFvZlh6N3pYL0VJemRRTHdacjV4?=
 =?utf-8?B?T1RTRTVCVXFHMFRpTDF2T1VzUms3dVcxZ29VK2xwQVI4aTI2L1VyYW8zeWxC?=
 =?utf-8?B?NFlWU2FhSkt5NHJiNmxZS28wUzFGMFB4Tzl1TGJTZVlMYkdkUXZPNy9GOUxZ?=
 =?utf-8?B?RzlkcjhhRGFNdzkzSkNOc1RNTFpKaU5Zd1E0WjJ3ZWI2MEplTDBZQTNCcnIz?=
 =?utf-8?B?VGdzMmpSODF5T0RnbGNUYjNGbThyL2N3aUN3bmlYYXVWZ0dlTlUzODZGM1dl?=
 =?utf-8?B?aW1RZkVVZ1pxZEhkMGJpTm9NOFJ4dFV2bEI1Z251L0x2MDEvWWZwMUJaa2hD?=
 =?utf-8?B?NUU3cm1IOWZGL20vY3RBV1VMbTZBdythS3lnRGQyUHM4ajluSEF6OGZHTSsv?=
 =?utf-8?B?ZmdSY25aWE5pMitEMXlQSjM4RE9kN1ZhSkhXWlVCWDU4d0ZxcUE2QTh1UTdv?=
 =?utf-8?B?bEhLQjdsTmtmZHB3YjVDMnlvSFl1ellFMEVUekpLenFhWjFkUFpqRExtZ0Fn?=
 =?utf-8?B?aVhGTnptc1NCUVJvWjZreE9SQWdDUmlQOUt2aVgralh5MVRTVVdzMDhQOGJm?=
 =?utf-8?B?K2Fnay83SzBXdUl6aWNCVFBXOTRPaTUyMlJxOTVQNXM4THp4RHJwL0JLcGdu?=
 =?utf-8?B?WnVEWVY2ekY3VW92aHpHR3V2UWJhbXdZQ2hQKzlaT24xZjd5UUZ6VFRnbUJm?=
 =?utf-8?B?dVVJR095NmNRa21vbFZ1ZUhKQnFhS0g5T3VJSjhQWHF1VmdBRWZRSytOMC8z?=
 =?utf-8?B?OFhrdEo1RzNMdXo3WTBpdzZ2ZFowKzVOc2FXbDVHVGFXejMxYk0rc3VOSCt5?=
 =?utf-8?B?TDdiNGd2NGczdmdXditFWXZ2Q3R6YmJ0T0dkeVFlZHJ2UkxCZENPbEQ1cTRk?=
 =?utf-8?B?dUM4YWhZUFNWd1N5UkNFWERmSHRqdUZ3Y0VjWDZzVTVRU1NON3h1QXY0NXpN?=
 =?utf-8?Q?ZbOqnL?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7733.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(10070799003)(38070700021); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?MVRzWWRwdW1MeXFmMlRlVysvQ1c0VjJybVMrYjE5bG9QenprR1FKa0RnZ1ZY?=
 =?utf-8?B?MDMveHMrV1d4bkhtVVBRTEJjMk9Ha1ZHNGZTYncwelBkK3MvNGFxbjN2NWQv?=
 =?utf-8?B?a2NFaWpjWkpndzcxaUt5V2ZGRDFHamNXZURhckw3T1VlZ3NQcGNvL0JGdXhk?=
 =?utf-8?B?L09FbEx6Vlk0TUhISjJkVENRbWJOUjFxV1U5bWNEU0tQODFlZW0xcDhCUi9D?=
 =?utf-8?B?NlhQd0hnYmVLaU9ETmU0R2J2aktDK0J4ak1iekxUbjYvTFZVME5NQnNCeGVQ?=
 =?utf-8?B?Y2IxRkJMMjZ0OHVwOTBWTmVYZlFhMFRoTHM1RkJVeWd4VGM1eVZTejFIWE9l?=
 =?utf-8?B?UHJYZEdvMFFWdHJxemtIZnRlbHFYd2xzRHRWRWcrU0VuMFhIRVl0dWg2dGR1?=
 =?utf-8?B?ZHpET0lDNU9hbWJ4U0gyQS9MT3hZV2NqTm92OFF0c3ZmMUM3OUhmV3NQa3lY?=
 =?utf-8?B?Smt0VnhGUVVwOTJMWmZtb1k4dWRtb2pEV3NlOHlaK3h5T3l1bHU0aUhKQkM2?=
 =?utf-8?B?MS9jZGhRMGdSUlJEd05iVXZRLzlOVFFLUUQ1M0xQbmRha04zdFhQSURpQ3BL?=
 =?utf-8?B?VE1QWGZFZmdBWTg5bWFRNWxSWTcwTEFLRDhGb2dRYmFqbHNVb29MU1h1YVhN?=
 =?utf-8?B?SUVxanRpaTFVd3JTbjVEWFNocHUwL2RhdXNIdkN2NHV4NXUwUkkxN0xLQkpQ?=
 =?utf-8?B?U1UrWTgzOE8zZ3F3VEYzSHRJckt4Vml1OXRBMkNQVDE2Q1dhUkQ3ZE1FLzI5?=
 =?utf-8?B?SndONDZiTVN3WXVLSlIyT01wMHk4YVBkQ3lHODRDemtkbVZBd3hYVEphMnFu?=
 =?utf-8?B?dWl1V250YVRENVR4bHBGa0JBbEtkMC8va0lNN21SamM0L1J2aXRTdVZSVkxF?=
 =?utf-8?B?TFIvS1RFOExWa1NjUm5HeWRsTkljMVhweEdkU1JlVmJ0R0NldWExeVF6Vk83?=
 =?utf-8?B?UDFIN0tSMkdUK0xEUEc5Wm5INlh4d2lMVVNtak1UZWhUckJoSkRYRjVBZWY4?=
 =?utf-8?B?MDhzbGJFVE10NTIvZElWOGtXRDZNWDZ4T0N0QmhKVWtESng4OG03MUVieFhX?=
 =?utf-8?B?K09wUjhXc0UvMDJVNzF3ZmVVSEo2MW1yRHBDcWlJNURqUC81WWk3U090MS93?=
 =?utf-8?B?V1hYd01XOXVNbjNMWUdyTUdWbjhPOUNmWVIzWklpZjB5SzF5V2x5NkdvR2FW?=
 =?utf-8?B?bUtZL2JPTGx0bWxQbEM3aEk4alpNT2MvU09wcVNxcnFjN0R6cHE1eGEyZmVa?=
 =?utf-8?B?bmdkVkNsUklwaUN1Um9KTkp3WjdCdTRDMExPY2FuVHJaTEpLeWhrS2lKNGlC?=
 =?utf-8?B?QmdWMUZzc1NuWno5MDBaYjJockFtRGhGQ3hOOW9vQlNKWDk4KzV6YnJjbkI2?=
 =?utf-8?B?ckRKR2taSE11dG12c3c0VlUwSXpxUTdQa3hqRDZ0QnhWcFNrOFJ2NDhKZHdm?=
 =?utf-8?B?TVMzbitacVdBQ0tSNUhyOC9RbDZ3alBqM1dLdE5KYUtDaVFGOEtiRnVOL2Ux?=
 =?utf-8?B?MUJkVXF3Tlo5N0JYUTQvQmJabHhRQVdrMDY5MDBTb2I1YVNPOUx4K0N6alBy?=
 =?utf-8?B?Q29rbFM2eFcyRldMeFZSanQ3UGQ3MVhzMHVwNENpYVFXejJsZm1kZWt1SUJk?=
 =?utf-8?B?OHUydW9rK2Vld2Frd3MwWGJYTzlCMTJVZUlmc21vZ1J3NnNuY1NnQUN5OUZx?=
 =?utf-8?B?UkhaRjFrcjFyUzAwT1JJWGorY3Z6SlhNMFdYTjVJYmtGTDJ0UWMwdk8xQkNP?=
 =?utf-8?B?YUFWWmxYUHZGNEdTMDBtMThYcWg1ZVpsaUNkWHN4ZVorQ2VIdzJNZnZYMFk0?=
 =?utf-8?B?eU1UYURtVy9TWlJCLzgwVnlieDdyR0pUSmdoUTFqSWdTUmVqSlJ2RlF4QXhP?=
 =?utf-8?B?TnZhM2VYV0VHa1BvNDUyNjEwMTFlVEdGbVZGUi83cVl4MW1BVHRsdFVnZTRY?=
 =?utf-8?B?WllUdnN4b0s2RlNEeXE4ZU9oL0JBcE42NUh1RDd2S21oelRLaU5qVUhpeWlm?=
 =?utf-8?B?QXBIZ0JjWnVFV21UcG1KekdlaEtINEpZV3Ntc3UzMUo5T3FXRDR5NEt4bnZU?=
 =?utf-8?B?dzhKa0hrNmEvQWdXbHBsU05NcmFvbmNrMkxmLzhGdjVaY3lYRzg4dWV1MXJI?=
 =?utf-8?B?cFA4amNBVkw0ZVp3ZzRnZk4wYzlpZ0JEN0IyQThFcnhqM1RuaU1WSXpZelVX?=
 =?utf-8?Q?d7uUYwajmGv5JIi0eMyr1D9Tf3FIiAVB5XksVPo8K7YT?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <8D7308DA1F318A4A85CA6641BF7F6FDD@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7733.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0a41b598-e63b-42d6-3def-08de2cc94c0d
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Nov 2025 08:53:40.8638 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ns9raxvcLOF+q6XJgwWb6c7Ss/gaE+WZkleRYGVKQhTHb6M/KKH6dwwHAGb6zLmjA3FcN10FSBgldpypUJOGs2IqRWb8yPxLM5Q5BKXgqT4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB4887
X-OriginatorOrg: intel.com
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>

T24gRnJpLCAyMDI1LTExLTIxIGF0IDE2OjI1ICswMDAwLCBuaXNoaXQuc2hhcm1hQGludGVsLmNv
bSB3cm90ZToNCj4gRnJvbTogTmlzaGl0IFNoYXJtYSA8bmlzaGl0LnNoYXJtYUBpbnRlbC5jb20+
DQo+IA0KPiBJbnRyb2R1Y2Ugc3luY2hyb25vdXMgd3JhcHBlcnMgZm9yIFZNIGJpbmQvdW5iaW5k
IG9wZXJhdGlvbnMgdGhhdA0KPiBoYW5kbGUNCj4gdXNlciBmZW5jZSBhbGxvY2F0aW9uLCB3YWl0
aW5nLCBhbmQgY2xlYW51cCBpbnRlcm5hbGx5LiBUaGlzDQo+IHNpbXBsaWZpZXMNCj4gdGVzdCBj
b2RlIGJ5IGVsaW1pbmF0aW5nIHJlcGV0aXRpdmUgc3luY2hyb25pemF0aW9uIGJvaWxlcnBsYXRl
Lg0KPiANCj4gU2lnbmVkLW9mZi1ieTogTmlzaGl0IFNoYXJtYSA8bmlzaGl0LnNoYXJtYUBpbnRl
bC5jb20+DQoNClJldmlld2VkLWJ5OiBUaG9tYXMgSGVsbHN0csO2bSA8dGhvbWFzLmhlbGxzdHJv
bUBsaW51eC5pbnRlbC5jb20+DQoNCg0KPiAtLS0NCj4gwqBsaWIveGUveGVfaW9jdGwuYyB8IDM5
ICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKw0KPiDCoDEgZmlsZSBjaGFu
Z2VkLCAzOSBpbnNlcnRpb25zKCspDQo+IA0KPiBkaWZmIC0tZ2l0IGEvbGliL3hlL3hlX2lvY3Rs
LmMgYi9saWIveGUveGVfaW9jdGwuYw0KPiBpbmRleCBlYTE3ZWZkZDkuLjA2Y2U4YTMzOSAxMDA2
NDQNCj4gLS0tIGEvbGliL3hlL3hlX2lvY3RsLmMNCj4gKysrIGIvbGliL3hlL3hlX2lvY3RsLmMN
Cj4gQEAgLTc0NiwzICs3NDYsNDIgQEAgaW50IHhlX3ZtX21hZHZpc2UoaW50IGZkLCB1aW50MzJf
dCB2bSwgdWludDY0X3QNCj4gYWRkciwgdWludDY0X3QgcmFuZ2UsDQo+IMKgew0KPiDCoAlyZXR1
cm4gX194ZV92bV9tYWR2aXNlKGZkLCB2bSwgYWRkciwgcmFuZ2UsIGV4dCwgdHlwZSwNCj4gb3Bf
dmFsLCBwb2xpY3ksIGluc3RhbmNlKTsNCj4gwqB9DQo+ICsNCj4gKyNkZWZpbmXCoMKgwqDCoMKg
wqDCoCBCSU5EX1NZTkNfVkFMwqDCoCAweDY4Njg2OA0KPiArdm9pZCB4ZV92bV9iaW5kX2xyX3N5
bmMoaW50IGZkLCB1aW50MzJfdCB2bSwgdWludDMyX3QgYm8sIHVpbnQ2NF90DQo+IG9mZnNldCwN
Cj4gKwkJCXVpbnQ2NF90IGFkZHIsIHVpbnQ2NF90IHNpemUsIHVpbnQzMl90DQo+IGZsYWdzKQ0K
PiArew0KPiArCXZvbGF0aWxlIHVpbnQ2NF90ICpzeW5jX2FkZHIgPSBtYWxsb2Moc2l6ZW9mKCpz
eW5jX2FkZHIpKTsNCj4gKwlzdHJ1Y3QgZHJtX3hlX3N5bmMgc3luYyA9IHsNCj4gKwkJLmZsYWdz
ID0gRFJNX1hFX1NZTkNfRkxBR19TSUdOQUwsDQo+ICsJCS50eXBlID0gRFJNX1hFX1NZTkNfVFlQ
RV9VU0VSX0ZFTkNFLA0KPiArCQkuYWRkciA9IHRvX3VzZXJfcG9pbnRlcigodWludDY0X3QgKilz
eW5jX2FkZHIpLA0KPiArCQkudGltZWxpbmVfdmFsdWUgPSBCSU5EX1NZTkNfVkFMLA0KPiArCX07
DQo+ICsNCj4gKwlpZ3RfYXNzZXJ0KCEhc3luY19hZGRyKTsNCj4gKwl4ZV92bV9iaW5kX2FzeW5j
X2ZsYWdzKGZkLCB2bSwgMCwgYm8sIDAsIGFkZHIsIHNpemUsICZzeW5jLA0KPiAxLCBmbGFncyk7
DQo+ICsJaWYgKCpzeW5jX2FkZHIgIT0gQklORF9TWU5DX1ZBTCkNCj4gKwkJeGVfd2FpdF91ZmVu
Y2UoZmQsICh1aW50NjRfdCAqKXN5bmNfYWRkciwNCj4gQklORF9TWU5DX1ZBTCwgMCwgTlNFQ19Q
RVJfU0VDICogMTApOw0KPiArCS8qIE9ubHkgZnJlZSBpZiB0aGUgd2FpdCBzdWNjZWVkcyAqLw0K
PiArCWZyZWUoKHZvaWQgKilzeW5jX2FkZHIpOw0KPiArfQ0KPiArDQo+ICt2b2lkIHhlX3ZtX3Vu
YmluZF9scl9zeW5jKGludCBmZCwgdWludDMyX3Qgdm0sIHVpbnQ2NF90IG9mZnNldCwNCj4gKwkJ
CcKgIHVpbnQ2NF90IGFkZHIsIHVpbnQ2NF90IHNpemUpDQo+ICt7DQo+ICsJdm9sYXRpbGUgdWlu
dDY0X3QgKnN5bmNfYWRkciA9IG1hbGxvYyhzaXplb2YoKnN5bmNfYWRkcikpOw0KPiArCXN0cnVj
dCBkcm1feGVfc3luYyBzeW5jID0gew0KPiArCQkuZmxhZ3MgPSBEUk1fWEVfU1lOQ19GTEFHX1NJ
R05BTCwNCj4gKwkJLnR5cGUgPSBEUk1fWEVfU1lOQ19UWVBFX1VTRVJfRkVOQ0UsDQo+ICsJCS5h
ZGRyID0gdG9fdXNlcl9wb2ludGVyKCh1aW50NjRfdCAqKXN5bmNfYWRkciksDQo+ICsJCS50aW1l
bGluZV92YWx1ZSA9IEJJTkRfU1lOQ19WQUwsDQo+ICsJfTsNCj4gKw0KPiArCWlndF9hc3NlcnQo
ISFzeW5jX2FkZHIpOw0KPiArCSpzeW5jX2FkZHIgPSAwOw0KPiArCXhlX3ZtX3VuYmluZF9hc3lu
YyhmZCwgdm0sIDAsIDAsIGFkZHIsIHNpemUsICZzeW5jLCAxKTsNCj4gKwlpZiAoKnN5bmNfYWRk
ciAhPSBCSU5EX1NZTkNfVkFMKQ0KPiArCQl4ZV93YWl0X3VmZW5jZShmZCwgKHVpbnQ2NF90ICop
c3luY19hZGRyLA0KPiBCSU5EX1NZTkNfVkFMLCAwLCBOU0VDX1BFUl9TRUMgKiAxMCk7DQo+ICsJ
ZnJlZSgodm9pZCAqKXN5bmNfYWRkcik7DQo+ICt9DQoNCg==
