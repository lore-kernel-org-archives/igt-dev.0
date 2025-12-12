Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85E64D49230
	for <igt-dev@archiver.kernel.org>; Fri, 12 Dec 2025 14:19:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 353F010E7FD;
	Fri, 12 Dec 2025 14:19:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Q0PO6MU8";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 12F7B10E7FD
 for <igt-dev@lists.freedesktop.org>; Fri, 12 Dec 2025 14:19:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765549146; x=1797085146;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-id:content-transfer-encoding:mime-version;
 bh=HbwW/gWiCK01iYskgdk9QSOgkSF1ay+O3E9qzE82e2k=;
 b=Q0PO6MU8yXgRSSfy+tZW/W8PGtj043Mlq+UymhUKZfezEAORDAo3uxau
 jT11sbxoJecJjyxcfMkIC28f7CB6N/h+yuM5ae0bWlQtLqo728T0KWh4F
 ZMEHolA68vYFIeod0A5MjQFiK7SCY0xHe0Ej1nNcv30/8EZBH3IuS7hmT
 oVfanQuLce0cyjzrD22H4/1AbkK31puEJj/rAw3kWvUN1yTWjzTbYkDc8
 fi1sTMg9NGkIx5TL3pkCP/rrbzTzzJlxXp54v8iq0aP6olHZ5LEUXp6QD
 2rVEvZ9GHz/dQgqEjLgcR93D168T4Vi+m5hA48O4ujlf32muwwUAIYr// g==;
X-CSE-ConnectionGUID: Yjcqgsq0SRqaUgfgau9ovw==
X-CSE-MsgGUID: DSWgCmxHRz+bY/aL8lt4dw==
X-IronPort-AV: E=McAfee;i="6800,10657,11640"; a="78189383"
X-IronPort-AV: E=Sophos;i="6.21,143,1763452800"; d="scan'208";a="78189383"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Dec 2025 06:19:06 -0800
X-CSE-ConnectionGUID: k7StPXx6QH6KhFrsjz/DfA==
X-CSE-MsgGUID: oHiU2v9eSl6o3e5PLAHqHw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,143,1763452800"; d="scan'208";a="202017975"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Dec 2025 06:19:05 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Fri, 12 Dec 2025 06:19:05 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Fri, 12 Dec 2025 06:19:05 -0800
Received: from SN4PR0501CU005.outbound.protection.outlook.com (40.93.194.70)
 by edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Fri, 12 Dec 2025 06:19:05 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ROZ68ktvbG8xl7GxTWwKgHUErC1kT1dMHIlMvoES2JY9TjciMVpR+/D41RHlnFxSXNG5B3WNDaao6b7l5IevECcAlOSlcCgtspXvxlg03alufQ0bCOqFZXAPzLYrmcQ74sAu0NE0UOI1cbzG3FRRfLA0OlCugPPtGHYGonImhsv4qqfm6neuoJhrkrGHjhtXhIL1X09MqISsfFQAuSc8om2nd4ClQV8QD7IbFZ8xu9Nvyq9AG9eGrGNroaWzdM4s1WzpEE1nzDK/iJfQ+fw+00yWYvZJoGhItfA/BAyp45sqcA159GgkFZgNmpWskbR0fWqEXdPy94nj6dAR+oSVbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HbwW/gWiCK01iYskgdk9QSOgkSF1ay+O3E9qzE82e2k=;
 b=HV4QuxcDrH+OMQ3wX/56TOUyMhWZPErvwxOV7okbJV9RUG2A1QXkqGg9jETs8tp0tVge5yOzNBRSVGVF8ShAf775lc2KqL+nBofD/L7/OMM2v++9WeXZvpT8HNzEf4/wURjLJtznRVSHnmPWHW/ky9Sg2YMMrtOrjo3Zmy5FYAFiR8yBn5apJgAtEBtD3iLCrNxZWCa12U2WDiESR6F0m/PmVr8ZAnZqWtZKNpTUQM9Y++6A1XWlCbfg0QdNrsqtBPU3Mw8qm/vlRnhQUBSW4rc1MAYVR72cpycum54itEmQ7MdKEYMTnwef/jkjAiIpD5b79xREeFtY+70XNJ4g/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from PH3PPF7DB70F9CE.namprd11.prod.outlook.com
 (2603:10b6:518:1::d33) by CY5PR11MB6090.namprd11.prod.outlook.com
 (2603:10b6:930:2e::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.10; Fri, 12 Dec
 2025 14:19:03 +0000
Received: from PH3PPF7DB70F9CE.namprd11.prod.outlook.com
 ([fe80::6b12:23d6:2632:cb04]) by PH3PPF7DB70F9CE.namprd11.prod.outlook.com
 ([fe80::6b12:23d6:2632:cb04%8]) with mapi id 15.20.9412.005; Fri, 12 Dec 2025
 14:19:03 +0000
From: "Knop, Ryszard" <ryszard.knop@intel.com>
To: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>,
 "kamil.konieczny@linux.intel.com" <kamil.konieczny@linux.intel.com>
Subject: Re: [PATCH i-g-t] intel-ci: remove few i915 symlinks
Thread-Topic: [PATCH i-g-t] intel-ci: remove few i915 symlinks
Thread-Index: AQHca3Iy0v8PVqjzX02gx45oysSBSrUeDaIA
Date: Fri, 12 Dec 2025 14:19:03 +0000
Message-ID: <bbc335a802b56fee73064a51ac1b63d49b4f5572.camel@intel.com>
References: <20251212141808.65453-1-kamil.konieczny@linux.intel.com>
In-Reply-To: <20251212141808.65453-1-kamil.konieczny@linux.intel.com>
Accept-Language: en-US, pl-PL
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH3PPF7DB70F9CE:EE_|CY5PR11MB6090:EE_
x-ms-office365-filtering-correlation-id: 9c5ec8f7-d735-4769-d84e-08de398966e1
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|376014|366016|1800799024|38070700021;
x-microsoft-antispam-message-info: =?utf-8?B?b1pvMHZubE1VN1V6bGIyRUI4V1JYN0JmNlFXMEdUKy9wVTFZV1o0WXhJL1ZO?=
 =?utf-8?B?TnMwb2MyQjROc3o1R3ZYMGU5NjBSSTBCOFZONXpOcGkyNUIxbVVtSDBXM3BD?=
 =?utf-8?B?c2M1L09GaWdoRFRYTDkrV3FQWkptZWVCL2V6TENwMDBrc1VtQVF1SGhCbU4r?=
 =?utf-8?B?QUMyWTdxTzc3N0x5bTlhYmpnRVB4SXdPMmVwZEZZRmc3YlNLSHNFMEhOZEEy?=
 =?utf-8?B?MlRHWlc4b3N0QmRHZjZZWk1nRXljWG9lak0vbEY5T2o4aWdTVVc5Q3BRRmtV?=
 =?utf-8?B?UkJ5NEFqZnhXTm5LZXdrQ1VCSmdiRkkzNk05V0JWZVVoclpoZXhtcTJZcStP?=
 =?utf-8?B?dC9ZMkk3V0pjbnhleDNkUFpBMGlkT2hmazhndDMzblpwQ2twTk5vMDdPNU5W?=
 =?utf-8?B?OHNiVk5ubGNuTGdlUUhUdlNWbXZDSVRGTFdvclZKQXZ0T2JrcUpFUWJKYmZC?=
 =?utf-8?B?aGhpaCttbTYxVUFlNkVOTllEZkxWRFhRVlpiam9DaGFxY3QySkxIM2dNYTEy?=
 =?utf-8?B?KzNPOFc5VVlUUGJzbnUwVTRDc0hVTlN3Zi9sQi84MkNSSnN5TGdtcGhmOXc0?=
 =?utf-8?B?UFJYQkhWRThxdGhCdUlCODJiWFZoejBPTkpPVE5PcXhENWtrUk53STVIb1R2?=
 =?utf-8?B?M0hvTXFwaWJSWHpBUUFycnRTQ3NiSlB5TXYzZ001MldsK2ZIU05xUXdyTk9X?=
 =?utf-8?B?VnliZkM0NG9sMm92SzlBMHUwcC93R2Y2bFF3OFdjQlprWWtnN1BOemgvWUxT?=
 =?utf-8?B?ZjFZRmhMWGhXSmdDSkxzU1dIWkwzZ3hvbU1kczJlMUdjYVVSVVlMUkxkL0dY?=
 =?utf-8?B?blRucitCU3hJYkZxK1FCK2t4Tm1sUFpReFlOZzBaM2ZaQWJDVWpqUzdxcjJ6?=
 =?utf-8?B?SWlZM2hIOTNIQVBMbzluaVVpcDY1eGF3ci9XenpXMWZ5V1pxaTFtZzFNaDFR?=
 =?utf-8?B?ejZZdk0vNm0rVVJDRUplUXRPR2ZJdENqL1ZQTGF6ZFVmcnVISm5mVkFjTzZO?=
 =?utf-8?B?NEx3NVlLRmtBSEwyeC83RmxKWXRBOTBkdjFJWTIwc2xRWmcvNGJ3Szl5NnJO?=
 =?utf-8?B?RUlVNGsvcTBvN1NhQytCZnRrUEN4RGFPN1FjeGhicDJHcU5YUWd1VFJmR2pv?=
 =?utf-8?B?VHR6VGxMSXNHTFNMZjZ3K1hEN2lXOEJqd05ZRG4zUTlFNDcwd1N1eXluUzFx?=
 =?utf-8?B?dCtwRHpBbmd3ZHJOSy9ZcHE5WmlWeFJMTXBWd1grbUZvdTNPbUNIWU5JaVNp?=
 =?utf-8?B?V2hBcDJ4SzRKTG42SzFTcmE0M3Y2aVFldzRld0hyNFhFaXkvWDgrNEVVanU3?=
 =?utf-8?B?ZUt3WTNQS1dtT2txMUhMdEVUSGFpSXV4TFBkQS9YLzZvcTJiWlN2enFiT21C?=
 =?utf-8?B?Tkk1STNzZlBhUkxPWWtDa1VVelROa3RjNm52M05mdGJXSUNhNDVKOHNveFZG?=
 =?utf-8?B?OTJ0Mkd0M0xlU0VCS2RBdlRBZ2g0Y3A0ZjB2cTc5WW9WMUhmQWNRejdtNXhl?=
 =?utf-8?B?bE5KLzhCTjNuTkZpSjIvYytTaGE1R09LR0J6TTRtcjEzRHdQaGpJNjRaT0Uz?=
 =?utf-8?B?aVV4aDFDTEd4Nm9sMFZVcm1IS3p4a2oyWDIrVisyd0VtZUtYRzlCbGN4QTBK?=
 =?utf-8?B?dy9BK1pBR1hEbENjbzNKd0tCVDVaZ0xBVlAwazlsc1FFb0M4ajByRzBndzBC?=
 =?utf-8?B?bjZ4R3Q3a0pieTJYcFhldG5YcGFObHFKS3FsSjdFMEVjRFdkOWVuSitma0Jr?=
 =?utf-8?B?WllZQVlpWWZpZklGbWEvejBnRUVYdnIwSU1sbjFoQzV0aVU3T2oyaDBsOUNw?=
 =?utf-8?B?L01yMFBKZkZtVkJFaUd5SDcxdkhIWC9aMDIxclFXRDM5WjlrcmhqcTVjN1Qw?=
 =?utf-8?B?aTBNdHJ3cS8xOG52K3RsN242MWpyTmM1MXMzcHRrQWgvK0prUGp5WEVMR3NR?=
 =?utf-8?B?cDVHMERqcTRoSDBiTnBBNDRrZUF4bGJncTJXUkRTZkVaUjkyMEFIdEtRblUr?=
 =?utf-8?B?UUVmV1Z6T0V1aTZ6Y3RaOVVRaEs5YkZiRGc1eGVxRFpnZjVpM0FiVC9tS01L?=
 =?utf-8?Q?Ynn4qn?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH3PPF7DB70F9CE.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(38070700021); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?b012TllUaWpSNDZIYVB5V3BIemk3S1cwMFF5REdBakduU2pWSTYvMU1wYVFS?=
 =?utf-8?B?SnpqQlhaMUlFaldsQmJtUmI1TW1ON0Z6Mk1yRytsSWtRZHlsTEwramxwajhU?=
 =?utf-8?B?a0p5TFRzZ3doTldaV3FKZERvVmxmeGovcHVHOExTak5jd1pCZU0xUFJtMlpj?=
 =?utf-8?B?bmYwNnU3NTBYVWtnZWpzL2U5M291QlhibzFPOENCV3RCUVY4cFdlVWdMQmJn?=
 =?utf-8?B?Mis0Yk1uY0RaYisxYkNOSGVPR3NBK2VYbWowZnBZMElEUDVEOXlvMmx3SVE1?=
 =?utf-8?B?ZFQzK0M5UEowNEw0WnFBOFZia25kMWJJSnRsb2luVDVLUUdiRk90Mmh0Z1Rs?=
 =?utf-8?B?N25MTDlxemI0VExraWNKR2V1OXpDa0d6Zk81eUNGVzQ3ZWR2cXJUZ25vTk9T?=
 =?utf-8?B?NEdmRVhpZk1FRFV0RU5uRHdIOVBXNU1uTkNKM3kxamFZR281S2ZKakRmS1lk?=
 =?utf-8?B?YklTVEo2bDB0UFJBZFJkTzROZyswU0dURC9wZU5vUnFZNWdNWFR4NUJPSlFw?=
 =?utf-8?B?VEtxdTNFOFhKVnUzR210citxL0RuS1Z4VlpuMTBQQWtUR2lnYW9wbEsyTWl5?=
 =?utf-8?B?YkduYVllN1FpTFVPMGNVY1NiVGh4ekovcGJ5Zm9sQUx5TExDZzM4ZWVDQmRD?=
 =?utf-8?B?M2E5ZkpXeFROSHNzWFl3cHVzYzF1ajBSRU1vMkdaYnN2V2w5ZjFGYUFvcVF0?=
 =?utf-8?B?VUttbTQ0cE1leDVYemkzWnFDVElhL0c4MDZWT3ZxcitUcWVRVG1NTDg5ZW8y?=
 =?utf-8?B?eld0M2RKQWIrc0JtMW5Ia253TzFoRGcxZWhEeDBTZEZWZjV4ZWcrdndNTWFJ?=
 =?utf-8?B?WWRlVU1wZmsxQ09lZmpLUE5HOWZGOTJiWE1Sc3JLVU5NcEdjUDF6WGtoaDdw?=
 =?utf-8?B?WjRaeC9mbzVndUppMUZoRW9qN2NOd1FRMVRLR1ZRWE9FWVZvaXdVSURMOE85?=
 =?utf-8?B?VUtrcDI4NVZaY08vYzUxZXRMM09qMTduV3lNUEZyMzhqSDZkemlrTUY1SWlD?=
 =?utf-8?B?dTk4Ymp3b2RZK1E5VkxFTmhEdm9wZUdsTHlXbm8rSE10a2JKLy9hNmlnUmRV?=
 =?utf-8?B?SWxEOXFoYU1PcU5kSWRGWHEzL3VYdmpTWEZTWWFKVmZ4QWFkdEVEMDJXaTFR?=
 =?utf-8?B?RzU2NTcvWWJORnZQOW5hQ0JuQXkrNHlYUVM5U0NMWHBvR1hlN0ZpU2l5STJC?=
 =?utf-8?B?TjU2TTNQNFp4RmdKUHhMRzRHWTczSzlvZ2NjaGpQQXBYRkRoWi9qUk5uVjQ5?=
 =?utf-8?B?d3IxTWwxdzZadGo1WFlhMEl1ekhwZjZSc1ZxZGp6em40cDUyd01jZWZxUEVB?=
 =?utf-8?B?R1ZlS0Q1VzFhZjNHOG4ramcvUDhEcVM5UWlJa3d4TTVwWkZmbElCMDZ2L3lZ?=
 =?utf-8?B?YS9FNG5ZWko2bDRuUHZJK0poa1pKL3BxLzFodXpQNVl4L3p2N256di9lTTln?=
 =?utf-8?B?cUJRUXk5cWFKaWZrZnBDZURXeGZiemhHbFY4QnF5SHdwc0c1WmRuR3p5R1Bm?=
 =?utf-8?B?VGtiQTlaV1I5Wm14Y0hhcEZBM1Z5MXhwc2V2cERRSzN6NGdwL0J3Wm80VEor?=
 =?utf-8?B?MDY3anBJbXZ3Q3dIdjZoRTM0bFJQdG1uVlRCUGI2V2tkeGIvZkU4c0ZWdkUz?=
 =?utf-8?B?UUpJRlIrRG9HTEFQVjFkN25sZTlkZnlmUXFHaUhWeE5TZWt4N0RQYmJ5SnlY?=
 =?utf-8?B?RXh2blhIVzVHQTE5Q2NmNDJzTThpSHNWRXh3RHpJeGM1U0Rucm1MN1RUais3?=
 =?utf-8?B?L0dLOUtzcDBWNGFDdFlKTzhPOHJWTGExUy9zSC9uQnpPRzhFUDVWZ1ZNWFlw?=
 =?utf-8?B?ZFN2Y0Z1SFkzTW8vSkZZQWhPZ2pCaHBmZEpNU1UveVEvMXJVMU15QTlTMHRJ?=
 =?utf-8?B?bFVKUEJsdFZyM1l3UzZtKy9HTk13dkZHQ3pQQWwvSXBVMFdHZ2JqdXZOUm5i?=
 =?utf-8?B?RWhIbmdjeUJMZklTWXFrSFBNTnR5Y3ZKQmw3ZVJoODlJM25OY0EwOGVVcUx3?=
 =?utf-8?B?aW40L3BQQjN0TnozVjdCUkFaS3hVZVZObXJBZEFsOHRjUnV1MXByNkN3eHg3?=
 =?utf-8?B?b1VGU21SMUMwdEI3WTFkZkFqM095T0R6bHBmTkY4YzNLbDZraldaMnVWcWd0?=
 =?utf-8?B?amJud2hsd3ZYUUVCeVBNb1BYZVJuK2xuaHF5cC9HenNVTjFLQ2EvNjRFZ3c4?=
 =?utf-8?B?bXc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <969B0B8E81B86B408615778183B1B003@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH3PPF7DB70F9CE.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9c5ec8f7-d735-4769-d84e-08de398966e1
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Dec 2025 14:19:03.2495 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: bFiKVCiETCJ6EwtWacmjHr+jkv6vRKVnmPCO42a0Nl/Z2Edmia/G1F2JE8UlRgyOxRVBrZqPBF8x3VzbVn3IEg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6090
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

UmV2aWV3ZWQtYnk6IFJ5c3phcmQgS25vcCA8cnlzemFyZC5rbm9wQGludGVsLmNvbT4NCg0KT24g
RnJpLCAyMDI1LTEyLTEyIGF0IDE1OjE4ICswMTAwLCBLYW1pbCBLb25pZWN6bnkgd3JvdGU6DQo+
IFJlbW92ZSBzeW1saW5rcyB0byBpOTE1IGJsb2NrbGlzdHMuDQo+IA0KPiBDYzogUnlzemFyZCBL
bm9wIDxyeXN6YXJkLmtub3BAaW50ZWwuY29tPg0KPiBTaWduZWQtb2ZmLWJ5OiBLYW1pbCBLb25p
ZWN6bnkgPGthbWlsLmtvbmllY3pueUBsaW51eC5pbnRlbC5jb20+DQo+IC0tLQ0KPiAgdGVzdHMv
aW50ZWwtY2kvYmxhY2tsaXN0LXByZS1tZXJnZS50eHQgfCAxIC0NCj4gIHRlc3RzL2ludGVsLWNp
L2JsYWNrbGlzdC50eHQgICAgICAgICAgIHwgMSAtDQo+ICB0ZXN0cy9pbnRlbC1jaS9tZXNvbi5i
dWlsZCAgICAgICAgICAgICB8IDIgLS0NCj4gIDMgZmlsZXMgY2hhbmdlZCwgNCBkZWxldGlvbnMo
LSkNCj4gIGRlbGV0ZSBtb2RlIDEyMDAwMCB0ZXN0cy9pbnRlbC1jaS9ibGFja2xpc3QtcHJlLW1l
cmdlLnR4dA0KPiAgZGVsZXRlIG1vZGUgMTIwMDAwIHRlc3RzL2ludGVsLWNpL2JsYWNrbGlzdC50
eHQNCj4gDQo+IGRpZmYgLS1naXQgYS90ZXN0cy9pbnRlbC1jaS9ibGFja2xpc3QtcHJlLW1lcmdl
LnR4dCBiL3Rlc3RzL2ludGVsLWNpL2JsYWNrbGlzdC1wcmUtbWVyZ2UudHh0DQo+IGRlbGV0ZWQg
ZmlsZSBtb2RlIDEyMDAwMA0KPiBpbmRleCAxMjRhMzFkYmYuLjAwMDAwMDAwMA0KPiAtLS0gYS90
ZXN0cy9pbnRlbC1jaS9ibGFja2xpc3QtcHJlLW1lcmdlLnR4dA0KPiArKysgL2Rldi9udWxsDQo+
IEBAIC0xICswLDAgQEANCj4gLWk5MTUuYmxvY2tsaXN0LXByZS1tZXJnZS50eHQNCj4gXCBObyBu
ZXdsaW5lIGF0IGVuZCBvZiBmaWxlDQo+IGRpZmYgLS1naXQgYS90ZXN0cy9pbnRlbC1jaS9ibGFj
a2xpc3QudHh0IGIvdGVzdHMvaW50ZWwtY2kvYmxhY2tsaXN0LnR4dA0KPiBkZWxldGVkIGZpbGUg
bW9kZSAxMjAwMDANCj4gaW5kZXggZmZhNjU4OTI3Li4wMDAwMDAwMDANCj4gLS0tIGEvdGVzdHMv
aW50ZWwtY2kvYmxhY2tsaXN0LnR4dA0KPiArKysgL2Rldi9udWxsDQo+IEBAIC0xICswLDAgQEAN
Cj4gLWk5MTUuYmxvY2tsaXN0LnR4dA0KPiBcIE5vIG5ld2xpbmUgYXQgZW5kIG9mIGZpbGUNCj4g
ZGlmZiAtLWdpdCBhL3Rlc3RzL2ludGVsLWNpL21lc29uLmJ1aWxkIGIvdGVzdHMvaW50ZWwtY2kv
bWVzb24uYnVpbGQNCj4gaW5kZXggYmFjYTIwYmExLi45MDZiZjUzNTEgMTAwNjQ0DQo+IC0tLSBh
L3Rlc3RzL2ludGVsLWNpL21lc29uLmJ1aWxkDQo+ICsrKyBiL3Rlc3RzL2ludGVsLWNpL21lc29u
LmJ1aWxkDQo+IEBAIC0yLDggKzIsNiBAQA0KPiAgDQo+ICBpbnRlbGNpX2ZpbGVzID0gWw0KPiAg
ICAnUkVBRE1FJywNCj4gLSAgJ2JsYWNrbGlzdC50eHQnLA0KPiAtICAnYmxhY2tsaXN0LXByZS1t
ZXJnZS50eHQnLA0KPiAgICAnY2hhbWVsaXVtLW9ubHkudGVzdGxpc3QnLA0KPiAgICAnZmFzdC1m
ZWVkYmFjay50ZXN0bGlzdCcsDQo+ICAgICdmYXN0LWZlZWRiYWNrLWNoYW1lbGl1bS1vbmx5LnRl
c3RsaXN0JywNCg==
