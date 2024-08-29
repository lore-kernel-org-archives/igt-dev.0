Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B80CC7EE3A
	for <igt-dev@archiver.kernel.org>; Thu, 29 Aug 2024 08:24:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA81210E615;
	Thu, 29 Aug 2024 08:24:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hYgTc/P9";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3182310E5AE
 for <igt-dev@lists.freedesktop.org>; Thu, 29 Aug 2024 07:15:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724915709; x=1756451709;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=1Zy08SZ9J3Eco5+fIe6JkSrCM2/ZpM2NspauEpD9hsI=;
 b=hYgTc/P9xLIjsKpTtEWltcPA1R6jc3cEDY0dFpGT0+uKBB91YKM0Ccyi
 lvHK/R8NSCVRCJbVB2goKtsiSn/j6OIrihGsgbNc75q/VAoqqP8hyv7cQ
 /PomIlJgSpJfZ2MNnvb7STSTiiiwr7ihO7SMew+T9lfmc6QwZ6iakyyqD
 CHjVHZ6nf2w0aD0g+y8yDtsFoQRcRZuo1xHviozPRHJmSrRvXEH0GXBak
 FmyVgTD+WlzXyq3o+fWvTdoyNn7yFVlJIIiM4o1Fy3RT++qtqx3y/eJvp
 Y89yczhfK0f/6D/w67HU25hWu2R46E01sRw7vHFSAzq94uuJmhbVMORGi g==;
X-CSE-ConnectionGUID: +CJVO42fQvyvgDd+I5+2rQ==
X-CSE-MsgGUID: zXtR5YuwTc23BZHBIpOWtw==
X-IronPort-AV: E=McAfee;i="6700,10204,11178"; a="27364603"
X-IronPort-AV: E=Sophos;i="6.10,185,1719903600"; d="scan'208";a="27364603"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Aug 2024 00:15:08 -0700
X-CSE-ConnectionGUID: ohNOIyWbQk2m3RQP0iZnYA==
X-CSE-MsgGUID: wzIZJEA0S4KvmybBDMgaOg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,185,1719903600"; d="scan'208";a="64175691"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orviesa008.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 29 Aug 2024 00:14:50 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 29 Aug 2024 00:14:48 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 29 Aug 2024 00:14:48 -0700
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.41) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 29 Aug 2024 00:14:47 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wDS4EgtlJpr5lwFc73SPnB8UIevJUSXcZGRpZyXpYiIKCEqfgdKnq/YMW1uaArdQv1McV9UGlZyhwxF414u+zkpM664TnWtfESQ9ASHWLXV7ORUJrCTzbbnlzOf3U4pLMysqL8eVmAWvhy90Yba9gGrxNpHpQWlk4n+50Puc4uXbjD1EAVEA7ry9vj3/hbzZMsb/s1MI5orv3X8quc56+FycAYoztVeQ173yrlXVxGb8hmylihFSBf3pTUhkVAOm7e6/BKh45qT8d2+dkz3yYTAlqAwIch6o62cqbB6WYCQ0/c1yyReuybl/IbJNmqr577WEFKytyr7EmOtxSIuc8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1Zy08SZ9J3Eco5+fIe6JkSrCM2/ZpM2NspauEpD9hsI=;
 b=uX4VR1HJe9/K4qIvK5ClxYDkioXBFfzBFuok7ucY5O+eFvRFJxpIioBNdP4bkZA/lXNIcTEhlfocORWXSoOb3KuFk+1I57bK5tLM3Zcfjm2UmsKzLru3kgJQU8sXKJ5aNLkt07NNpPpZDLYrNzVHUtZVhnfvqVBBmjR9tNXd09bJl6w+o26zYRbGG90x3gkzx+5R8BNWrZYJNuTbfObtxV7JUoJbq8at2PGFYFewoo02p5bNrLtZknFVerNeum52tzVgPR8V+nvPeBBqPP2wPGFWdoVUUpUE/y5IgBdLQEdzdacav1elH2grbURxzlALlLZcniZc4/8FUuEASvX8Cw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5686.namprd11.prod.outlook.com (2603:10b6:8:21::11) by
 SN7PR11MB7092.namprd11.prod.outlook.com (2603:10b6:806:29b::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.28; Thu, 29 Aug
 2024 07:14:40 +0000
Received: from DM8PR11MB5686.namprd11.prod.outlook.com
 ([fe80::164e:21c2:c4f6:7379]) by DM8PR11MB5686.namprd11.prod.outlook.com
 ([fe80::164e:21c2:c4f6:7379%6]) with mapi id 15.20.7897.027; Thu, 29 Aug 2024
 07:14:40 +0000
From: "Tahvanainen, Jari" <jari.tahvanainen@intel.com>
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "Musial, Ewelina" <ewelina.musial@intel.com>, Helen Koike
 <helen.koike@collabora.com>, Petri Latvala <adrinael@adrinael.net>, Rob Clark
 <robdclark@gmail.com>
Subject: RE: [PATCH i-g-t v2] runner/settings: set PRUNE_KEEP_ALL as default
Thread-Topic: [PATCH i-g-t v2] runner/settings: set PRUNE_KEEP_ALL as default
Thread-Index: AQHa9XeXp5YPCBaP5EORvZEbFzWjHbI92bcQ
Date: Thu, 29 Aug 2024 07:14:40 +0000
Message-ID: <DM8PR11MB56869C3BB17ABABAD44D7B0C98962@DM8PR11MB5686.namprd11.prod.outlook.com>
References: <20240823161409.79198-1-kamil.konieczny@linux.intel.com>
In-Reply-To: <20240823161409.79198-1-kamil.konieczny@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR11MB5686:EE_|SN7PR11MB7092:EE_
x-ms-office365-filtering-correlation-id: 75a720e1-349a-4817-c360-08dcc7fa3fcc
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?K2R1U0xralEyZG16QTlqbm9ZTndIQk9rSUd4RllDNmp4OEVvOWpVTGRBcFR3?=
 =?utf-8?B?Z2ZrM2RabEV3OWtKUzBoYzk3dWg0R1k1TDhiUUFVSFpoT2tNWkZ1K2EvdDNW?=
 =?utf-8?B?T1lRYkdsbG9tWmtPRUQ0ckt0STk3Z3U2NVZobWVkRzA4OTlGdnMwbUx3TWFD?=
 =?utf-8?B?NVlrNERKQ2hndHlZemVWcGxrc2Rqb2tUM1ppUWgwalpPNkRyd2hpM0tFbGlm?=
 =?utf-8?B?Vzl0WDdtdFZjSEs0Yk1odXVCeHNnVFY5em1UaDF2SnRpQXp4YWVscHNpd2tq?=
 =?utf-8?B?MHp3VHF3VG5WODdURUd0V29GSUxEcEVpQnlMdVhPU0dDU2VsQU1MRk5RYjlG?=
 =?utf-8?B?WWxFdmxJc1hEaGdUUUtHd3RIRjFXS3p1T25lY0ZkeFFrVWVDRkU1L3JIak1Z?=
 =?utf-8?B?M3M0V21yb1o0dkc5TXUzNmc4a2xpcHovVlJKVG4wOW5LcHc3Z2VHUlBPMFkv?=
 =?utf-8?B?cWQ0MlRoZzF6V1BpaXFBQVlPN3NGN2RwSkVmSHBoT2cyQk9EcmJIVWJIVVdu?=
 =?utf-8?B?TjhmbktZaFExQjVuWWtGblp4R1gxdmdxSmwyRUNZZWR1bXZMRUltR1prdW42?=
 =?utf-8?B?dHA1N0c5T3Ixa1R0TDdHQkFZbHFka25Oc3hmb0FDeDR5bEVyeTlsTGNxRlNT?=
 =?utf-8?B?YnBqRGVPUGsralZTS2MrTXIzMVNFTmJRQXpLa1RrdjRVK0ZVdXNDeXdWenNR?=
 =?utf-8?B?KzVLZUpqekJoeFo0dTRITTFwV21PWlpWa1E5c09HWnl2QnJNUFBQbTJKOGZx?=
 =?utf-8?B?ZnFUN0R6U1lsa3JkQTdWVlhKR2oyTXMzcnZMN3c0UFV5RkkvZW9SenVBNkNQ?=
 =?utf-8?B?ZlVibExGZm1QOU84alorRzdGdkJLQU9DeTlvN3VXL2N4SmNCSk9BOVl2STQx?=
 =?utf-8?B?SExZY3lLcWp5S2Q2a1pOTnBnV2RCMml6MGdDenpDV2ZXQnBXRzMxTVBTeFJ0?=
 =?utf-8?B?Mm52bmhjZnR6WTRKRTFib21rMjBNejlEeWw1WkhCdEc2d005TEdhaGRnYWI3?=
 =?utf-8?B?ZGNBZnVCSkcxMmpXRWp5NUhFblNnV1VaajM4V1Zra1RkcjAwVmhHS1BOYVl6?=
 =?utf-8?B?Qk81TDExbWVQSXFCb0VOa2VpUUMvOENmOVdBZ29tL0tFTjh4clA4QVQ5SlZJ?=
 =?utf-8?B?V0ZqUklrRFY3T3lLS05wODc1UEFzYzBCZGhPb1hvQTdSR3M3NEdldXlsNUFi?=
 =?utf-8?B?akJnMWxwK2g2M1F3RmNUbW1iWUZPeTFkVlIyVzE4b2tjSkRKMEZNZE9pRndN?=
 =?utf-8?B?eU9kSkJsRzNGM2JrMzAwejg5M2FSNGhYa3ZVNVJSTUJJUTBFRFBjSHpkeGx2?=
 =?utf-8?B?azBBVHdxMUZnYlJ0WXJLTVIzVTFEM2dzQ2doL2RNQ3RiY1ZWMFdlQXdmVXpi?=
 =?utf-8?B?clNNSCt2Zk9iQUdLMnlUby9NWk5KblBOeWU5NlZJRXpSdUZPcjVpY2QwMlFX?=
 =?utf-8?B?Z1NwWDkyMzZTanRXa1YxMm5EM05tMGd5dmZlejhaR0tlU2xoUU1BY3BzcDYr?=
 =?utf-8?B?U0VVUFZOOGRnQW1kZHZrcEFobWIyS2JHSUZTeGNsRzVUYk5RYXRYQlpvcnZU?=
 =?utf-8?B?cXBBRjFJbHM1VzhSV2hwL2VYS3U2L0tUZldVUDNMSnlGVGc4RjNVR0Y5VlpB?=
 =?utf-8?B?N3duSXQyMWJ1S1ZobFVnVnZ5VlM2M1oydElGdXJnOGZtOUk3bXl6bUgzUU5X?=
 =?utf-8?B?bDhhc0NFSld2MzZyZUp2WTcyNHBoZVNCZUhtbEZ0OVFQYVRQWHpSSWx0UUpw?=
 =?utf-8?B?cGVTeUxqcWVqWXN2RWxmMVZtOGorc2J5dVRmNk9wdjZhaUlGZjQ5cmNZQWJn?=
 =?utf-8?B?OStOZk9mRTFyY29mejFxZGwyVnRXc08wS2I0WWd0Tk5KdXloQ2Q4Y1RJTzJ4?=
 =?utf-8?B?cU1LcnQ4ais5Nk12UkxIbXhDUFYvbmxMK3FhR3ozM0Z5VWc9PQ==?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5686.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?MnFJakthT2N4UmkyekVTUmw0V2hvOTU0OVJuR1pOS3Z6Y0l4SVhrZmdlMjVt?=
 =?utf-8?B?OWVaVVVUVjc1cDltNisrUzl0K0pBRGlEQVk3Q1lJUWhJbEYvVmZQbkhIcGF2?=
 =?utf-8?B?emRuR1pIVzJoeUxhNTFQTkpQdTRvalVGalFYaHFDM2xDTm1XdjRYQnl0dnBh?=
 =?utf-8?B?Smd0c1BvOVJ2eWh0bkhsNmtlQjFsYmhaL0dGdHRacWpoZmpKalVSMjdNalk5?=
 =?utf-8?B?dmZ4UWNsZ1VQNFhDZzVSeVRYSGFRNERaMUs3c21pc3pQdTYrSmhhVmltUWg0?=
 =?utf-8?B?cGdGUmlMRTNkOHhSaDBqckJ1L01YbUp0VkRsVFlTdlhtYzMvWWRlUk1LVkdF?=
 =?utf-8?B?RnR0U20waGlNWTdGdXNRS0NhdVVBRnEyeHlrN0lwTzFlbGl3NSsxazBOZ25j?=
 =?utf-8?B?YVV3Y1JxdDJhNUtOYkw2SWFTOXBDTXJVaW5tZHYyM09yWko4WDBKMnE1RUov?=
 =?utf-8?B?YjVZT0xBUHJGbTZUU0k3NDhROHFPRGRFcFhFSUZIWDV4N2VOZmQ2U3ZGTkl1?=
 =?utf-8?B?aGtNOU1va0Y5bkFIV29FMTJZVHQ3WG9veXFrcitSTWdoektUU1NwS25oYVBY?=
 =?utf-8?B?OG9pdU5xdHd6Uk1zcUI5OG9kQlRxVkQvMDNKeVhLcUtpaXFWSzR3akV5MlJN?=
 =?utf-8?B?WGJWdDRiVVNmRFYzMDY3N25ZeG56WUZxVThWRHAyUzI3QXBBOGNtLzhwUlZx?=
 =?utf-8?B?dWExdnJ3cUlnQ0x0LzBTQSs3cDdGUms5MmhUNm5uVjd3WU91NEI0SzduWGdo?=
 =?utf-8?B?MVpuNVVRTElGc1puUlc1RFZzc0RjSjdYOTlyOGJxOW5vK2cyVDZXWGxHSGdC?=
 =?utf-8?B?ektmNnRnQWZyL1NhWDdhUU5ORmJkRytPOVNUUzFOTWFiM2F1SHV5TjZiMFI4?=
 =?utf-8?B?MG9GZUJCVkgrWnlBT0Nxb2hwVmgxZGVrRk90MzdEZUx5R3Vqb3dhWGlnRXV3?=
 =?utf-8?B?T3VIbTlRaW1nUiszMDFOblYvellGUCs4blN1RzZtQ0tkbU0zZk01M01ZMGJB?=
 =?utf-8?B?b2dLV2dKYXk1c1BvMjJUa0cyN3p0Nks1ZWczY0VVSGJnOXF0UjdueFo3d2Ir?=
 =?utf-8?B?M1VDMERIRWs4N2pJQUJJUGFzcE4yT2Zud3hKRzF6SERXa0FOWkxvOTVXcTNt?=
 =?utf-8?B?MjcyY3FuUlVrTVI2Y01kaEtqSG5TN296VmwyUTIvem50RXpjYmRDaVQrNVJv?=
 =?utf-8?B?RFkyU1oyK0VRa2FSQkF3TDBVWkRsZHNMckUrYTdBcGVpZzUwK3FaRnJha2pa?=
 =?utf-8?B?bWRqTDJnUDF4Tk1pbVJmU1hwUjdESVgzR0gzRm5xbEFVZGk4YlZYRE9DdGVR?=
 =?utf-8?B?dFlMQitWalZwYkJ5Q21ub21MTWp3SFc3RDRUKytTY3RwdjZDVDdObGpyaFBV?=
 =?utf-8?B?dm5XOVJNWGtrck1lZzA3N2RsWUdHSXVHQVJwVnBJNFIvRmxaM1p0L2prK0V2?=
 =?utf-8?B?Z3gzWWcwTWNId1lQNXRQVGdOM3RhbU5vWVdId2xxWjhQSEpyTzJkbkUzSjhq?=
 =?utf-8?B?dlBrL2JzS3crOEJSV0V6YXJsdExCUk5PL2JtWnJuVmplYTFHY1dmL25ZYnVw?=
 =?utf-8?B?YjVjMDJ3Y2l1NGNJQWlORHdUZElkSys3YVVRbmhTMTdiMDZFZUtBRmlKUUtL?=
 =?utf-8?B?OWhKK2loT0dZdW8weloxcmdQZE9ZQmdyYVc0UGtjYWJ6eXN1Sjh0OE1kcDNP?=
 =?utf-8?B?eUw2aVh5L0FiWDdVWTdLWVkreXd6QVhENGVtVjhKMmtJZFY5TVc1ZFgxelo1?=
 =?utf-8?B?YStYWUdOOWlaMnh6ZEFNVUlJeGJkeUZUTzFOSTV4YVJEOW9FNHFNNFNjZmpz?=
 =?utf-8?B?S1FtQ1JrSXRmSGc4UFVlcmhLRjUvZERFU1FuQXQwczZDcE4rM1F6WGttaFk1?=
 =?utf-8?B?L05tbWcwc1RaUG00SG1hVyttTkNpSVZmbG5IdHo4RWxnNkhWRXI2K3puVjFt?=
 =?utf-8?B?L1BzajFWTVI0OFVaM2lCTUVnR0FBSjlaQ2dCbjEvOVErdHBGZ3VHangrU2h0?=
 =?utf-8?B?d05seFVOSzI3bW5RR3dYcFEvVGVpcHVCQlF1UkEyVGplUkl4UHhRYnZVVUU3?=
 =?utf-8?B?Q0xNVCt2blNHTFFIOFNYVThoc0lRTEhCUlVnRkhZOXdZSG1mVE80emFTUklW?=
 =?utf-8?B?WTFoZEpBMFh3MUtRMlh0TFplZXUxK2IvNUVBU1QrM3lNVHR3NVBzQUllL0E2?=
 =?utf-8?B?WUE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5686.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 75a720e1-349a-4817-c360-08dcc7fa3fcc
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Aug 2024 07:14:40.5476 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 462esBx6eLrJKt+RTqNY/kydnzfU8G5k0yiSrlPCPqC1k/WrR2f+a6V0/gCwZviTr0GkL1PwWj3l+EKZ5wjb0fOPZ1m8JuZmgV0w6RaroY0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7092
X-OriginatorOrg: intel.com
X-Mailman-Approved-At: Thu, 29 Aug 2024 08:24:39 +0000
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

VGVzdGVkLWJ5OiBKYXJpIFRhaHZhbmFpbmVuIDxqYXJpLnRhaHZhbmFpbmVuQGludGVsLmNvbT4N
Cg0KSSBleGVjdXRlZCBmZXcgdGVzdHMgaGF2aW5nIGR5bmFtaWMgc3VidGVzdHMgd2l0aCB0aGlz
IHZlcnNpb24gb2YgdGhlIHJ1bm5lciBwcm92aWRpbmcgcmVzdWx0cyBib3RoIGZvciB0aGUgZHlu
YW1pYyBzdWJ0ZXN0cyBhbmQgdGhlaXIgcGFyZW50IGluIHJlc3VsdHMuanNvbiAoYXMgZXhwZWN0
ZWQpLg0KIm5pbmphIC1DIGJ1aWxkIHRlc3QiIGFsc28gd29ya3Mgd2l0aG91dCBmYWlsdXJlcyB3
aXRoIGFjY29tcGFuaWVkIGNoYW5nZSBvbiBydW5uZXJfdGVzdHMuYy4NCg0KPiAtLS0tLU9yaWdp
bmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBLYW1pbCBLb25pZWN6bnkgPGthbWlsLmtvbmllY3pu
eUBsaW51eC5pbnRlbC5jb20+DQo+IFNlbnQ6IEZyaWRheSwgQXVndXN0IDIzLCAyMDI0IDc6MTQg
UE0NCj4gVG86IGlndC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnDQo+IENjOiBLYW1pbCBLb25p
ZWN6bnkgPGthbWlsLmtvbmllY3pueUBsaW51eC5pbnRlbC5jb20+OyBNdXNpYWwsIEV3ZWxpbmEN
Cj4gPGV3ZWxpbmEubXVzaWFsQGludGVsLmNvbT47IEhlbGVuIEtvaWtlIDxoZWxlbi5rb2lrZUBj
b2xsYWJvcmEuY29tPjsNCj4gVGFodmFuYWluZW4sIEphcmkgPGphcmkudGFodmFuYWluZW5AaW50
ZWwuY29tPjsgUGV0cmkgTGF0dmFsYQ0KPiA8YWRyaW5hZWxAYWRyaW5hZWwubmV0PjsgUm9iIENs
YXJrIDxyb2JkY2xhcmtAZ21haWwuY29tPg0KPiBTdWJqZWN0OiBbUEFUQ0ggaS1nLXQgdjJdIHJ1
bm5lci9zZXR0aW5nczogc2V0IFBSVU5FX0tFRVBfQUxMIGFzIGRlZmF1bHQNCj4gDQo+IEluIHRl
c3RpbmcgZHJtLXRpcCBpdCBpcyBoZWxwZnVsIHRvIGhhdmUgcmVwb3J0ZWQgYWxsIHRlc3RzIHJl
c3VsdHMsIGVzcGVjaWFsbHkgd2hlbg0KPiBvbmUgaGF2ZSBtYW55IGR5bmFtaWMgb25lcyB3ZSB3
YW50IHRvIGdldCBhIHBhcmVudCByZXN1bHQuDQo+IA0KPiB2MjogZml4IGZvciBydW5uZXJfdGVz
dHMgKEphcmkpDQo+IA0KPiBDYzogRXdlbGluYSBNdXNpYWwgPGV3ZWxpbmEubXVzaWFsQGludGVs
LmNvbT4NCj4gQ2M6IEhlbGVuIEtvaWtlIDxoZWxlbi5rb2lrZUBjb2xsYWJvcmEuY29tPg0KPiBD
YzogSmFyaSBUYWh2YW5haW5lbiA8amFyaS50YWh2YW5haW5lbkBpbnRlbC5jb20+DQo+IENjOiBQ
ZXRyaSBMYXR2YWxhIDxhZHJpbmFlbEBhZHJpbmFlbC5uZXQ+DQo+IENjOiBSb2IgQ2xhcmsgPHJv
YmRjbGFya0BnbWFpbC5jb20+DQo+IFNpZ25lZC1vZmYtYnk6IEthbWlsIEtvbmllY3pueSA8a2Ft
aWwua29uaWVjem55QGxpbnV4LmludGVsLmNvbT4NCj4gLS0tDQo+ICBydW5uZXIvcnVubmVyX3Rl
c3RzLmMgfCAyICstDQo+ICBydW5uZXIvc2V0dGluZ3MuYyAgICAgfCA4ICsrKysrKy0tDQo+ICAy
IGZpbGVzIGNoYW5nZWQsIDcgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkNCj4gDQo+IGRp
ZmYgLS1naXQgYS9ydW5uZXIvcnVubmVyX3Rlc3RzLmMgYi9ydW5uZXIvcnVubmVyX3Rlc3RzLmMg
aW5kZXgNCj4gYjgwNmQ0NWFkLi5hNjYxNzIyYWMgMTAwNjQ0DQo+IC0tLSBhL3J1bm5lci9ydW5u
ZXJfdGVzdHMuYw0KPiArKysgYi9ydW5uZXIvcnVubmVyX3Rlc3RzLmMNCj4gQEAgLTMxMCw3ICsz
MTAsNyBAQCBpZ3RfbWFpbg0KPiAgCQlpZ3RfYXNzZXJ0X2VxKHNldHRpbmdzLT5wZXJfdGVzdF90
aW1lb3V0LCAwKTsNCj4gIAkJaWd0X2Fzc2VydF9lcShzZXR0aW5ncy0+b3ZlcmFsbF90aW1lb3V0
LCAwKTsNCj4gIAkJaWd0X2Fzc2VydCghc2V0dGluZ3MtPnVzZV93YXRjaGRvZyk7DQo+IC0JCWln
dF9hc3NlcnRfZXEoc2V0dGluZ3MtPnBydW5lX21vZGUsIDApOw0KPiArCQlpZ3RfYXNzZXJ0X2Vx
KHNldHRpbmdzLT5wcnVuZV9tb2RlLCBQUlVORV9LRUVQX0FMTCk7DQo+ICAJCWlndF9hc3NlcnQo
c3Ryc3RyKHNldHRpbmdzLT50ZXN0X3Jvb3QsICJ0ZXN0LXJvb3QtZGlyIikgIT0gTlVMTCk7DQo+
ICAJCWlndF9hc3NlcnQoc3Ryc3RyKHNldHRpbmdzLT5yZXN1bHRzX3BhdGgsICJwYXRoLXRvLXJl
c3VsdHMiKSAhPQ0KPiBOVUxMKTsNCj4gDQo+IGRpZmYgLS1naXQgYS9ydW5uZXIvc2V0dGluZ3Mu
YyBiL3J1bm5lci9zZXR0aW5ncy5jIGluZGV4IDk0YjNiOWZlNi4uMGQyN2U3YWYzDQo+IDEwMDY0
NA0KPiAtLS0gYS9ydW5uZXIvc2V0dGluZ3MuYw0KPiArKysgYi9ydW5uZXIvc2V0dGluZ3MuYw0K
PiBAQCAtMjc5LDExICsyNzksMTEgQEAgc3RhdGljIGNvbnN0IGNoYXIgKnVzYWdlX3N0ciA9DQo+
ICAJIiAgICAgICAgICAgICAgICAgICAgICAgIHJlc3VsdHMgdGhhdCBhcmUgcmVtb3ZlZCBmcm9t
IHRoZSBmaW5hbCByZXN1bHRzIHNldC5cbiINCj4gIAkiICAgICAgICAgICAgICAgICAgICAgICAg
UG9zc2libGUgb3B0aW9uczpcbiINCj4gIAkiICAgICAgICAgICAgICAgICAgICAgICAgIGtlZXAt
ZHluYW1pYy1zdWJ0ZXN0cyAgLSBSZW1vdmUgc3VidGVzdHMgdGhhdCBoYXZlDQo+IGR5bmFtaWNc
biINCj4gLQkiICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICBzdWJ0ZXN0cy4gKGRlZmF1bHQpXG4iDQo+ICsJIiAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgc3VidGVzdHMuXG4iDQo+ICAJIiAgICAgICAgICAgICAg
ICAgICAgICAgICBrZWVwLWR5bmFtaWMgICAgICAgICAgIC0gQWxpYXMgZm9yIHRoZSBhYm92ZVxu
Ig0KPiAgCSIgICAgICAgICAgICAgICAgICAgICAgICAga2VlcC1zdWJ0ZXN0cyAgICAgICAgICAt
IFJlbW92ZSBkeW5hbWljIHN1YnRlc3RzLFxuIg0KPiAgCSIgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgIGxlYXZpbmcganVzdCB0aGUgcGFyZW50IHN1YnRl
c3QuXG4iDQo+IC0JIiAgICAgICAgICAgICAgICAgICAgICAgICBrZWVwLWFsbCAgICAgICAgICAg
ICAgIC0gRG9uJ3QgcmVtb3ZlIGFueXRoaW5nXG4iDQo+ICsJIiAgICAgICAgICAgICAgICAgICAg
ICAgICBrZWVwLWFsbCAgICAgICAgICAgICAgIC0gRG9uJ3QgcmVtb3ZlIGFueXRoaW5nIChkZWZh
dWx0KVxuIg0KPiAgCSIgICAgICAgICAgICAgICAgICAgICAgICAga2VlcC1yZXF1ZXN0ZWQgICAg
ICAgICAtIFJlbW92ZSByZXBvcnRlZCByZXN1bHRzIHRoYXQNCj4gYXJlXG4iDQo+ICAJIiAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgbm90IGluIHRoZSBy
ZXF1ZXN0ZWQgdGVzdCBzZXQuXG4iDQo+ICAJIiAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgVXNlZnVsIHdoZW4geW91IGhhdmUgYSBoYW5kLXdyaXR0ZW5c
biINCj4gQEAgLTY5Myw2ICs2OTMsNyBAQCBib29sIHBhcnNlX29wdGlvbnMoaW50IGFyZ2MsIGNo
YXIgKiphcmd2LA0KPiAgCW9wdGluZCA9IDE7DQo+IA0KPiAgCXNldHRpbmdzLT5kbWVzZ193YXJu
X2xldmVsID0gLTE7DQo+ICsJc2V0dGluZ3MtPnBydW5lX21vZGUgPSAtMTsNCj4gDQo+ICAJd2hp
bGUgKChjID0gZ2V0b3B0X2xvbmcoYXJnYywgYXJndiwgImhuOmR0Ong6ZTpzbDpvbWI6TCIsDQo+
ICAJCQkJbG9uZ19vcHRpb25zLCBOVUxMKSkgIT0gLTEpIHsNCj4gQEAgLTgxOCw2ICs4MTksOSBA
QCBib29sIHBhcnNlX29wdGlvbnMoaW50IGFyZ2MsIGNoYXIgKiphcmd2LA0KPiAgCWlmIChzZXR0
aW5ncy0+ZG1lc2dfd2Fybl9sZXZlbCA8IDApDQo+ICAJCXNldHRpbmdzLT5kbWVzZ193YXJuX2xl
dmVsID0gNDsgLyogS0VSTl9XQVJOICovDQo+IA0KPiArCWlmIChzZXR0aW5ncy0+cHJ1bmVfbW9k
ZSA8IDApDQo+ICsJCXNldHRpbmdzLT5wcnVuZV9tb2RlID0gUFJVTkVfS0VFUF9BTEw7DQo+ICsN
Cj4gIAlpZiAoc2V0dGluZ3MtPmxpc3RfYWxsKSB7IC8qIC0tbGlzdC1hbGwgZG9lc24ndCByZXF1
aXJlIHJlc3VsdHMgcGF0aCAqLw0KPiAgCQlzd2l0Y2ggKGFyZ2MgLSBvcHRpbmQpIHsNCj4gIAkJ
Y2FzZSAxOg0KPiAtLQ0KPiAyLjQzLjANCg0K
