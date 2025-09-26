Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC4EBCAC5AC
	for <igt-dev@archiver.kernel.org>; Fri, 26 Sep 2025 05:04:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 55EF110E305;
	Fri, 26 Sep 2025 05:04:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Lgez1tZf";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F093C10E305
 for <igt-dev@lists.freedesktop.org>; Fri, 26 Sep 2025 05:04:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758863079; x=1790399079;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=8IzgVtTQymHh+4aSfipfg0VMMlxJrTd0YKIdheXAYXo=;
 b=Lgez1tZfZ3pPjFnmT2oKwByRAj0t5WNCkIqvw7tmC2NW6EWjZEMpLg+U
 vsBJqQwyqk+iONOnXvh0YC1O5kby0lxjzMeFXYxqQJ9M1DQvidOLbKNs8
 z9YGoV/IF/2n8zp7odIPuj/gNIlph/tujDMAjHHKX8NK3R2bBFSOQ7G1D
 Bem47u0YLviHyukanPLTs1hv7vikkrSkDa0P8N3xI/IoJjebYaSDUZa4B
 3264qpgR2CHrW9ot8GE/2IPDVPwev9bDkyEdymuYoAlXoypfF6o5PFmGS
 UBYv4Zj14uhkEBf7sMN7ydOAsMqzrc6JICC9PFutUKPc5f4oIa8ule8R6 Q==;
X-CSE-ConnectionGUID: AZC5iMZsQsC6iJa1/yKm5A==
X-CSE-MsgGUID: yR5XIP91RpS36WSQMKpzaQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="65003692"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="65003692"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Sep 2025 22:04:38 -0700
X-CSE-ConnectionGUID: hecxe+3rRDeWgC8cgN1VgQ==
X-CSE-MsgGUID: kbJo1YJpTLae2OH/2Pij4w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,294,1751266800"; d="scan'208";a="176789266"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Sep 2025 22:04:38 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 25 Sep 2025 22:04:37 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Thu, 25 Sep 2025 22:04:37 -0700
Received: from CY7PR03CU001.outbound.protection.outlook.com (40.93.198.46) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 25 Sep 2025 22:04:37 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fZ/6uh8IlZC8ewhIaW+r8gL/pSaBOEQtXofw4vdjgfpigwyBIjTshy4GZZGFl1r2OzpQ5w6HBjURWoxARZqPvD9IrM7R6gMlNGmBuWNdF33r+jqudipJGTl7vz/Bce0kJQYg3ctOGOpUZPgBxk0FAID1MSyPWvh7d4HxqvPS3Q4viwSMhZWONbkk73dzvQO9002FeoUY/AdsFCRlyZeImwxsmri+i9W/iilhToYUlYzQS4MZ+PFeuNSkSIG0hY5b2wxnXYzql1CZ3udQymc+b1iOU0F77tO4IEj328ObnPC8/9CM/Goy9iNajqbXL4DuzIie4RVwns92R2Lp2vPqqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8IzgVtTQymHh+4aSfipfg0VMMlxJrTd0YKIdheXAYXo=;
 b=PErdyVDlrLvz+2/i8ggnay884cegNsKRpBfbo9WtCUiUPmn+IEnUSC/AiLwyirzd96rtEiLNwIwlRP52xrkDe7aCXkqzDtLC6fV666L7Ow5m6NH7hm054vpj/cZ8UyPXIMm8TRDO2wvzFeLl29hhfLV5sHDvd4V5T4YMkXaLQGk+0p+jCAmLYvzfCosKLm3grA7D/++0tBS+q4lD33mAYLydBk8mYgvaI6A1bgnLfP430g1gLz0TgZUv//wPGAE98yfWYiGHxj64J+nz991BCjieQaBMN+5Ytqdg+64Zh6ow2WIEJpxEzCMWkAo203Cv8H2PVfm6CNsq6HLg0oTiww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB6019.namprd11.prod.outlook.com (2603:10b6:8:60::5) by
 PH0PR11MB7522.namprd11.prod.outlook.com (2603:10b6:510:289::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9160.10; Fri, 26 Sep 2025 05:04:35 +0000
Received: from DM4PR11MB6019.namprd11.prod.outlook.com
 ([fe80::fc1:e80f:134c:5ed2]) by DM4PR11MB6019.namprd11.prod.outlook.com
 ([fe80::fc1:e80f:134c:5ed2%5]) with mapi id 15.20.9160.008; Fri, 26 Sep 2025
 05:04:35 +0000
From: "Hogander, Jouni" <jouni.hogander@intel.com>
To: "kamil.konieczny@linux.intel.com" <kamil.konieczny@linux.intel.com>
CC: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, "B,
 Jeevan" <jeevan.b@intel.com>
Subject: Re: [PATCH i-g-t v2] lib/igt_psr: Use 10x timeouts in simulation
 environment
Thread-Topic: [PATCH i-g-t v2] lib/igt_psr: Use 10x timeouts in simulation
 environment
Thread-Index: AQHcLgL9J/4UNhR3BUKMriMvB/gBwLSj7mkAgAD7HIA=
Date: Fri, 26 Sep 2025 05:04:34 +0000
Message-ID: <40a0fc07c97fc6a2b75706c2cbaa55de467b89c8.camel@intel.com>
References: <20250925095820.3769042-1-jouni.hogander@intel.com>
 <20250925140350.k57eupsfh7wqevid@kamilkon-DESK.igk.intel.com>
In-Reply-To: <20250925140350.k57eupsfh7wqevid@kamilkon-DESK.igk.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB6019:EE_|PH0PR11MB7522:EE_
x-ms-office365-filtering-correlation-id: d91707d4-6a05-4dbc-4d3f-08ddfcba2fb3
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|10070799003|376014|366016|1800799024|38070700021; 
x-microsoft-antispam-message-info: =?utf-8?B?YUp3ZzRBS29maTRTTlJBa3pzbEY1a0EzclRhQkJ6L3Rpbk1XWjJPc1hzaDYz?=
 =?utf-8?B?c3I1U3U2ZUNSTVBzRWdzaGlUS3Q1TUhhZ05qbThQTnU3YldpQ091M2dtVlFa?=
 =?utf-8?B?Z21HSmlaSTdMSEJyTC92dXc0Z2oxK3R4SGx3R1FndjliNVM2U3hPYkYwVWoy?=
 =?utf-8?B?R1JhbktVV3o0SnY5NjlnUlY5T2M2cmw1N2NzQllxbWZpajgwbmVuMG9lU1Z3?=
 =?utf-8?B?ZFgrUWlMUE5TRW9DeU5Od3A3eEhiTXh3U3Qybnh3UnlxdkxoMTdWbk9YdSt3?=
 =?utf-8?B?cGxDUkpVRzdaZ0ppelFtSlVPaXRsVXh5R2piVTIvcnAxdHBvanJNRHU3dkZN?=
 =?utf-8?B?WlBYMjlzWUk1M2ZDR0wyR0lVQ2pFdDFMbVlDMWUxa3l4bGluZ002Q1Z3eVNn?=
 =?utf-8?B?dDhMRk9MSmcvUm5VZ3VUUHRkb3lXakRqU1puWHdSMG5ocGdyUnRLMVBPdC9B?=
 =?utf-8?B?V2d5ZnhnN3hqWlZBSTJIeGp6a0dMbHN2OG1RbGJyNWtEQVRwWWFDSUVRUnJZ?=
 =?utf-8?B?UzdkUDFXK251cDd0cVVaUythRDhsRCtYMTJOZmZpdytvSkp4aDUzT3BuSW82?=
 =?utf-8?B?VUFwV3RpOHRwRitycXpEcGdON09yblc2YXJxT1JTNVRHRjlTakNPZHNidUVI?=
 =?utf-8?B?elhEcUEvSUVOY1pZaG0vUXU4N1ViWmVSSG5VY2ZjUmNHSlBObzNQL1BEVnpD?=
 =?utf-8?B?UGtlMTAwS0JZVnlIRm5PVDZ6WFI0WVNBNU9FaDFKS0c3czRPVzZJUmR3SU9Z?=
 =?utf-8?B?MGRKUGFleEpCWi9zRHhJRUMvRHphUEZnNEcvSFdSNGlDREJwYW5FRXRxWEZ3?=
 =?utf-8?B?Nm1VUWJMampYeXVNSlJZUnZLYVZrWkRveDlDRTdCR01rMm1DdUNwcUxyYmdw?=
 =?utf-8?B?VEdsK0FjRk1uSUxodyswRHRveitnb1BoZlFaMUo4QUt0MkFFRTViUDY5Zldo?=
 =?utf-8?B?UFVQbXpxVnpodmVaV0pjOTMxRzJoVzBKbi9wTVhDdWRyRTdxWTc0VExhTkVB?=
 =?utf-8?B?UDczVXZuVFVYOEg2bkJXczNob0xRMFdyNDArSFRVYllWOVZIVGpxS2lYeVVE?=
 =?utf-8?B?Nmd4dU9aSE43NDBFZ2FSeWVmWlFIRWNIV0ZlWDJmU2JEZzM2dnZOWnFpTGQ2?=
 =?utf-8?B?MUxFbHQ0U2dEbDJKZnZ4ZitKQnVvT3RwSEJKZkp3RXJrVTJvRGhvNGV6aUdD?=
 =?utf-8?B?eDdJVVpCZ0pBcnBVbjNQUFp3UTR5RGszenYvRXZETUVnbEFpQndMZFRVRmR5?=
 =?utf-8?B?ZjllVFcwc0NNeG1TUVdOdWZFcWdSVGl4Y0d6cFpOZ05aN3RUTFZGRWhvVUND?=
 =?utf-8?B?ZkdZYitPbHF4UVE2UXgvLzBheTNPV0gxQlFRT05sU3k2L2FjY3FQNUpnWEVs?=
 =?utf-8?B?THVMZ29helVUY0RxZFQ3T2JRTkswNXFxNEh5MkNVcmlEWW4ybUNGY2prL2Rk?=
 =?utf-8?B?T2diTGt1cEJaMUtMcGZidit4TElaeGVvN1Z6SGU0YmVwQmxrTWEyUEVRNGsr?=
 =?utf-8?B?amlhQXl1dFQvWkRZa1g2ekVtZm5idDdWa1YxVGRkVDJvTEg3czJIb0RTOCtN?=
 =?utf-8?B?K3d2cVFHR3dNNGIybk01QXA2OEpaUjRlYlJ3d2trRGx3SWY2ZUJkYmtNcTI0?=
 =?utf-8?B?dUxhRzFHeWtuOURuWXBKcHNtZVErblBlOE5XZWgvUVpOa01qdlRnaWZhN0U2?=
 =?utf-8?B?eWE4ZWQ4Sm9mVjB5V3VEUGFCaHRXWkFCUVQ1Ylg0TGhGODhmTFF5L0tWOFE4?=
 =?utf-8?B?SGJMOHFTYWszZS9VRVg5WWg1QUY1YzJ6MlJDaFVwSmEvVkNBdWNNVXcwdmJj?=
 =?utf-8?B?d29kZDNjL09YSGRYWFI4dUM2TW9Cek9xRHFubkYzY3RBZVBveUtLRENZL01X?=
 =?utf-8?B?Z0V5NjBFanZISlZwcjZSNk9pSStkcXI0M2Z6aHgvblRKVytpdnJua0psUGdu?=
 =?utf-8?B?V2VCM2xtVzVmcGJ5b3o2ZmhHNnRzSWk1b1dEU1RHVktKS1BDWGhxKytPNWM1?=
 =?utf-8?B?cUYzdnZndGxESEpHWlRraHlRbkoveEtUemNlaG9pc0V5aFUwdUNYYU1ON0w5?=
 =?utf-8?Q?rN4s+O?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB6019.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(10070799003)(376014)(366016)(1800799024)(38070700021); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?OWE5YWczTTlabGRHck9qNC9mcTkzSjZXaEFRcFdUeCtzWi9yVlhENzBGdHV3?=
 =?utf-8?B?U2NXT2xqOG1sbWhGb0Rzd1pUbTM1cklyaENjc2hvMzAwM2hXTWtCWW5ETlIx?=
 =?utf-8?B?aVFqU1dwODczdlZMbGJGVjN6OVRnR0NpMERrTExVRGkyMEhxVDcza2E0UXVI?=
 =?utf-8?B?ZDBFaG1oWGVBRnA3UHp5d1l6dkVUcm8yekt1b1pxSDBYM2p3bzJCZGkvbG14?=
 =?utf-8?B?SnJXSFh3eDFxcGo1c1NGc012cjFBTFFEaEo1MStvZ0FCQ1k1MzdXZm9DcUN0?=
 =?utf-8?B?K0luWEhVWnFaZTBWT3hKakN3cGRIbDZLZm5TQVdGMnRVTStGZXRrQndNTzJ5?=
 =?utf-8?B?ZVFWekljSWNySml6NFk1SnI1OVNFK0M4eGpBYkV3UFJHZnBMeVo5c3ZLNTUw?=
 =?utf-8?B?blJjMXV3cWJFMEt2eTdjUEJhaU5GOXV1T1RCdjh5N0FkNWJVaEdsd0wzZ21C?=
 =?utf-8?B?N3ViTU5LU3ZTVVNJTWZEVjB4MVFINUp6akVIMlh6WklGY0hkUEtPOGM4TG82?=
 =?utf-8?B?dnppVVB1bzJGK1d6bEJhWHdQSTF1cnFsTzlla1czeUVNMlhWMHllWGc2ZW0y?=
 =?utf-8?B?d0JiWEV4bUgwVzNrdU1QZG53bzRza3FJa2hWSHdXZWxYRlUvNkxGUnlxdFZz?=
 =?utf-8?B?dzVnRHM1WFU3SzFScnhvYzl6cDIxdURRcHZLRnBXQ3NSd3BrSVdYM0xJemtk?=
 =?utf-8?B?V0RvQXFqTEJsY0FyLzRZemo3anJ4YUVZNHl6UTJGd24yaVMvcUpmTGJGMTIv?=
 =?utf-8?B?T0prcC9BUXNsZG5FQXlWUk5sTWVDOCt4aitTMEszaUV1b2V4Z2NxbGhDYjBq?=
 =?utf-8?B?aDVLMTM2dVd1cGxad1RaMVl1bU5WeVhzOHlSblc5dGg2NzQzRDFRQUJiYXZB?=
 =?utf-8?B?ZnRDYU51OTREQjJnbTlvckV0aFRnckJTTTF4ZGRoc1daQ1lrbWNHQUxIYzhp?=
 =?utf-8?B?bDJtNDJlMHFVNmI0eFAzb1FQcGduanZSNndYS0RFRnorcUI1dTRpVStIdTBw?=
 =?utf-8?B?VktpbzlWOHVCSFNNZ1lFNlFMMFBEV1ZCWWwrTnlaMlM1OGVielJ2YnUyaW9W?=
 =?utf-8?B?YkliaXpDS01nUlhLczMzQm4xTDNNN3hrbjJ4dVVnZnA5TnR4a1hsanVSTy9E?=
 =?utf-8?B?MGY3RFYrQ0oxaWRjQVRvZUpUckMwWENUZmFlNEhYcThieFE4elphS0k1Zkor?=
 =?utf-8?B?emhKelo2ZFFrRTlyZDhZVW5kamhqRmVoMnhicXRxYWNURVQxcXVFUHVTcVBV?=
 =?utf-8?B?UmFrZWNxMlBRVk1KMmI0UW1YYUl5T29Ia2tESHlFa28zZ2NaYkdHdzJ6dzNs?=
 =?utf-8?B?eW5NY2sxemJxalFwVS9wUFBrcWVKd28vUFJtZUoyYjRvK3JPWTIzdkd5TnBX?=
 =?utf-8?B?QzgwZjg3ZTl0dGNCWWsvbmtVVFBsN0xvQ3llbGY0R3pyRWFmSHN3bWZxd1VX?=
 =?utf-8?B?ckx5aDZpcGtKS3l3M3NaZVZRK3BUdTVMK3lNdEtWZU9VSHo5eXVsYVo0OVBj?=
 =?utf-8?B?cndRcjBvTko3dzdiWnJCUVFUL1Q0a3ZmSlFZQ1piUEhqZE5ibUFMUzZBaFk1?=
 =?utf-8?B?NEFob1M1VGNtdGNxVVRMQktKaHBqYUxYcXI1RkJra1Y3T0tianM5Z1VEMXpZ?=
 =?utf-8?B?cFEwRGF6TS9zQnZYZVBrZWVGTFBzMUIzcFVjMTNSRmorSlo4RDVSdjFvWUk5?=
 =?utf-8?B?a2tuYVg4S25XTzJSWFVsQzRxTm5TMzZOd0lFcVowWXVwUXMvZFptSzNVOU8w?=
 =?utf-8?B?RXI1dlRnNStyVFlSNC94OUk3OHBDOGZ6aGFQMHZVaU1qZXZmZ05LdU1naldz?=
 =?utf-8?B?WmhVNkhCZ2xRclI2elNSZlZVVTVuK0x4TVUwZnloY21JMW8wU1RYa3dMSlZQ?=
 =?utf-8?B?b1JNVWEvckJodHJFQ01XTUVJeUhUV2JmMlhoaVEzZXNyTkJLYzQvNmhFcXhH?=
 =?utf-8?B?TXhORTNuSElBcjJEdEtxcmxWdy9BRmdNZWp3SXdtMjR4aTQwZERtSy91b3cz?=
 =?utf-8?B?dzk2L2l1UUNoc2p2aDRCSWo3Y1hHanhxVGJ2SWkrZ2pYZC9yT25sZDdOVWlk?=
 =?utf-8?B?UXkyRjV1Z3hzeDBNUUI3UTIyb3k5RXFmRXhaU0Jmd21uMjF5WXMxTi9haC8w?=
 =?utf-8?B?WmEyNmFaYzZVMmRwMTdmL3BNYUdBdEMxOWZ0Zms3NXpLSE15WkYzR0lSZEJk?=
 =?utf-8?B?cnVVeUlFMlN3cGpDYTN2bEpnTFFmVXdLdk43bWpTbzFudDZyeVRKbVZlb3lV?=
 =?utf-8?B?NEdtalJQNjlWWXo4M3NHdnNCVldBPT0=?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <7830880D8330214D9D932E9DBAC1E4F6@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6019.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d91707d4-6a05-4dbc-4d3f-08ddfcba2fb3
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Sep 2025 05:04:35.0629 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 3bvCqVRs5d5hVFSj67DH1JRa9M6Rw/DoQC+a5J1q0yhv9n9GEAlVEQPBDnyELy5S2M9NgwIEySsRuHToY3CSFOwSzXBXc7WDWcQ99VjIQjs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB7522
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

T24gVGh1LCAyMDI1LTA5LTI1IGF0IDE2OjAzICswMjAwLCBLYW1pbCBLb25pZWN6bnkgd3JvdGU6
DQo+IEhpIEpvdW5pLA0KPiBPbiAyMDI1LTA5LTI1IGF0IDEyOjU4OjIwICswMzAwLCBKb3VuaSBI
w7ZnYW5kZXIgd3JvdGU6DQo+ID4gUFNSIHRlc3RzIGFyZSB0aW1lb3V0aW5nIGluIHNpbXVsYXRp
b24gZW52aXJvbm1lbnQuIFVzZSAxMCBhcyBhDQo+ID4gbXVsdGlwbGllcg0KPiA+IGZvciB0aW1l
b3V0cyBpbiBzaW11bGF0aW9uIGVudmlyb25tZW50Lg0KPiA+IA0KPiA+IHYyOiBmaXggb3BlcmF0
b3IgcHJlY2VkZW5jZSBwcm9ibGVtDQo+ID4gDQo+ID4gU2lnbmVkLW9mZi1ieTogSm91bmkgSMO2
Z2FuZGVyIDxqb3VuaS5ob2dhbmRlckBpbnRlbC5jb20+DQo+ID4gLS0tDQo+ID4gwqBsaWIvaWd0
X3Bzci5jIHwgMTIgKysrKysrKy0tLS0tDQo+ID4gwqAxIGZpbGUgY2hhbmdlZCwgNyBpbnNlcnRp
b25zKCspLCA1IGRlbGV0aW9ucygtKQ0KPiA+IA0KPiA+IGRpZmYgLS1naXQgYS9saWIvaWd0X3Bz
ci5jIGIvbGliL2lndF9wc3IuYw0KPiA+IGluZGV4IGQ1YjQxOThjMy4uYzAzMDQyODk5IDEwMDY0
NA0KPiA+IC0tLSBhL2xpYi9pZ3RfcHNyLmMNCj4gPiArKysgYi9saWIvaWd0X3Bzci5jDQo+ID4g
QEAgLTEzNiwxMiArMTM2LDE0IEBAIHN0YXRpYyBib29sIHBzcl9hY3RpdmVfY2hlY2soaW50IGRl
YnVnZnNfZmQsDQo+ID4gZW51bSBwc3JfbW9kZSBtb2RlLCBpZ3Rfb3V0cHV0X3QgKm8NCj4gPiDC
oAlyZXR1cm4gYWN0aXZlOw0KPiA+IMKgfQ0KPiA+IMKgDQo+ID4gKyNkZWZpbmUgUFNSX1RJTUVP
VVQodGltZW91dCkJKGlndF9ydW5faW5fc2ltdWxhdGlvbigpID8gMTAgOiAxDQo+ID4gKiAodGlt
ZW91dCkpDQo+IA0KPiBUaGlzIGlzIHRoZSBzYW1lLCBubyBmaXggaGVyZSE/DQoNClRoaXMgd2Fz
IG1pc3Rha2UuIEknbSBzb3JyeSBmb3IgaW5jb252ZW5pZW5jZS4gSSBoYXZlIG5vdyBzZW50IG5l
dw0KdmVyc2lvbi4NCg0KQlIsDQoNCkpvdW5pIEjDtmdhbmRlcg0KDQo+IA0KPiBSZWdhcmRzLA0K
PiBLYW1pbA0KPiANCj4gPiArDQo+ID4gwqAvKg0KPiA+IMKgICogRm9yIFBTUjEsIHdlIHdhaXQg
dW50aWwgUFNSIGlzIGFjdGl2ZS4gV2Ugd2FpdCB1bnRpbCBERUVQX1NMRUVQDQo+ID4gZm9yIFBT
UjIuDQo+ID4gwqAgKi8NCj4gPiDCoGJvb2wgcHNyX3dhaXRfZW50cnkoaW50IGRlYnVnZnNfZmQs
IGVudW0gcHNyX21vZGUgbW9kZSwNCj4gPiBpZ3Rfb3V0cHV0X3QgKm91dHB1dCkNCj4gPiDCoHsN
Cj4gPiAtCXJldHVybiBpZ3Rfd2FpdChwc3JfYWN0aXZlX2NoZWNrKGRlYnVnZnNfZmQsIG1vZGUs
DQo+ID4gb3V0cHV0KSwgNTAwLCAyMCk7DQo+ID4gKwlyZXR1cm4gaWd0X3dhaXQocHNyX2FjdGl2
ZV9jaGVjayhkZWJ1Z2ZzX2ZkLCBtb2RlLA0KPiA+IG91dHB1dCksIFBTUl9USU1FT1VUKDUwMCks
IDIwKTsNCj4gPiDCoH0NCj4gPiDCoA0KPiA+IMKgYm9vbCBwc3Jfd2FpdF91cGRhdGUoaW50IGRl
YnVnZnNfZmQsIGVudW0gcHNyX21vZGUgbW9kZSwNCj4gPiBpZ3Rfb3V0cHV0X3QgKm91dHB1dCkN
Cj4gPiBAQCAtMTUzLDkgKzE1NSw5IEBAIGJvb2wgcHNyX3dhaXRfdXBkYXRlKGludCBkZWJ1Z2Zz
X2ZkLCBlbnVtDQo+ID4gcHNyX21vZGUgbW9kZSwgaWd0X291dHB1dF90ICpvdXRwdXQpDQo+ID4g
wqAJICovDQo+ID4gwqAJaWYgKG91dHB1dCAhPSBOVUxMICYmDQo+ID4gwqAJwqDCoMKgIG91dHB1
dC0+Y29uZmlnLmNvbm5lY3Rvci0+Y29ubmVjdG9yX3R5cGUgPT0NCj4gPiBEUk1fTU9ERV9DT05O
RUNUT1JfRGlzcGxheVBvcnQpDQo+ID4gLQkJcmV0dXJuIGlndF93YWl0KHBzcl9hY3RpdmVfY2hl
Y2soZGVidWdmc19mZCwgbW9kZSwNCj4gPiBvdXRwdXQpLCA0MCwgMSk7DQo+ID4gKwkJcmV0dXJu
IGlndF93YWl0KHBzcl9hY3RpdmVfY2hlY2soZGVidWdmc19mZCwgbW9kZSwNCj4gPiBvdXRwdXQp
LCBQU1JfVElNRU9VVCg0MCksIDEpOw0KPiA+IMKgCWVsc2UNCj4gPiAtCQlyZXR1cm4gaWd0X3dh
aXQoIXBzcl9hY3RpdmVfY2hlY2soZGVidWdmc19mZCwNCj4gPiBtb2RlLCBvdXRwdXQpLCA0MCwg
MSk7DQo+ID4gKwkJcmV0dXJuIGlndF93YWl0KCFwc3JfYWN0aXZlX2NoZWNrKGRlYnVnZnNfZmQs
DQo+ID4gbW9kZSwgb3V0cHV0KSwgUFNSX1RJTUVPVVQoNDApLCAxKTsNCj4gPiDCoH0NCj4gPiDC
oA0KPiA+IMKgYm9vbCBwc3JfbG9uZ193YWl0X3VwZGF0ZShpbnQgZGVidWdmc19mZCwgZW51bSBw
c3JfbW9kZSBtb2RlLA0KPiA+IGlndF9vdXRwdXRfdCAqb3V0cHV0KQ0KPiA+IEBAIC0xNjcsOSAr
MTY5LDkgQEAgYm9vbCBwc3JfbG9uZ193YWl0X3VwZGF0ZShpbnQgZGVidWdmc19mZCwgZW51bQ0K
PiA+IHBzcl9tb2RlIG1vZGUsIGlndF9vdXRwdXRfdCAqb3V0cA0KPiA+IMKgCSAqLw0KPiA+IMKg
CWlmIChvdXRwdXQgIT0gTlVMTCAmJg0KPiA+IMKgCcKgwqDCoCBvdXRwdXQtPmNvbmZpZy5jb25u
ZWN0b3ItPmNvbm5lY3Rvcl90eXBlID09DQo+ID4gRFJNX01PREVfQ09OTkVDVE9SX0Rpc3BsYXlQ
b3J0KQ0KPiA+IC0JCXJldHVybiBpZ3Rfd2FpdChwc3JfYWN0aXZlX2NoZWNrKGRlYnVnZnNfZmQs
IG1vZGUsDQo+ID4gb3V0cHV0KSwgNTAwLCAxKTsNCj4gPiArCQlyZXR1cm4gaWd0X3dhaXQocHNy
X2FjdGl2ZV9jaGVjayhkZWJ1Z2ZzX2ZkLCBtb2RlLA0KPiA+IG91dHB1dCksIFBTUl9USU1FT1VU
KDUwMCksIDEpOw0KPiA+IMKgCWVsc2UNCj4gPiAtCQlyZXR1cm4gaWd0X3dhaXQoIXBzcl9hY3Rp
dmVfY2hlY2soZGVidWdmc19mZCwNCj4gPiBtb2RlLCBvdXRwdXQpLCA1MDAsIDEpOw0KPiA+ICsJ
CXJldHVybiBpZ3Rfd2FpdCghcHNyX2FjdGl2ZV9jaGVjayhkZWJ1Z2ZzX2ZkLA0KPiA+IG1vZGUs
IG91dHB1dCksIFBTUl9USU1FT1VUKDUwMCksIDEpOw0KPiA+IMKgfQ0KPiA+IMKgDQo+ID4gwqBz
dGF0aWMgc3NpemVfdCBwc3Jfd3JpdGUoaW50IGRlYnVnZnNfZmQsIGNvbnN0IGNoYXIgKmJ1ZiwN
Cj4gPiBpZ3Rfb3V0cHV0X3QgKm91dHB1dCkNCj4gPiAtLSANCj4gPiAyLjQzLjANCj4gPiANCg0K
