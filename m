Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C8B5C83026
	for <igt-dev@archiver.kernel.org>; Mon, 30 Jun 2025 07:52:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AFCAE10E207;
	Mon, 30 Jun 2025 07:52:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Izb8MV0D";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F176610E207
 for <igt-dev@lists.freedesktop.org>; Mon, 30 Jun 2025 07:52:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751269967; x=1782805967;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=JWDONTNO3qllJXw+jhmdhGbQZ8iKRsBMKMZjOFM296o=;
 b=Izb8MV0DUPu7NDEUXSFCsfOGtkIdFPsA38BuVmgbDhhDX67QjiBU/vwE
 mvwl70dBkiujnBprCavaHi7/VY46qjVKXGOM8fq9UDXSXNAbR1KGTXNPe
 T6UAECmdR34CSsgAW0LApelCLX7090hkyOUWWPO4yv+zLcYC5ce4Ize5T
 iJ0Gi0fm1+6SHTyipx/KY8XHirerIt3bOlC7wlBztaot2YyL04W/0BP/G
 qzmlcvEktIohuCBhbY8Tux/JaK/z9dgfhXscxAQtER3MKM6FKnEG6h/6U
 PmXhDHH8DxNeX6k3YIzy8GiZtKonJ/+REXO/1ZAJxSaQ0o3yxKmZH2492 g==;
X-CSE-ConnectionGUID: WK1Px2otRq2+7n6vDu5BIA==
X-CSE-MsgGUID: 1RqLb6GwQ1ij9wH2c6W3BQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11479"; a="53209532"
X-IronPort-AV: E=Sophos;i="6.16,277,1744095600"; d="scan'208";a="53209532"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jun 2025 00:52:16 -0700
X-CSE-ConnectionGUID: LvyiYgV9RsqCB6JcZOSEbQ==
X-CSE-MsgGUID: rmeAU/PhRESS5Jn3CUJtbw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,277,1744095600"; d="scan'208";a="152873381"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jun 2025 00:52:15 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 30 Jun 2025 00:52:13 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Mon, 30 Jun 2025 00:52:13 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (40.107.94.76) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 30 Jun 2025 00:52:10 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lumY01w0L96REQXoHwtU6E0cKpsQ9MHLK0GpFt7mYLsmNpCIOvRlX6GUStW0955nGzbtttekQ4lbwJugjwkb/k65gDZFn2ByTYt1vRkTTPbzDBgGG+0qhi/nj7COUzjhVQH9WoH3r5MmqcPXbb8JFmh8KQAfB/k+l9U4BIPBB1kFy5Yx1EdrWcDsXrx1CVujVOJqUlM4IDltjggubZHZidJejdyw6iHb6T20fRUCcQAy/hfQs02F/1q68U99a4fEtiZfG0Ya60NomjZkGCkCEal5KTtDXy9Ln8/4eI6x32fzTu7luYQy+dh/8Px1oqGp1qTwY7DF4CdWhWG2EVN6Zg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JWDONTNO3qllJXw+jhmdhGbQZ8iKRsBMKMZjOFM296o=;
 b=Zpk5rpo3tT+9TmsuzzNR7qr0C534R6BctbUUbLcEU1A9DYCIcFFZhTlXNLOlFphdwXQtZynnq1QmuQN/J1VLMN4aGq9aj+k3iCvmnrrsyh+PxCH7eKd97+TlpMjKIeRM/kmLOFkCZN4ZYKR2OWRU7mZGV6vOriFrq7mNpqEyB1LkmCbgk3vdTGen/EYPd899DhhAMvk0E/SrTuqP3H6hlhuKWg72ej4VYfTsS1dLtZxK+7MG17u0ULacSQ6F6FcdvJfvZCDxCLO6254z9OrRzUv/tXcNMoA7oq+ZrdIAWkPwjtDe4MqOaaT4VuJ/Rl/ylAN0xt3RAWIN0Fc1rlwGTQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB6312.namprd11.prod.outlook.com (2603:10b6:8:a5::11) by
 DS0PR11MB7959.namprd11.prod.outlook.com (2603:10b6:8:fd::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8880.29; Mon, 30 Jun 2025 07:51:42 +0000
Received: from DM4PR11MB6312.namprd11.prod.outlook.com
 ([fe80::faad:f9ae:2b45:e9ba]) by DM4PR11MB6312.namprd11.prod.outlook.com
 ([fe80::faad:f9ae:2b45:e9ba%4]) with mapi id 15.20.8880.027; Mon, 30 Jun 2025
 07:51:42 +0000
From: "B, Jeevan" <jeevan.b@intel.com>
To: "Joshi, Kunal1" <kunal1.joshi@intel.com>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>
CC: "Joshi, Kunal1" <kunal1.joshi@intel.com>, "Deak, Imre"
 <imre.deak@intel.com>, "Murthy, Arun R" <arun.r.murthy@intel.com>
Subject: RE: [PATCH 4/5] tests/intel/kms_linktrain_fallback: extend test for
 eDP connector
Thread-Topic: [PATCH 4/5] tests/intel/kms_linktrain_fallback: extend test for
 eDP connector
Thread-Index: AQHb5cuWrIWhTPpEzESr9Ve+NzwUp7QbW0hA
Date: Mon, 30 Jun 2025 07:51:42 +0000
Message-ID: <DM4PR11MB631243055825FAE96A536CA49046A@DM4PR11MB6312.namprd11.prod.outlook.com>
References: <20250625123402.3929358-1-kunal1.joshi@intel.com>
 <20250625123402.3929358-5-kunal1.joshi@intel.com>
In-Reply-To: <20250625123402.3929358-5-kunal1.joshi@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB6312:EE_|DS0PR11MB7959:EE_
x-ms-office365-filtering-correlation-id: 73a721b6-09a4-491a-17c8-08ddb7aaf3f4
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|38070700018|7053199007; 
x-microsoft-antispam-message-info: =?utf-8?B?dk8wN1g1b3BpM3dnOGhzb1lydzJjSkhzdzMyWGJwQ0NuNVZ2Mk5xSVpkYVJ5?=
 =?utf-8?B?TVJHUGdWejV2SjZmOG1DTjMrSlFBNjdxY0xaanRCMk9TWTlvTzZMTjd1NWJa?=
 =?utf-8?B?eFNFMkRnZ0F5QjU4azFqZHQ5d2VhNkgrbGlQb00yVjZmbzUrRGVJOHlvQmcw?=
 =?utf-8?B?aDYrWjFvanU5UUFIUVZtMEhpTG1iNzZCZTRFcCt3Q213QzNSMDJkb3JnZ2Rj?=
 =?utf-8?B?MUpRbEJleVh5SXlOOVliVmh5SXdGbUZPejE5d1l1cFZkN0RNMk1oUXgyaThL?=
 =?utf-8?B?SHZYRFc3eUFhNUpLYnBwRG1jaSs2aW5rQkVTdUVqZzdJVmJxeTFZMVJKTG5p?=
 =?utf-8?B?MGN6cW9ISFRMK1BNVmR2cDFweTNESXo0SlRvbC9lUTZja1pNRmtLYUNrVENy?=
 =?utf-8?B?eExkcnMweUhYbmdTbUlMMnZBVGdXSHl4b1h3aGJvRTNRUjZCUkpEY2h2MVN2?=
 =?utf-8?B?RlExamQ2ZFRhKzMrWUhUU3dXL1VyMVZSaEhKdERaYlZmY1BFQmZjb0w5QnY4?=
 =?utf-8?B?OXlUNVl3ZTBHY0szM2kyOVhCc21WQjg1NzcyUUJDWG9IRkpINGZTclU1TFFn?=
 =?utf-8?B?WFREMTJnTlJNWm9nUHovVzdqSktxQk9iNngySFhUM2RHRFhEN1pIUGVoUlph?=
 =?utf-8?B?Q0NDQUpReHU4aWk1RkNaWHl6eXlLNmR0SlJwV012cWZWVk5lVDJGWktod3R2?=
 =?utf-8?B?dW1jV3RtTW9HQnQwejJoZFpQVlA1citFWnpQck5UZ2NOb1ZMR2JZTGJYejZX?=
 =?utf-8?B?SU5NVEVMd0hjeTFLbjBEd0NmOHhOK0pLOWpuS1IxUWllMWcrZUxpVlVLbG5E?=
 =?utf-8?B?MnFSTGJ0c3VINVZiYXZvWTZVN1FBdnplejY5YmZFV2JWTDVUTitrNU9aT3BH?=
 =?utf-8?B?K09lWWZiMUVhNkU4QXg1YkdBdCtLVlZOaDZPVmNpdTlyakhqNHl4UUJqUHZr?=
 =?utf-8?B?OCtocER4aXRBTFQzRGd1Q01DakRZTzRvUUlES1dGRVpJMmdhZ2pyR0YwWmFE?=
 =?utf-8?B?TlN6dkRvc29ldEdTTlZpcmlXWVVPSk1qcHFTajJmYTRTM01HcG96OVltK2lt?=
 =?utf-8?B?UlF3bFRiaVJFRFV4RXFOakZVOEN5VXZjcVNoTzhyOFZGbmExNkRCdkpDNk5S?=
 =?utf-8?B?YTFWVG9zL1lMcGQ1UlNQb01EOFFMZkY0NUlxbTFGUFhZdE1pWjNmditwOWEy?=
 =?utf-8?B?NUJONUMyc3F4WUVYRnd3ajV4aHhSWVNneE1qZVRpSTk4RFB4M1UrYm9KOUM0?=
 =?utf-8?B?VzBwODgrbHFBMk9vSGR2eFdtRXNmVEJINUF1Z2IrZmtwYzRFNE1ldnZGeXF6?=
 =?utf-8?B?b2ZuQWVTMzZHZG5zVy9abzJxNjdIZG80MFlEVys4RzU5Z05vbTk0bkFTeFVo?=
 =?utf-8?B?ckdPVGlYVFZmeWQ5Y3RsL3ZGdERJSk9Zd25uTEMza1JGNVF0cis2bzhmSFQw?=
 =?utf-8?B?dDJMMHJra2lzSXQzODJncUlMUVRUbWlpQnlEVUFZY2NuUU9aTFlMT2xudDZp?=
 =?utf-8?B?U3pVSTRWcjZLVzYzRkxqR3Z3L0orRFhydkMvbTBjRUlVWC9VSlFtK0RNa0Nq?=
 =?utf-8?B?TGZCWXBCNXJyNC9MOE0rUGJjTjFXQWtHWjQ4R0FBRVR0bnpLeVJkNGc5VXMy?=
 =?utf-8?B?QS9obEZFZWQvU29lcVFDcUFVbHhWVTRZc2Zrb2dsaHRQcTBoaFZ0MHJaazV0?=
 =?utf-8?B?LzhYYm5kNlcrVFBBN3Z5bTVOek82d1pGVFB6dHozTDJRMy9tQmlNUm9DSDdW?=
 =?utf-8?B?NVhZMG9rM2N2eGUxSUl0NjkzSnFjZzhpRDI1TWxPUlU5T3NKZFJuSHEwU2hy?=
 =?utf-8?B?QjQ4U3cyOFkvOUxPOEU2Z2tHaWhoNXN0T3lVVnhqaFdKTE1mL21LbUIweit1?=
 =?utf-8?B?K3YrNGZ2SFdHdGxJVzhIYlI1YnE4dEg0UzlzSzdxMFRKeW5tWXlhaytEUHVI?=
 =?utf-8?B?TGdkdmp1Znp4dzVsYy81TnZhbjBGQW8yQ1ZoTUd3MTJlQUNEQlVMNFdBZldy?=
 =?utf-8?Q?DLEaNEs1izgFN4MCEEgKm14NjTnqek=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB6312.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(38070700018)(7053199007); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?MjVDb1J3cTBySGRpR2RCRmIzbWpwMXdwM3UwRnFoOUR6UzRScGJIQ0dscWds?=
 =?utf-8?B?dDBXYW1MbndqeFFGcnRJamx4bFU4azVYYTBMMVJycmdwbWNacGVwd2FkSXN2?=
 =?utf-8?B?OWF5M1RTS0ZQb2NFU3B3Q3lKd29sNk9WNzRXaTVxOE8zNTBmakRMWmxQWkZ4?=
 =?utf-8?B?OTZXL0d3TWx1Vng0TUZVMXZBMHNXTlpFRUgwZ3hmNExZQ3gyM0JLZUVOWG9N?=
 =?utf-8?B?ZHFiSnV2RThYU0R2WHkrUUh3Yy9qZUhkc0FYVXNUbkF4SzAyZktVSXc1TEYr?=
 =?utf-8?B?a3pKKzNKeVZWVnI2RFJ2VFhJWE11eDMwQ2JzUER6WWpLK0N0Mmkwc3RwM0p3?=
 =?utf-8?B?Mi9Jei9ES3ZlZkl6WFdCWndkWEdMbCt3bGxqdVVKWURKc1VaUHEySGoxakUw?=
 =?utf-8?B?NW1zK2pqTjBjY0NEcyttTUcvb1I0QXNYM3lhL3FBRUQrUWR0Y2MweVdvaEhr?=
 =?utf-8?B?WEg2czB0RXZqQTYzK2IwM3pMMDArMHlteGVmdzVkVzNITkJLaDI2S2svNFVr?=
 =?utf-8?B?eDZKdWJYMjdhY0FXQkdNQlMxODM4WndSUXZNSXNxWUZrcnlvQlJvTlN1ajd3?=
 =?utf-8?B?eGI3a09Mem0za1VONGhhazBZemdFcDBRK2dBeTZuVWdJU0JUdkQxczFJSHJG?=
 =?utf-8?B?OGFtU09kL2E2Y3gzb3c1Qlk2YXl3dUMyY2RHS1Nub1JPc2pwR2FwenBvRWIr?=
 =?utf-8?B?TXYwdHdQNGdQZGEzaW1xZ3pwNHRiSUtOTUM0UW54czNKSmlGMVlUaVN2MFhy?=
 =?utf-8?B?RGo3V1NkT1hPaGhRTm0vcVlBazZSMko3V1FWVkNoNm1pd2FIV0hkcjBSRHIv?=
 =?utf-8?B?cDlQcVFFcyszalRiN3M4OEVpcHBWMmxCWGsvbFBpSUU1Z2JXN1pLam5Ba3Br?=
 =?utf-8?B?cTQzbVh0ZGZWSmExWkhwZEZxaXpiZDNRVWU3VEJBZGlRN29kMlFicGNualY2?=
 =?utf-8?B?NkFMWjVqWDNzQ0t3amkwSUtnVldIc3ltWWppREFrMnBzeVJBeVQ0WWdhZnFH?=
 =?utf-8?B?cEhBMFpVUHZVT3ZWMFJoSlNCZEF5UUhVN2MwZmRFdnR0R3NjNFBjRFVWMVgv?=
 =?utf-8?B?b2FLN2xITUhudnpVZHdKYzNtWjRML0R1V1Y2Y3JMRlNFRHluSmlnblRFOCt2?=
 =?utf-8?B?UFVkWmxWbW13K28rUmxFaEVEb3JOd0lTbGgzVEhoUTVWOFZ1OTFjMEFEaTc0?=
 =?utf-8?B?Z1RnYmI5dkZ4UzlRTUYyYW5YaThudzBsbEkrOWNNOUg4RzBMaVlPSnRNeFNo?=
 =?utf-8?B?cGYwOXdTZ1lmZUpWNFQrQTZST3o3ZmRLYkluMWV1d2gvVW9QODUrT1BLQWRK?=
 =?utf-8?B?Q2d6TVgwaHFxdXplR2hzaDdkN2ZaZVBoLy9vQVBRK2hTQUVHaEdlTSszSUNF?=
 =?utf-8?B?eUk4K0gydTd4OFV4aXlQellXYkVPZ1ZEN3kvNHlVakZiNmFkMzgvTGlGZ050?=
 =?utf-8?B?eitJbFhNU3RqM0ZORkxKUzNJWWFmT2pkRHpVd2xqUWw1dks0Mk1OT25MU3RV?=
 =?utf-8?B?ck5kWlJuK1VUVG9OMnB5ak0wL05weGM3NlZuMFQvT0tILzJUR2ZSYXZuazdm?=
 =?utf-8?B?M2pXbWpjV2N4ZytXeFZ3dXZGUFRja0p3cUNNRFZiOTdhRzNBTitycTM5OFpW?=
 =?utf-8?B?Z1lJK1FnS3R4bHJoSlBBbkRpRnZLclcrQzVhOGFYNFZiY04rWTZEUTg4YkFm?=
 =?utf-8?B?M3dHSjJoU1d3YzExeENjT3JvWXdmcXkrc2FxWjAyRTEveTJWVlV3VkZtOVo4?=
 =?utf-8?B?TXlzclB0MDlmamcrdUFMWEZNUnJTaUdHWGtqa3lrYVpIcHFIeHVGb2xKYm5x?=
 =?utf-8?B?YXNXYUI0NDJBSUlqSEtjQ0x2b1pEMTE0eTlWZEFKZG5qMnFsM0RaSzVMSXIw?=
 =?utf-8?B?Nko5N3ZiN3dlMHBkYzFGa1o0WWg5Ni95d09PS3dOTjZpM2pGWFlZamNQSjlp?=
 =?utf-8?B?RXN6RHFEWHZzT0RZYWdqRkw0S2l4dC95ZFlGTUM0SFdDRUZBcnpHZnh1THhv?=
 =?utf-8?B?UEZ4ZXRTVnZNNVpXbG5ObldZYXhiT3k2ZlU3Nno1V3JXVXdvaG80NHJBQitn?=
 =?utf-8?B?bVRQcGhoZkhJd2Jqd2s0NXYzS3puMW00SHljZ1A2TjBjOHRxRGFUSG5Td3VJ?=
 =?utf-8?Q?bIWM=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6312.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 73a721b6-09a4-491a-17c8-08ddb7aaf3f4
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Jun 2025 07:51:42.1092 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: jw007HVnhy1qQFXQUZ1csLWVay4YLjl5UCgzMQCus6H3pNHjF3Nc+dbrIhA8y2laGOFykF70xJfaaMCuM1ewAQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7959
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

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBpZ3QtZGV2IDxpZ3QtZGV2LWJv
dW5jZXNAbGlzdHMuZnJlZWRlc2t0b3Aub3JnPiBPbiBCZWhhbGYgT2YgS3VuYWwgSm9zaGkNCj4g
U2VudDogV2VkbmVzZGF5LCBKdW5lIDI1LCAyMDI1IDY6MDQgUE0NCj4gVG86IGlndC1kZXZAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnDQo+IENjOiBKb3NoaSwgS3VuYWwxIDxrdW5hbDEuam9zaGlAaW50
ZWwuY29tPjsgRGVhaywgSW1yZSA8aW1yZS5kZWFrQGludGVsLmNvbT47DQo+IE11cnRoeSwgQXJ1
biBSIDxhcnVuLnIubXVydGh5QGludGVsLmNvbT4NCj4gU3ViamVjdDogW1BBVENIIDQvNV0gdGVz
dHMvaW50ZWwva21zX2xpbmt0cmFpbl9mYWxsYmFjazogZXh0ZW5kIHRlc3QgZm9yIGVEUA0KPiBj
b25uZWN0b3INCj4gDQo+IFJlbmFtZSBkcC1mYWxsYmFjayBzdWJ0ZXN0IG5hbWUgdG8gbHQtZmFs
bGJhY2sgYW5kIGFkZCBhZGRpdGlvbmFsIGxvZ2ljIGluDQo+IHRlc3RfZmFsbGJhY2sgdG8gaGFu
ZGxlIGVEUCBmYWxsYmFjay4NCj4gDQo+IEluIGVEUCBmYWxsYmFjayBvbiB0aGUgaW5pdGlhbCBs
aW5rIHRyYWluaW5nIGZhaWx1cmUgZXhwZWN0YXRpb24gaXMgdG8gcmV0cnkgd2l0aCBtYXgNCj4g
bGluayByYXRlIGFuZCBtYXggbGFuZSBjb3VudCB0aGF0IGlzIHN1cHBvcnRlZCwgRnVydGhlciBm
YWlsdXJlcyBsZWFkcyB0byByZWR1Y3Rpb24NCj4gaW4gZWl0aGVyIGxpbmsgcmF0ZSBvciBsYW5l
IGNvdW50Lg0KPiANCj4gQ2M6IEltcmUgRGVhayA8aW1yZS5kZWFrQGludGVsLmNvbT4NCj4gQ2M6
IEFydW4gUiBNdXJ0aHkgPGFydW4uci5tdXJ0aHlAaW50ZWwuY29tPg0KPiBTaWduZWQtb2ZmLWJ5
OiBLdW5hbCBKb3NoaSA8a3VuYWwxLmpvc2hpQGludGVsLmNvbT4NCj4gLS0tDQo+ICB0ZXN0cy9p
bnRlbC9rbXNfbGlua3RyYWluX2ZhbGxiYWNrLmMgfCA0MyArKysrKysrKysrKysrKysrKysrLS0t
LS0tLS0tDQo+ICAxIGZpbGUgY2hhbmdlZCwgMjkgaW5zZXJ0aW9ucygrKSwgMTQgZGVsZXRpb25z
KC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEvdGVzdHMvaW50ZWwva21zX2xpbmt0cmFpbl9mYWxsYmFj
ay5jDQo+IGIvdGVzdHMvaW50ZWwva21zX2xpbmt0cmFpbl9mYWxsYmFjay5jDQo+IGluZGV4IGY4
ZWYwY2FjNC4uOGFjMzZhODZjIDEwMDY0NA0KPiAtLS0gYS90ZXN0cy9pbnRlbC9rbXNfbGlua3Ry
YWluX2ZhbGxiYWNrLmMNCj4gKysrIGIvdGVzdHMvaW50ZWwva21zX2xpbmt0cmFpbl9mYWxsYmFj
ay5jDQo+IEBAIC0xOCw4ICsxOCw4IEBADQo+ICAjaW5jbHVkZSAia21zX2RzY19oZWxwZXIuaCIN
Cj4gDQo+ICAvKioNCj4gLSAqIFNVQlRFU1Q6IGRwLWZhbGxiYWNrDQo+IC0gKiBEZXNjcmlwdGlv
bjogVGVzdCBmYWxsYmFjayBvbiBEUCBjb25uZWN0b3JzDQo+ICsgKiBTVUJURVNUOiBsdC1mYWxs
YmFjaw0KPiArICogRGVzY3JpcHRpb246IFRlc3QgTGluayBUcmFpbmluZyBmYWxsYmFjayBvbiBE
UC9lRFAgY29ubmVjdG9ycw0KPiAgICoNCj4gICAqIFNVQlRFU1Q6IGRzYy1mYWxsYmFjaw0KPiAg
ICogRGVzY3JpcHRpb246IFRlc3QgZmFsbGJhY2sgdG8gRFNDIHdoZW4gQlcgaXNuJ3Qgc3VmZmlj
aWVudCBAQCAtMzM2LDExDQo+ICszMzYsMTIgQEAgc3RhdGljIGJvb2wgZml4X2xpbmtfc3RhdHVz
X2FuZF9yZWNvbW1pdChkYXRhX3QgKmRhdGEsDQo+ICAJcmV0dXJuIHRydWU7DQo+ICB9DQo+IA0K
PiAtc3RhdGljIHZvaWQgdGVzdF9mYWxsYmFjayhkYXRhX3QgKmRhdGEsIGJvb2wgaXNfbXN0KQ0K
PiArc3RhdGljIHZvaWQgdGVzdF9mYWxsYmFjayhkYXRhX3QgKmRhdGEsIGJvb2wgaXNfbXN0LCBi
b29sIGlzX2VkcCkNCj4gIHsNCj4gIAlpbnQgb3V0cHV0X2NvdW50LCByZXRyaWVzOw0KPiAgCWlu
dCBtYXhfbGlua19yYXRlLCBjdXJyX2xpbmtfcmF0ZSwgcHJldl9saW5rX3JhdGU7DQo+ICAJaW50
IG1heF9sYW5lX2NvdW50LCBjdXJyX2xhbmVfY291bnQsIHByZXZfbGFuZV9jb3VudDsNCj4gKwlp
bnQgaXRlciA9IDA7DQo+ICAJaWd0X291dHB1dF90ICpvdXRwdXRzW0lHVF9NQVhfUElQRVNdOw0K
PiAgCWRybU1vZGVNb2RlSW5mbyAqIG1vZGVzW0lHVF9NQVhfUElQRVNdOw0KPiAgCXN0cnVjdCBp
Z3RfZmIgZmJzW0lHVF9NQVhfUElQRVNdOw0KPiBAQCAtMzY1LDYgKzM2Niw3IEBAIHN0YXRpYyB2
b2lkIHRlc3RfZmFsbGJhY2soZGF0YV90ICpkYXRhLCBib29sIGlzX21zdCkNCj4gDQo+ICAJd2hp
bGUgKCFpZ3RfZ2V0X2RwX2xpbmtfcmV0cmFpbl9kaXNhYmxlZChkYXRhLT5kcm1fZmQsDQo+ICAJ
CQkJCQkgZGF0YS0+b3V0cHV0KSkgew0KPiArCQlpdGVyKys7DQo+ICAJCWlndF9pbmZvKCJDdXJy
ZW50IGxpbmsgcmF0ZTogJWQsIEN1cnJlbnQgbGFuZSBjb3VudDogJWRcbiIsDQo+ICAJCQkgcHJl
dl9saW5rX3JhdGUsDQo+ICAJCQkgcHJldl9sYW5lX2NvdW50KTsNCj4gQEAgLTQwMCwxMCArNDAy
LDE5IEBAIHN0YXRpYyB2b2lkIHRlc3RfZmFsbGJhY2soZGF0YV90ICpkYXRhLCBib29sIGlzX21z
dCkNCj4gIAkJY3Vycl9saW5rX3JhdGUgPSBpZ3RfZ2V0X2N1cnJlbnRfbGlua19yYXRlKGRhdGEt
PmRybV9mZCwgZGF0YS0NCj4gPm91dHB1dCk7DQo+ICAJCWN1cnJfbGFuZV9jb3VudCA9IGlndF9n
ZXRfY3VycmVudF9sYW5lX2NvdW50KGRhdGEtPmRybV9mZCwNCj4gZGF0YS0+b3V0cHV0KTsNCj4g
DQo+IC0JCWlndF9hc3NlcnRfZigoY3Vycl9saW5rX3JhdGUgPCBwcmV2X2xpbmtfcmF0ZSB8fA0K
PiAtCQkJICAgICBjdXJyX2xhbmVfY291bnQgPCBwcmV2X2xhbmVfY291bnQpIHx8DQo+IC0JCQkg
ICAgICgoY3Vycl9saW5rX3JhdGUgPT0gbWF4X2xpbmtfcmF0ZSAmJg0KPiBjdXJyX2xhbmVfY291
bnQgPT0gbWF4X2xhbmVfY291bnQpICYmIC0tcmV0cmllcyksDQo+IC0JCQkgICAgICJGYWxsYmFj
ayB1bnN1Y2Nlc3NmdWxcbiIpOw0KPiArCQlpZiAoaXNfZWRwICYmIGl0ZXIgPT0gMSkgew0KPiAr
CQkJLyogZURQIGZpcnN0IHJldHJ5IG11c3Qgc3RheSBhdCBtYXgsIG5vIHJlZHVjdGlvbiAqLw0K
PiArCQkJaWd0X2Fzc2VydF9lcShjdXJyX2xpbmtfcmF0ZSwgIHByZXZfbGlua19yYXRlKTsNCj4g
KwkJCWlndF9hc3NlcnRfZXEoY3Vycl9sYW5lX2NvdW50LCBwcmV2X2xhbmVfY291bnQpOw0KPiAr
CQl9IGVsc2Ugew0KPiArCQkJLyogT3RoZXJ3aXNlIERQ4oCQc3R5bGUgZmFsbGJhY2s6IGVpdGhl
ciBzaHJpbmsgb3IgYWxsb3cNCj4gc3B1cmlvdXMgcmV0cnkgKi8NCj4gKwkJCWlndF9hc3NlcnRf
ZigoY3Vycl9saW5rX3JhdGUgIDwgcHJldl9saW5rX3JhdGUgfHwNCj4gKwkJCQkgICAgIGN1cnJf
bGFuZV9jb3VudCA8IHByZXZfbGFuZV9jb3VudCkgfHwNCj4gKwkJCQkgICAgICgoY3Vycl9saW5r
X3JhdGUgID09IG1heF9saW5rX3JhdGUgJiYNCj4gKwkJCQkgICAgIGN1cnJfbGFuZV9jb3VudCA9
PSBtYXhfbGFuZV9jb3VudCkgJiYNCj4gKwkJCQkgICAgIC0tcmV0cmllcyksDQo+ICsJCQkJICAg
ICJGYWxsYmFjayB1bnN1Y2Nlc3NmdWxcbiIpOw0KPiArCQl9DQo+IA0KPiAgCQlwcmV2X2xpbmtf
cmF0ZSA9IGN1cnJfbGlua19yYXRlOw0KPiAgCQlwcmV2X2xhbmVfY291bnQgPSBjdXJyX2xhbmVf
Y291bnQ7DQo+IEBAIC00MTMsMTAgKzQyNCwxNCBAQCBzdGF0aWMgdm9pZCB0ZXN0X2ZhbGxiYWNr
KGRhdGFfdCAqZGF0YSwgYm9vbCBpc19tc3QpDQo+IHN0YXRpYyBib29sIHJ1bl9sdF9mYWxsYmFj
a190ZXN0KGRhdGFfdCAqZGF0YSkgIHsNCj4gIAlib29sIHJhbiA9IGZhbHNlOw0KPiArCWJvb2wg
aXNfZWRwID0gZmFsc2U7DQo+ICsJYm9vbCBpc19kcCA9IGZhbHNlOw0KPiAgCWlndF9vdXRwdXRf
dCAqb3V0cHV0Ow0KPiANCj4gIAlmb3JfZWFjaF9jb25uZWN0ZWRfb3V0cHV0KCZkYXRhLT5kaXNw
bGF5LCBvdXRwdXQpIHsNCj4gIAkJZGF0YS0+b3V0cHV0ID0gb3V0cHV0Ow0KPiArCQlpc19lZHAg
PSBvdXRwdXQtPmNvbmZpZy5jb25uZWN0b3ItPmNvbm5lY3Rvcl90eXBlID09DQo+IERSTV9NT0RF
X0NPTk5FQ1RPUl9lRFA7DQo+ICsJCWlzX2RwID0gb3V0cHV0LT5jb25maWcuY29ubmVjdG9yLT5j
b25uZWN0b3JfdHlwZSA9PQ0KPiArRFJNX01PREVfQ09OTkVDVE9SX0Rpc3BsYXlQb3J0Ow0KPiAN
Cj4gIAkJaWYgKCFpZ3RfaGFzX2ZvcmNlX2xpbmtfdHJhaW5pbmdfZmFpbHVyZV9kZWJ1Z2ZzKGRh
dGEtPmRybV9mZCwNCj4gIAkJCQkJCQkJIGRhdGEtDQo+ID5vdXRwdXQpKSB7DQo+IEBAIC00MjUs
OCArNDQwLDggQEAgc3RhdGljIGJvb2wgcnVuX2x0X2ZhbGxiYWNrX3Rlc3QoZGF0YV90ICpkYXRh
KQ0KPiAgCQkJY29udGludWU7DQo+ICAJCX0NCj4gDQo+IC0JCWlmIChvdXRwdXQtPmNvbmZpZy5j
b25uZWN0b3ItPmNvbm5lY3Rvcl90eXBlICE9DQo+IERSTV9NT0RFX0NPTk5FQ1RPUl9EaXNwbGF5
UG9ydCkgew0KPiAtCQkJaWd0X2luZm8oIlNraXBwaW5nIG91dHB1dCAlcyBhcyBpdCdzIG5vdCBE
UFxuIiwgb3V0cHV0LQ0KPiA+bmFtZSk7DQo+ICsJCWlmICghKGlzX2VkcCB8fCBpc19kcCkpIHsN
Cj4gKwkJCWlndF9pbmZvKCJTa2lwcGluZyBvdXRwdXQgJXMgYXMgaXQncyBub3QgRFAvZURQXG4i
LA0KPiBvdXRwdXQtPm5hbWUpOw0KV2UgY2FuIHJlLXVzZSB0aGUgaGVscGVyIHN1Z2dlc3RlZCBp
biB0aGUgcHJldmlvdXMgcGF0Y2ggY29tbWVudHMgaGVyZS4gDQoNCj4gIAkJCQljb250aW51ZTsN
Cj4gIAkJfQ0KPiANCj4gQEAgLTQzOCwxMSArNDUzLDEyIEBAIHN0YXRpYyBib29sIHJ1bl9sdF9m
YWxsYmFja190ZXN0KGRhdGFfdCAqZGF0YSkNCj4gIAkJaWYgKGlndF9jaGVja19vdXRwdXRfaXNf
ZHBfbXN0KGRhdGEtPm91dHB1dCkpIHsNCj4gIAkJCWlndF9pbmZvKCJUZXN0aW5nIE1TVCBvdXRw
dXQgJXNcbiIsDQo+ICAJCQkJIGlndF9vdXRwdXRfbmFtZShkYXRhLT5vdXRwdXQpKTsNCj4gLQkJ
CXRlc3RfZmFsbGJhY2soZGF0YSwgdHJ1ZSk7DQo+ICsJCQl0ZXN0X2ZhbGxiYWNrKGRhdGEsIHRy
dWUsIGZhbHNlKTsNCj4gIAkJfSBlbHNlIHsNCj4gLQkJCWlndF9pbmZvKCJUZXN0aW5nIERQIG91
dHB1dCAlc1xuIiwNCj4gKwkJCWlndF9pbmZvKCJUZXN0aW5nICVzIG91dHB1dCAlc1xuIiwNCj4g
KwkJCQkgaXNfZWRwID8gImVEUCIgOiAiRFAiLA0KPiAgCQkJCSBpZ3Rfb3V0cHV0X25hbWUoZGF0
YS0+b3V0cHV0KSk7DQo+IC0JCQl0ZXN0X2ZhbGxiYWNrKGRhdGEsIGZhbHNlKTsNCj4gKwkJCXRl
c3RfZmFsbGJhY2soZGF0YSwgZmFsc2UsIGlzX2VkcCk7DQo+ICAJCX0NCj4gIAl9DQo+ICAJcmV0
dXJuIHJhbjsNCj4gQEAgLTUxMSw3ICs1MjcsNiBAQCBzdGF0aWMgdm9pZCB0ZXN0X2RzY19zc3Rf
ZmFsbGJhY2soZGF0YV90ICpkYXRhKQ0KPiAgCS8qIFJlcGVhdGVkbHkgZm9yY2UgbGluayBmYWls
dXJlIHVudGlsIERTQyBpcyByZXF1aXJlZCAob3IgbGluayBpcyBkaXNhYmxlZCkgKi8NCj4gIAl3
aGlsZSAoIWlndF9nZXRfZHBfbGlua19yZXRyYWluX2Rpc2FibGVkKGRhdGEtPmRybV9mZCwgZGF0
YS0+b3V0cHV0KSkgew0KPiAgCQltb24gPSBpZ3Rfd2F0Y2hfdWV2ZW50cygpOw0KPiAtDQo+ICAJ
CWlndF9hc3NlcnRfZihmb3JjZV9mYWlsdXJlX2FuZF93YWl0KGRhdGEsIGRhdGEtPm91dHB1dCwN
Cj4gDQo+IExUX0ZBSUxVUkVfUkVEVUNFRF9DQVBTLA0KPiAgCQkJCQkJICAgIFJFVFJBSU5fQ09V
TlQsIDEuMCwgMjAuMCksDQo+IEBAIC02MjEsNyArNjM2LDcgQEAgaWd0X21haW4NCj4gIAkJCSAg
ICAgIlVuYWJsZSB0byBkaXNhYmxlIGlnbm9yZSBsb25nIGhwZFxuIik7DQo+ICAJfQ0KPiANCj4g
LQlpZ3Rfc3VidGVzdCgiZHAtZmFsbGJhY2siKSB7DQo+ICsJaWd0X3N1YnRlc3QoImx0LWZhbGxi
YWNrIikgew0KPiAgCQlpZ3RfcmVxdWlyZV9mKHJ1bl9sdF9mYWxsYmFja190ZXN0KCZkYXRhKSwN
Cj4gIAkJCSAgICAgICJTa2lwcGluZyB0ZXN0IGFzIG5vIG91dHB1dCBmb3VuZCBvciBub25lIHN1
cHBvcnRzDQo+IGZhbGxiYWNrXG4iKTsNCj4gIAl9DQo+IC0tDQo+IDIuMjUuMQ0KDQo=
