Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94582C2BBCA
	for <igt-dev@archiver.kernel.org>; Tue, 25 Jun 2024 10:55:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD20410E152;
	Tue, 25 Jun 2024 10:55:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="l5KanxDz";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C216B10E05A
 for <igt-dev@lists.freedesktop.org>; Tue, 25 Jun 2024 10:55:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1719312955; x=1750848955;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=plTdElU/DtY1kmGDyNaR8gaYEKq2fbADqgpfqUfTD1E=;
 b=l5KanxDzT80qeEkCxVwTIfB/mkK3RFjxa/bNkQVEi2er1uxZcdqJ96n/
 +sj+mMDpjH/R8xgrlorD0qA8UB4KEFmDeEpJAYHGCqfRP6NYGWB0wGSoY
 2vKeAYupigSMaS4LsgaNsVL6jNYoV8G6/H16/5onmYYS+CKuhOy/Z4ASn
 ceNPfaI+8hBgnTvOLcIPuiLrInBJrT6XscSNZlI04NYUQKBIHB3wsNjQo
 IcaAx0zFra6Pe7ptzNSVLQ36FGEU9WfvAkt+4cb6DMXcqOJKWMqWsuDUu
 92SWzwBnJemRPqXfnyZr75h3e0MxYM0X0oxlqCM8HsiHzZfyWhSJPALA9 Q==;
X-CSE-ConnectionGUID: soc0HmuuSWWyrMRLEAj+Zg==
X-CSE-MsgGUID: soPr767PSjyjHnbzMDmK1Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11113"; a="27458303"
X-IronPort-AV: E=Sophos;i="6.08,263,1712646000"; d="scan'208";a="27458303"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jun 2024 03:55:53 -0700
X-CSE-ConnectionGUID: Q1O8glvNTey/SnEAFmudVw==
X-CSE-MsgGUID: hmqbC5iRSr+SNNRguZR3Kg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,263,1712646000"; d="scan'208";a="48524780"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orviesa003.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 25 Jun 2024 03:55:53 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 25 Jun 2024 03:55:52 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 25 Jun 2024 03:55:51 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 25 Jun 2024 03:55:51 -0700
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.40) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 25 Jun 2024 03:55:51 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fTBWKJs+1CmwXKOBxX1uzEkF7TwC1fYwrMvTlq6ZQ3McOfSrfR40SO2vWFiK0mXILgp0R9uDW/JlWCh0YUH0ZeRIBkT0MNvrSAL5rE8TD33iiv7gs8cPmkxwT3QH0QHpovrWZ8VF375xP6KEpdMyP6O4rFlY9XgpF1jOQb9l3ZX7alsTqqN01Zcl5Q9eEfCWARkw5/hOWAfW9M7PO+dGVIIsJz9BCTCAx2FZUocqhv4tUmTAzauJiir/HA3nk2fELp9Wz2ZqWqd1/mwgBjK7bOtwDKwLCDE57eZmDut2lV2fXe5b/m1+lMGJbeD5HTmk7xl5NUMrY0oI88PZcl1arw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=plTdElU/DtY1kmGDyNaR8gaYEKq2fbADqgpfqUfTD1E=;
 b=bzAgWtRjR39UC2T7YXnfVAkEfW3Tuw4Wy6tEm+T33t61kubmJK+zvMkBq4Y+5vvkCX2jVcFpig2UDs8LjVoSUvp0DUi89A0uQqeoW9mBON+WtTJqTpZ1dxU6w2ECTMsja+OTA1BmYXm9hSDTtoFyn2jPgZRfgVDwojp1nyzq7Ky1VYKw0XTecyNI+4pJSpCMlHjGfnkTvcp2+oxeu6Jhwv7+2QYhcZW8J6D/F7AZrNOKJeM+/G/NndGFTUEOsS3Gd+thQQ8wgFMG2P8GJnFaQJ3auQwfHzS0kO3xSQGLpd+0V+fP/MMt0dx4+jhC0JVAe3fVRjdgbh93Gb7Gx+qOEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5655.namprd11.prod.outlook.com (2603:10b6:8:28::10) by
 IA1PR11MB6124.namprd11.prod.outlook.com (2603:10b6:208:3ec::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7698.19; Tue, 25 Jun
 2024 10:55:48 +0000
Received: from DM8PR11MB5655.namprd11.prod.outlook.com
 ([fe80::f6db:9044:ad81:33d9]) by DM8PR11MB5655.namprd11.prod.outlook.com
 ([fe80::f6db:9044:ad81:33d9%5]) with mapi id 15.20.7698.025; Tue, 25 Jun 2024
 10:55:48 +0000
From: "Saarinen, Jani" <jani.saarinen@intel.com>
To: "B, Jeevan" <jeevan.b@intel.com>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>
CC: "Hogander, Jouni" <jouni.hogander@intel.com>, "Konieczny, Kamil"
 <kamil.konieczny@intel.com>, "B, Jeevan" <jeevan.b@intel.com>
Subject: RE: [PATCH i-g-t 1/2] lib/igt_psr: Added library functions for early
 trasport
Thread-Topic: [PATCH i-g-t 1/2] lib/igt_psr: Added library functions for early
 trasport
Thread-Index: AQHaxmFT3fz187tiaUybuMzQBUk9NLHYT1Qw
Date: Tue, 25 Jun 2024 10:55:48 +0000
Message-ID: <DM8PR11MB565532D88AA383AD8B38B709E0D52@DM8PR11MB5655.namprd11.prod.outlook.com>
References: <20240624181533.1600552-1-jeevan.b@intel.com>
 <20240624181533.1600552-2-jeevan.b@intel.com>
In-Reply-To: <20240624181533.1600552-2-jeevan.b@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR11MB5655:EE_|IA1PR11MB6124:EE_
x-ms-office365-filtering-correlation-id: ce9e0d66-7e8f-4a95-2233-08dc95055f47
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230037|1800799021|376011|366013|38070700015;
x-microsoft-antispam-message-info: =?utf-8?B?U0wvckFibTdPUG14c1JmMTkxNUpybHU0L3I2S3JBRy9nRk1aR0dhS1oxUllh?=
 =?utf-8?B?M2JlQU5URXFWK1FkcmEwY2dkUC9PMFhXVjVIZEppTE5aUTdqQUFHYmFjS2Nn?=
 =?utf-8?B?Nmh5RDF4OW85MUR3V1JsM0pWWmZiQzdFdkwzYUlnWXJUMm9icVU1aVNGYzE3?=
 =?utf-8?B?ZWpJc001YytFN0IxSmxBQXphKy9mT1pjY1JXT3FMdDVLL1kraWVicEJnV2cy?=
 =?utf-8?B?OGRzYjIydCtkSCtZZGZJM2JONWlaK0FOMzJJWlcxTTlkQzJ6NEFNSTNKZnBL?=
 =?utf-8?B?ZHBkc1ptRk1DNFpRaG50Qi9BSGYvdU5JZGZBcFJlU1BpczhvaFg0bVBESDMw?=
 =?utf-8?B?SUJnMTNWV0pzNGVxQkFDTGFkYStuL0ZkTllta2I4dklyTkxWQitvSVJzRk5R?=
 =?utf-8?B?azRYdHdtMjJCam1iQXk4SC9maHp0L29rYlJpb001dTI2RGtQeS9kU0hMNmxD?=
 =?utf-8?B?bkZFamNXLytDTmg3OVA2Tktzb0dYOCsrQW5FWDM1VG5oQ1NRaVErcmo3TFlQ?=
 =?utf-8?B?OHpSbENGblhaby8rbFhWdVowVFpvY2FFQjRCR2ZiVXIrczlGOGlZN0xPYXF1?=
 =?utf-8?B?RXp3WXpDa3d4cDFmV2RVcDRFQndTb0RCR0lFZE91L1Q1M2Vqb1dDbG9iUjly?=
 =?utf-8?B?MUZ4VHNzQVlIRTEvS2xLRG9BMWVDaGREbzJXaUhsRFU5R0piRlZ4TUFSN0Na?=
 =?utf-8?B?ZWtDaHRHcWtyd1l4VXRDaXBTbmEwK1hYMXljZ2twZzY2K0Q0UVhIVitlS3Z5?=
 =?utf-8?B?dzNwZkdkUlUzc1dkV0VWaUU1YWgrbXVBamczMC9uSHAvVlpXTmltWUs1MGQ0?=
 =?utf-8?B?aXlkbkpjNEVQQ3c5elNXTGg4RERqbC8wSjhKRXJpMm1YaG4yRTU3dTNwVmlS?=
 =?utf-8?B?VGN1VkkzYjkzdVd1bXp0eE9XWkJaSW5FUGhtNFBLeXdhbUZNWit6VHRFZmhI?=
 =?utf-8?B?WEwvQzh1L3M2V0F6a042UWwrRmFWa2RJOHNqUlpLMUFrTFpTY1ZOcThIVXhZ?=
 =?utf-8?B?eDROcEFxWEl5dHdZSDdqbWFUdFJlWkY2YjErQ2M5bDNGVXVpQWhYekFIR1F1?=
 =?utf-8?B?eXA2dlVOSzE2VUgzcVE3dHA5SXAreS8yUk8veHBBTTdIaFc4d0gxallVYW1J?=
 =?utf-8?B?L1Jic2lHdEpxNXpjM3BvWGRYdkJSaS9aNVJiSmN2ZlFRTXphQk82T1djVWlV?=
 =?utf-8?B?VS9DVkQ3SkQ1S09jU1AvTTQydW1Ld21SRHV2NjBhbWltL1B4Qzg3aDIrUVdB?=
 =?utf-8?B?amZuN2FFOTRLL3lvVWJQRTg4c1Zab1ludi9GYlJuR0Yrd1A1ZU96a3ZwYUFN?=
 =?utf-8?B?b0ZreHIvTUltcVdiNUhNQWh4eHBBUDdNL3FIcEVHbWJ4blQwcS8ybWtQWlpv?=
 =?utf-8?B?SXlNVlR0OWJQLzdMZWlTREFEdzNJVGg1ZzJxWTBWVEpFcHkwN0ZYSkl2Z0lJ?=
 =?utf-8?B?TUpQTFB4Q1dLa2xqYkR1YXRpcWozYndzbkxQelVOc2VMeitCM24xdW90a2hl?=
 =?utf-8?B?SzBYcGRjNHpDRXBveHdLYzJjaGd3dzJ4MzVYbVphZisvMmkvMXA3cXNzcWN5?=
 =?utf-8?B?U05lRElLeUF6VjJlVERpNFZQQU03dDBiVXVpaXlUcFA1M3NtU0h3djlXcHVQ?=
 =?utf-8?B?RzVNWm1TZ3lLT3E1MndRRVRqbW5aVGZza1J6UXJTZ1NLU01vaVlpMlAvSnhn?=
 =?utf-8?B?TU1OMWsydGg5RDIyTnpUemlHTWVwTGtMVjF1UThjMWwwYnByTEpqRmdycEpB?=
 =?utf-8?B?M3g5c3RTWHFKK0dxNCtxdnNnbU5WUmZadGNqTXdxN0pOa2s5K1V2UndsMTU1?=
 =?utf-8?Q?EjYSM6sB6QGPB9JCO3bDk5hz7G4NcaIuP2Pws=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5655.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230037)(1800799021)(376011)(366013)(38070700015); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?MUVUTkN6Q0l4d1c5UU9kc3RuWXlmdStCYURJdThneFBTTVpHVDZ3V0tiTlIz?=
 =?utf-8?B?bllOZEtMekhraG9tMW9xTUNQR0ZFbTlnN3MvVTdVbWhIdGtsSkNWYWgzM0lL?=
 =?utf-8?B?MnllZFJUa3lOQmY5eW5nZS9WRno5TVc1bjJ3M1Z1RVk2MHkvQjdycjV6amc3?=
 =?utf-8?B?KzhqRXBEN1o1SDFHdVNNNWxCVlZSRkdQY3hrSXl3MHp4TmFncmk4SDNpR3J1?=
 =?utf-8?B?ak9oRGxIUTkxR0Z5K04yWnQzNlFsbENjbEE3b29zMmJzL3NuWU5STzRCaG5u?=
 =?utf-8?B?ajFNS2pORGNSbFdVV292c2hoSlh0NzZjaERvM1ZCSk1rNGhLaEpldS9McFV4?=
 =?utf-8?B?R25md01KWklpNFZzdE5qSU50VXZzc0pVTG1oSE51MnhkeitvdFZoWHRxYk9x?=
 =?utf-8?B?UUR1QW1FQXJ0Z2ZwN09RMGpUQ1BhWHMzVXdKblVDT0EvSGlMQ0x0dGsrem5v?=
 =?utf-8?B?YzZraU1wZW1NRzU0VGVhS1p1c2RCeGYxK253d2h4RlZpQ2cxeEVGVUlPUHdN?=
 =?utf-8?B?dFZKOVJKdHFjczdnNklKdE9sZ0ZHR1FHTy82cUl2TWgxZ0k5bmcrV1hNRVV2?=
 =?utf-8?B?MS9aWkNQQk03WXBCVlhsRVNNTGJocW5CV0hFOHNvL01sandZZ0taNER5a0Qr?=
 =?utf-8?B?eHAyV2pINDBOS0c5UUVNaWFlcUZaVWI0dHMrS2R4S2VFQm5oOFNPZEl4WXJj?=
 =?utf-8?B?cFBLZUIvZTFabEMwOURLU1BST1BEeDRoQWF0YlFua1ZQU214ZVJ4cG9CajhO?=
 =?utf-8?B?dWxYMVplaGdFWWNkY2gvTHZUNFhrMStpRWxKOUVYdkRDenhINlBUUzNtSUFv?=
 =?utf-8?B?aXJoTkg4TjJLa2FjTkxRWEVrSFZuWjVCUXl4UGlKQ2NZcnZodE9sek4wUVBl?=
 =?utf-8?B?Rk5PRjVrYklGUTBteng4OXNOQzhmUkptTzJUd3NPZ3pRWjVIemoveFpZM0ND?=
 =?utf-8?B?N0ptQ2RISXp2dWs5WE8ydExxVDhRU1MwRmNQTzI4SDI0dG4zVU9pUnRlcUwv?=
 =?utf-8?B?YjBTZkRVdUw1empkVkM5K3dvVEcwL01QbVR6WXlXa3psWVNWVmNVaDJLdkF2?=
 =?utf-8?B?d29zc0pBNnV1UEtiMk9tZDBjNm1xaTFibks3OWFBTEJ6Vnpic1VscDFYc3Nv?=
 =?utf-8?B?MG5uMVBYTmljaTBXeW1PZFViMUFScUpSZ003aTUxeUtRVUowUktkekdmQVhk?=
 =?utf-8?B?UWxZSU9FaXNHRWk4WXIyZERpVDgyN1NaVjlCN2xHK3pNQmovckgyZFRVbjU5?=
 =?utf-8?B?bE9nMG1naTREZkQ1RWh0bGJKbU5KRU1rS2MvNXBRakp1UUhKb21ZaER6Qmhv?=
 =?utf-8?B?NDFWcVVWWUdmbU4xY01DTzhzNjUrUk9GTVl6dCsrTWlEcERTRFFOYnFYMUd6?=
 =?utf-8?B?WjB1bFlYR3picG51ZTI4ZEVBMGZNUUgraGFRTkwzbkxUcHRwL25SNjNrMkFz?=
 =?utf-8?B?a21tQlBOUFZuNStTOEN0SHpTUEhOenIyS2FmaDFFTCtZM1BNZXJNU1JhazNY?=
 =?utf-8?B?d2J5bDJzc3pUbVlEQnBWbzdmQzRPQkNyUmlrQ000QlQvMW9leXlkb1liMGoy?=
 =?utf-8?B?U2s2cjc0TloydEszbHVNWU5OcUM1YW1aQWE0cGJwYmZZZVRCVFBvdStyamlC?=
 =?utf-8?B?aGxSbnpOamZNeFhEMEtQSS9HVWsvVDhpMXltQnROUWY1b290QWFFQjFxbW5N?=
 =?utf-8?B?clVEUkZMSFYzNXUrUVloM2s0QkFhTFJEK0NUVUhzREpUZzNyMFdkZHJ1ajBR?=
 =?utf-8?B?bCtGQ29hKzE3bkxLS1dtV1QvNWVZUStuVFlDUU9aOHdUem41ZnVYbzFiOWlT?=
 =?utf-8?B?ekg0WjFtb1NhZ2QrbnRWSHhkYklHSGsreG1vSEhGR3ZwNHFMcmhOcVlnbGdE?=
 =?utf-8?B?MmtjVmxyNVRudXp0ZlVZajJiZm4wYWM3RHBNTHZ4ZG9IaWczSjR3S2JVVjlK?=
 =?utf-8?B?WWpaYUJ1TGNpSDRhUGErZjN4cHdYNmo4cllqWklRUlllOWpOeHdDU1ptS1pY?=
 =?utf-8?B?QzF0b21UNFVqYXc2NDRkdmtWbzgxcDVmYTRjSytqWmRnakpLY1lnMlpVMGNI?=
 =?utf-8?B?bmxXOCtSMGp2WXN0V0I0SUFVcHFQNGVhMjM5MktSOFIrSXJQL0hTYTdYUFFl?=
 =?utf-8?Q?rjjMSNRCNfPmG79gVUOxc0/KR?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5655.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ce9e0d66-7e8f-4a95-2233-08dc95055f47
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Jun 2024 10:55:48.5243 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: foMm1YCgl4WGVC41rT2icFg4JKTes37cm7vPdYlSW0LLFklGbRSVTtuSeXGakgZIe+gl7fd6Vmis979gZaK7Mg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6124
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

SGksIA0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBpZ3QtZGV2IDxpZ3Qt
ZGV2LWJvdW5jZXNAbGlzdHMuZnJlZWRlc2t0b3Aub3JnPiBPbiBCZWhhbGYgT2YgSmVldmFuIEIN
Cj4gU2VudDogTW9uZGF5LCAyNCBKdW5lIDIwMjQgMjEuMTYNCj4gVG86IGlndC1kZXZAbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnDQo+IENjOiBIb2dhbmRlciwgSm91bmkgPGpvdW5pLmhvZ2FuZGVyQGlu
dGVsLmNvbT47IEtvbmllY3pueSwgS2FtaWwNCj4gPGthbWlsLmtvbmllY3pueUBpbnRlbC5jb20+
OyBCLCBKZWV2YW4gPGplZXZhbi5iQGludGVsLmNvbT4NCj4gU3ViamVjdDogW1BBVENIIGktZy10
IDEvMl0gbGliL2lndF9wc3I6IEFkZGVkIGxpYnJhcnkgZnVuY3Rpb25zIGZvciBlYXJseSB0cmFz
cG9ydA0KDQpzLyB0cmFuc3BvcnQvIHRyYW5zcG9ydA0KDQo+IA0KPiBBZGRlZCBoZWxwZXIgZnVu
Y3Rpb25zIHRvIGNoZWNrIHNpbmsgc3VwcG9ydCBmb3IgZWFybHkgdHJhbnNwb3J0IGFuZCBjaGVj
aw0KPiBlYXJseSB0cmFuc3BvcnQgYWN0aXZlIGNoZWNrLg0KPiANCj4gdjI6IEFkZCBlYXJseSB0
cmFzcG9ydCBmb3IgUFIgYW5kIFBTUjIuDQpTYW1lIGhlcmUNCg0KPiB2MzogRml4IGNoZWNrIHN0
cmluZ3MuDQo+IHY0OiBBZGQgZGVzY3JpcHRpb24gdG8gbGlicmFyeSBmdW5jdGlvbiBhbmQgY29y
cmVjdHN0cmluZyBsb2dpYy4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6IEplZXZhbiBCIDxqZWV2YW4u
YkBpbnRlbC5jb20+DQo+IC0tLQ0KPiAgbGliL2lndF9wc3IuYyB8IDE5ICsrKysrKysrKysrKysr
KysrKysNCj4gIGxpYi9pZ3RfcHNyLmggfCAgMyArKysNCj4gIDIgZmlsZXMgY2hhbmdlZCwgMjIg
aW5zZXJ0aW9ucygrKQ0KPiANCj4gZGlmZiAtLWdpdCBhL2xpYi9pZ3RfcHNyLmMgYi9saWIvaWd0
X3Bzci5jIGluZGV4IDYwMDhiNzNhNi4uZGM4NTA0MmIyIDEwMDY0NA0KPiAtLS0gYS9saWIvaWd0
X3Bzci5jDQo+ICsrKyBiL2xpYi9pZ3RfcHNyLmMNCj4gQEAgLTUzLDYgKzUzLDE5IEBAIGJvb2wg
c2VsZWN0aXZlX2ZldGNoX2NoZWNrKGludCBkZWJ1Z2ZzX2ZkLA0KPiBpZ3Rfb3V0cHV0X3QgKm91
dHB1dCkNCj4gIAlyZXR1cm4gc3Ryc3RyKGJ1ZiwgIlBTUjIgc2VsZWN0aXZlIGZldGNoOiBlbmFi
bGVkIik7ICB9DQo+IA0KPiArLyoNCj4gKyAqIENoZWNrcyBpZiBFYXJseSBUcmFuc3BvcnQgaXMg
ZW5hYmxlZCBpbiBQU1Igc3RhdHVzIGJ5IHJlYWRpbmcgdGhlIGRlYnVnZnMuDQo+ICsgKi8NCj4g
K2Jvb2wgZWFybHlfdHJhbnNwb3J0X2NoZWNrKGludCBkZWJ1Z2ZzX2ZkKSB7DQo+ICsJY2hhciBi
dWZbUFNSX1NUQVRVU19NQVhfTEVOXTsNCj4gKw0KPiArCWlndF9kZWJ1Z2ZzX3NpbXBsZV9yZWFk
KGRlYnVnZnNfZmQsICJpOTE1X2VkcF9wc3Jfc3RhdHVzIiwgYnVmLA0KPiArCQkJCXNpemVvZihi
dWYpKTsNCj4gKw0KPiArCXJldHVybiBzdHJzdHIoYnVmLCAiZW5hYmxlZCAoRWFybHkgVHJhbnNw
b3J0KSIpOyB9DQo+ICsNCj4gIHN0YXRpYyBib29sIHBzcl9hY3RpdmVfY2hlY2soaW50IGRlYnVn
ZnNfZmQsIGVudW0gcHNyX21vZGUgbW9kZSwNCj4gaWd0X291dHB1dF90ICpvdXRwdXQpICB7DQo+
ICAJY2hhciBkZWJ1Z2ZzX2ZpbGVbMTI4XSA9IHswfTsNCj4gQEAgLTI0NywxMCArMjYwLDE2IEBA
IGJvb2wgcHNyX3Npbmtfc3VwcG9ydChpbnQgZGV2aWNlLCBpbnQgZGVidWdmc19mZCwNCj4gZW51
bSBwc3JfbW9kZSBtb2RlLCBpZ3Rfb3V0cHV0DQo+ICAJCSAgICAgICBzdHJzdHIoYnVmLCAiU2lu
ayBzdXBwb3J0OiB5ZXMgWzB4MDRdIikgfHwNCj4gIAkJICAgICAgIChzdHJzdHIobGluZSwgIlBT
UiA9IHllcyIpICYmDQo+ICAJCSAgICAgICAoc3Ryc3RyKGxpbmUsICJbMHgwM10iKSB8fCBzdHJz
dHIobGluZSwgIlsweDA0XSIpKSk7DQo+ICsJY2FzZSBQU1JfTU9ERV8yX0VUOg0KPiArCQlyZXR1
cm4gc3Ryc3RyKGJ1ZiwgIlNpbmsgc3VwcG9ydDogeWVzIFsweDA0XSIpIHx8DQo+ICsJCSAgICAg
ICAoc3Ryc3RyKGxpbmUsICJQU1IgPSB5ZXMiKSAmJg0KPiArCQkJIHN0cnN0cihsaW5lLCAiWzB4
MDRdIikpOw0KPiAgCWNhc2UgUFJfTU9ERToNCj4gIAkJcmV0dXJuIHN0cnN0cihsaW5lLCAiUGFu
ZWwgUmVwbGF5ID0geWVzLCBQYW5lbCBSZXBsYXkgU2VsZWN0aXZlDQo+IFVwZGF0ZSA9IG5vIik7
DQo+ICAJY2FzZSBQUl9NT0RFX1NFTF9GRVRDSDoNCj4gIAkJcmV0dXJuIHN0cnN0cihsaW5lLCAi
UGFuZWwgUmVwbGF5ID0geWVzLCBQYW5lbCBSZXBsYXkgU2VsZWN0aXZlDQo+IFVwZGF0ZSA9IHll
cyIpOw0KPiArCWNhc2UgUFJfTU9ERV9TRUxfRkVUQ0hfRVQ6DQo+ICsJCXJldHVybiBzdHJzdHIo
bGluZSwgIlBhbmVsIFJlcGxheSBTZWxlY3RpdmUgVXBkYXRlID0geWVzIChFYXJseQ0KPiArVHJh
bnNwb3J0KSIpOw0KPiAgCWRlZmF1bHQ6DQo+ICAJCWlndF9hc3NlcnRfZihmYWxzZSwgIkludmFs
aWQgcHNyIG1vZGVcbiIpOw0KPiAgCQlyZXR1cm4gZmFsc2U7DQo+IGRpZmYgLS1naXQgYS9saWIv
aWd0X3Bzci5oIGIvbGliL2lndF9wc3IuaCBpbmRleCBlODU5NWZkOGMuLmE3ZWJkMDczOSAxMDA2
NDQNCj4gLS0tIGEvbGliL2lndF9wc3IuaA0KPiArKysgYi9saWIvaWd0X3Bzci5oDQo+IEBAIC0z
NSw4ICszNSwxMCBAQCBlbnVtIHBzcl9tb2RlIHsNCj4gIAlQU1JfTU9ERV8xLA0KPiAgCVBTUl9N
T0RFXzIsDQo+ICAJUFNSX01PREVfMl9TRUxfRkVUQ0gsDQo+ICsJUFNSX01PREVfMl9FVCwNCj4g
IAlQUl9NT0RFLA0KPiAgCVBSX01PREVfU0VMX0ZFVENILA0KPiArCVBSX01PREVfU0VMX0ZFVENI
X0VULA0KPiAgCVBTUl9ESVNBQkxFRCwNCj4gIH07DQo+IA0KPiBAQCAtNDcsNiArNDksNyBAQCBl
bnVtIGZiY19tb2RlIHsNCj4gDQo+ICBib29sIHBzcl9kaXNhYmxlZF9jaGVjayhpbnQgZGVidWdm
c19mZCk7ICBib29sIHNlbGVjdGl2ZV9mZXRjaF9jaGVjayhpbnQNCj4gZGVidWdmc19mZCwgaWd0
X291dHB1dF90ICpvdXRwdXQpOw0KPiArYm9vbCBlYXJseV90cmFuc3BvcnRfY2hlY2soaW50IGRl
YnVnZnNfZmQpOw0KPiAgYm9vbCBwc3Jfd2FpdF9lbnRyeShpbnQgZGVidWdmc19mZCwgZW51bSBw
c3JfbW9kZSBtb2RlLCBpZ3Rfb3V0cHV0X3QNCj4gKm91dHB1dCk7ICBib29sIHBzcl93YWl0X3Vw
ZGF0ZShpbnQgZGVidWdmc19mZCwgZW51bSBwc3JfbW9kZSBtb2RlLA0KPiBpZ3Rfb3V0cHV0X3Qg
Km91dHB1dCk7ICBib29sIHBzcl9sb25nX3dhaXRfdXBkYXRlKGludCBkZWJ1Z2ZzX2ZkLCBlbnVt
DQo+IHBzcl9tb2RlIG1vZGUsIGlndF9vdXRwdXRfdCAqb3V0cHV0KTsNCj4gLS0NCj4gMi4yNS4x
DQoNCg==
