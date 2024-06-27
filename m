Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1EB32C30658
	for <igt-dev@archiver.kernel.org>; Thu, 27 Jun 2024 08:29:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B953D10E17C;
	Thu, 27 Jun 2024 08:29:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="d1RROhbl";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C59B510E16E
 for <igt-dev@lists.freedesktop.org>; Thu, 27 Jun 2024 08:28:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1719476939; x=1751012939;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=Vck/d22eIUJoA+PgVvp3C733Y/qSDa51aR1QCeGBBGk=;
 b=d1RROhblIB4HIWA8yGMfJXvIADm7Ph97EpPljiEthYpK77vN6cu7S4HU
 FmqqPkD34MnwtsKG8so43EXaYBAoiA3A3D7YvUYWSWaaPL32D1O8RyccR
 Ast1H5afS6KXdvkksl/27v2d8NMWuR1LmBjk3MdMbnQUufU1Jji62Awtc
 gAoPAK1c/MkZyq0ah2bKcdsiuGKRrw1SouW00O254Uy4Iy9RshTw8qj2V
 DZVl7XtEE0RXLz22bATJmlOFUhIg1cRKKq3MwM9o/I3Aw8IFdW6jdn05d
 pj7Dg+ZloyRGilqtSwh9O/ZEX2JVetnNXj+FEqt/MSvYCaJy/CC4nxYXE w==;
X-CSE-ConnectionGUID: 7mdBJuwjQcm1xn2wcqbzDg==
X-CSE-MsgGUID: lrUnipEMT/KGIY2hTXHyRw==
X-IronPort-AV: E=McAfee;i="6700,10204,11115"; a="16548096"
X-IronPort-AV: E=Sophos;i="6.08,269,1712646000"; d="scan'208";a="16548096"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jun 2024 01:28:59 -0700
X-CSE-ConnectionGUID: WD1u0ViMQaKUrcwqw79Exg==
X-CSE-MsgGUID: rnqIcmknT6KZWIqrazJ7qg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,269,1712646000"; d="scan'208";a="67511681"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmviesa002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 27 Jun 2024 01:28:58 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 27 Jun 2024 01:28:58 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 27 Jun 2024 01:28:58 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.46) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 27 Jun 2024 01:28:57 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eoqukUOKjFYCSS4gO6/zxsndcoiHRzf1drd8PRPV+E4fTBP8dSKA38CX+dhjpUcINpnUB6MWb2UWBktPAKWd7FZNFJaef9cM9ejP2xmjIsvdjf+UIolFLjuDogHSqMCH/Uke/Ork9I0QpG7j324pdD4ZwyA/cNhKbL2HFAartL+GSIEYDuWJFDxBokJOn8vLKMTepu7ivVHvfcGdl5ixGBr9F8rXtNE5hqUg+JK7amdWk4ao440K99k8WS0RCoBn3S/hlpAum2OoXc3JicWExHSzfW2LN1b0RpvD4VwjgmNHOXDhXBYh6R3tkF6CMZB20a9G3afJ2ksl0h1fjntk9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Vck/d22eIUJoA+PgVvp3C733Y/qSDa51aR1QCeGBBGk=;
 b=WWZh6OAOtTi15CBGlys3kq0VOFn9a7bE+YqJfP3e3axKUNj0TpRw8TnkRYBwnRSYeCpcxLD8eDPlYGhHgEUZpQFli+haXvOjHqyz0lfKb58vwmFN8o6+Tbad8eAokYhu4nHdnw+MhnLqbzO1mL5w9NXe9G2kppYeVPkc1A7rkcWwnsI+plDHZLCIDJBt8eS+ADEYvNlSLFJqERkxyw0rXv6OqxkmLUBmnlqnYDOafQwn4b9A4o/JgOE+xIBpms3hnGhT1g3jJPd1kRdyhBV3u6Z4rYezoS89yeqCJDRuCRyL98Bd0u9rvXjl2cyee9r2MO7rqHxg9wa/nvspQlUYmw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB6312.namprd11.prod.outlook.com (2603:10b6:8:a5::11) by
 CY8PR11MB7241.namprd11.prod.outlook.com (2603:10b6:930:94::21) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7698.32; Thu, 27 Jun 2024 08:28:55 +0000
Received: from DM4PR11MB6312.namprd11.prod.outlook.com
 ([fe80::faad:f9ae:2b45:e9ba]) by DM4PR11MB6312.namprd11.prod.outlook.com
 ([fe80::faad:f9ae:2b45:e9ba%2]) with mapi id 15.20.7698.025; Thu, 27 Jun 2024
 08:28:55 +0000
From: "B, Jeevan" <jeevan.b@intel.com>
To: "Modem, Bhanuprakash" <bhanuprakash.modem@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "Joshi, Kunal1" <kunal1.joshi@intel.com>
Subject: RE: [i-g-t V6 6/8] tests/kms_flip: Force joiner support in bigjoiner
 checks
Thread-Topic: [i-g-t V6 6/8] tests/kms_flip: Force joiner support in bigjoiner
 checks
Thread-Index: AQHawVnikEfuEWbdIEGpRgNNbtXBIbHbPb6QgAAEoICAABKMcA==
Date: Thu, 27 Jun 2024 08:28:55 +0000
Message-ID: <DM4PR11MB631230A8699F3E071E1EBB7490D72@DM4PR11MB6312.namprd11.prod.outlook.com>
References: <20240618082248.4070611-1-bhanuprakash.modem@intel.com>
 <20240618082248.4070611-7-bhanuprakash.modem@intel.com>
 <DM4PR11MB63127477EE32B49DEA29C12090D72@DM4PR11MB6312.namprd11.prod.outlook.com>
 <a0bf4c0a-e6ad-40d1-bd77-cf333f1c814b@intel.com>
In-Reply-To: <a0bf4c0a-e6ad-40d1-bd77-cf333f1c814b@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB6312:EE_|CY8PR11MB7241:EE_
x-ms-office365-filtering-correlation-id: 0266804c-4215-4765-6986-08dc96832f12
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?K1M0RnIyQ1Q5OEduTWZ5TVA2RmkwYnFNY1ZjYjlXVXIvRGp1MG9KNzNTZnE5?=
 =?utf-8?B?S3FzU3B3S0plZklXYTVzSXpxc3BIbXpWbWFMRUprVmNReW1KM3VyanBncXpR?=
 =?utf-8?B?eXlhbk8zcDkvd0ZzNVNyZmhVeG51Z25FMmZpNDAwcVVPWHQ4OUNLZmJCSC9H?=
 =?utf-8?B?aWptczlYMHFZa2lwdlY5Y1hiSlRsUTZWbWphRW1KWGNJK0RNNjZ4eVppZExr?=
 =?utf-8?B?ZjUxMGpENFQzOHJZS1NFZWkvZTBRNmlNUDdxbmxSZEtHYXdCWmdpT1VibitB?=
 =?utf-8?B?OVBtTnpDeEZsVXNtanBvZGQrQzFqb0dscG5yM1lTY3pNSW00ZjlQTkV3YVN5?=
 =?utf-8?B?Y1JUaW1Fa3VVK3BjMExhMHdjS2xGTHpIMGFCbW1RcTVtNWxMNFFlcG9XMzJw?=
 =?utf-8?B?Sm55c1dWSmJLODZHaXp5NXNYYjhBK2M4aFd6V012YnhETm9ZZjVyeW5WZkFD?=
 =?utf-8?B?N1RvaDh6MU5PNmtaVUs5UkZ3VFJZZ1JNRkNwT0dlaXRUZXlmazVLTElQZGN1?=
 =?utf-8?B?aTFydlV2YnF1Y1ZGQ096d05yaXJqQmtOa3F2WG5wRG9SN0dscXRPMHNaWEZH?=
 =?utf-8?B?MTVLYWNjRUloVFVVNnN6VTYwL1RzRmlJbE1SbXNVODVyVlF5aU5SYVZCM05E?=
 =?utf-8?B?bW5QMWV2eCtQUi9ET01hUGVWek1WVEJiUDJ6dFloSDE3dU5aV1VnSTA2aG9r?=
 =?utf-8?B?aUV5L0RmeVBtYkY2SnpucDBBYXRsYjdGbG0xZ3ZMY0w5WndYbEdVeEFzOGJa?=
 =?utf-8?B?OVkzNnltU1NBbjRSdTFlMTVHbXdjaUY0cWhEVW9zdFpjWnE3WmZxZklxc2xo?=
 =?utf-8?B?Q0ZMSEZ0RDBBc1dsT2VmV0hmWjRmMElYaXpBenIrcEZEMmFva01BWEF4OFh3?=
 =?utf-8?B?Y2tUanNycTBvZTlUK2pPek5yd1FjTDVuV0FOWktmdU1FbFVFclFKUy9mRS84?=
 =?utf-8?B?bVpFRnZxTlovOHU0MzdjVm0ycUo3ZFBDU1djanNlM1A2Q0dsL2gzdkpYTkZD?=
 =?utf-8?B?OE5sZVZLWFNnRFV0Znk5dnJHWU9TS1doT1A3cjVLYW9NalZOWUtuUzh5VjAr?=
 =?utf-8?B?Z1ZiWGZZMk90MnY3NlRhYk5zMWlMM1FmMThtZ2FlNnc2WmUvYURzaEd3NFpo?=
 =?utf-8?B?RUdoU3lURjltRDhRQy9PdlBPZXVmb2hVcDNUUE1LckdOTlFKWXZKdXYydGhX?=
 =?utf-8?B?WlRRRTJRbFJtY2RjeFcrTE02Szl3VnpEaWl1L25IVlFvQ0hjaSt3MmxxUS9n?=
 =?utf-8?B?NXhGSE9sNmpFdjZpbDVBc3ZZK0hHWDVySHFvdXBIR29zd1BvUHU1SXZxMHA4?=
 =?utf-8?B?Q3BwdEU4azY5TWpaTktCeVNnSlBJM3ZDSkJRdGk3SFBQV0ZaYmxiWXdOVGNO?=
 =?utf-8?B?THRYajUxVHhPd2QrUjZ4RWpsL0F4OUwvMHFwNEozV1RIR0VFNTBabU9oQUJm?=
 =?utf-8?B?dEkxUnpUOUQ0NVkvWkJjME5IODJRcGVBVU5VeUdYcmFCdG9kM0R0Y0FsMlBI?=
 =?utf-8?B?NG5UcWw2dHA5b1QvZEVqaUJwcml2aVlSY05OZ3ErbjNocjJyRVNqelVSMGZE?=
 =?utf-8?B?azl6NG5VQnB0S0NvMFpCRXN5VWZkTXYvZlViRFM5Vnh0UnR5YkVZL0ppQ2dX?=
 =?utf-8?B?cXFEL25IRlZHVVNlUnNMV3ovTkxFTVVwZHdNRGlzRjNsazhPNTh5NWlvNGxU?=
 =?utf-8?B?TXVKMWQ3SW9pd3NkWkVtVi9lS1VWWk5KaFNRclpFbHB3Y2J1aHZuR1hhSVgr?=
 =?utf-8?B?Y1lMYVZWaHpzQTJ6M04xZHE4NFhpVHEwU3JKdkl5Y1d3YjBNUm9yMlpGYzhL?=
 =?utf-8?B?Y2NZZVZ4Q3Mxd29JbEp3RjFjbThJS0pqUmdmZDZyZW93N2hPWEh4Q0IraVpl?=
 =?utf-8?B?UlkzRGUzOGYzbXJKOHBGT3VmRHkvR3JiSE1MdUpSSXBBRGc9PQ==?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB6312.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?cEoxaFFJa0FvWGYxQjYzU2tPVEticzdhb2RITHY3QnZ3MWlyczR5Z3NpZ292?=
 =?utf-8?B?SlBldkVDazgxVitJWkRjeHEzWHlycUdZb01wR2R6RStuOUpRT1o0aHNzRVd5?=
 =?utf-8?B?c29aUlJJUUM4RGM5TDlWZlJFZDQvOWhrVmZjdjhpei94Vllmbmk0bHB1YjRV?=
 =?utf-8?B?eXNseWtrZkdya2RzTkVnTTNuQnJOa2svamF5OGw4SE4zZnlEbGdwZ0ZTUUV2?=
 =?utf-8?B?TUNjZDRRdjJUY1d2U1JvckFKUFlUOXBXbmtkeHRxd3Z4NEJCdWJpNkVZaktt?=
 =?utf-8?B?ay9nV2xSREwvcUN5Rk0vMjJsUUUzM0h6a0JIaHF6NDMxMjlTMmFqUy9OWjAz?=
 =?utf-8?B?N1llc3hxakRtckg1ZlQrZ2g1Z09HNExYbnVVUVM5bG5mSTVGQVdYNTkrZHRH?=
 =?utf-8?B?WUZveDF6OWVFVUk2Slp6cGQ5Wlhsbi9TUUJRVkZTS3pEMFVqZGUxM1d6UEtr?=
 =?utf-8?B?ei8wKy9VQXB5dm1XZGFzVldXRDFEZU5QUndPQVB3aUxnNmI2WGZyVmgveHBZ?=
 =?utf-8?B?SHNSRXBlYlVNR3pKbWgwb3NaRlEwaEZYdzVKdzdFMUtGYjNmYmk4c3Rvazdh?=
 =?utf-8?B?VHROclRqTVd0MUl3Y3l1ck5IVW5NQllWUlhlYjMycHMrNEVYbEZOQzB6enpm?=
 =?utf-8?B?UmtHTWNKanhFVHlHSjErU3VLdXRlM2xCVFZRSmNSTHJET3NjSjZsZEtBNTF0?=
 =?utf-8?B?Tk5abFZFRysrSnFURklna3hyOFZzT3pTTUlONCtHM2taVkYxVVhFQjdsTGNz?=
 =?utf-8?B?cmg3MVNGQjE3c1hBSFdEZnZ4UXE4T3Z0T2t6aU4wMXY4bUI2US9YdXd2bzlH?=
 =?utf-8?B?TEdsWVkvR1BZVU5sZVJNUVZIbm5GQVg0d1JDaExzdi91QnFqbUNlTllCYS82?=
 =?utf-8?B?M2RlLzFYYnFtTUJtcTRnQnE4ZTJFY2tDWlFXUGxSbzFjZ1dZNzRPcTlaUCt6?=
 =?utf-8?B?T2crOFpXbUVqaHFOT1NFUEpRVmdyWVdma0NkK3IzUitWTTRRL0sybHBnaW9k?=
 =?utf-8?B?d1l1a0ZtcmpkbnVLd0w3T1FiNzdobGNuNFdVZDJsS2d2NUYzLzZ6cUNheFNn?=
 =?utf-8?B?dlh3OHlVR3A4cGxjUXZidzBnMlljS3RHYkVVdkJpTVQzOTE2b3dOeFhlSXV0?=
 =?utf-8?B?R0VDN3BRTUwxdS93MkdKeDlBb0d0eGNxRlNWajlISEx2bE83M2hKWDFHSG92?=
 =?utf-8?B?ZHhpY2ltQnhhdmh0cVpLUm5kbWNpOFFyb2hsWUtVQ29tbWR1ZW83NENOL3VC?=
 =?utf-8?B?TGJHTy94S3lLdTFQNDBqdkhHMjJVS0VUWFVqMTZ1UW8vUU1ScGxzN3FXMkNv?=
 =?utf-8?B?NlppYjFGcTg3RzJqdzJNS3NVMnNsdGJsUXloWDVRbTBjSjZ2Rlk5YmVseE5Z?=
 =?utf-8?B?YXlMcnJ4NEd1NU53Ni9IaWZXWWFIT20yQS9XNkUrbk44ZjJ1NmNtMXlRWHFm?=
 =?utf-8?B?R2JRNHc2b0N2dkhOSlFHYVlhaERVQUJxVzRlbjJIc3VvVmE4dXl5Y3c2RS9J?=
 =?utf-8?B?eHZEYWJJbzQ0T0thbGxWcXJDVzdZVEVlT09WZGd3Q3ZtTmllR0JzS3JFTEND?=
 =?utf-8?B?K0ZjZ2tRTzNwWWhhSjFmWnFCYmF4SGx4UkdRSEVjUmM3QzRycDduUStsb2JG?=
 =?utf-8?B?d2oyQ1l6dVF3T3l3cWpuZWhNVE40ZmttOElqc2VOb2dCNEdSUC9VbHg1cHBp?=
 =?utf-8?B?anp0Z3FPNGl2SEhQQ282UHAyb1AwYUZqQjQ4cUMvUzgvNXdHMWszZTdjdGVF?=
 =?utf-8?B?UFVYRFB4THczVVFvN3pEQ29GUVI3R0NQVWg3U3Y3RlVQWjRvbWNxU28vaFcr?=
 =?utf-8?B?RDZxV3R4cU5QTG9DOFh0SERJVTQ1dFNTbHUvd1NBUCswWFVRcldMc1o5citT?=
 =?utf-8?B?RTVLZmVQMjhwNUJERjhBM2V5dFFObFVKcHlYanM1OTNmVVlsTDdtcjl6cjBF?=
 =?utf-8?B?L2RydG9xcXBSVmdqU090VEgvUWhCQmFZTzVuTnppL21tV2pqZHI3VUJycmh3?=
 =?utf-8?B?U0E4YzgzaEhMd0p3UUxKaUpGUTRRS2pvaUhlK0NoTXc2cDZxcXJxU0NWTFhz?=
 =?utf-8?B?cGRRY1Bwb1Y2WWNZM2pOUlVjRnhBZEhHSDMwMDRWL1Y0dXF2Q2p2cjRFL0JB?=
 =?utf-8?Q?mhz8=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6312.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0266804c-4215-4765-6986-08dc96832f12
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Jun 2024 08:28:55.4178 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 0YvBsInsgsk23LXIjEXcBGg/dcHY5Pt03gu8pGPT5QzMlQOMPJRJEMaEhzqnxjuCN14Z31jG/Mkehau5+pHtrQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7241
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

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogTW9kZW0sIEJoYW51cHJh
a2FzaCA8YmhhbnVwcmFrYXNoLm1vZGVtQGludGVsLmNvbT4NCj4gU2VudDogVGh1cnNkYXksIEp1
bmUgMjcsIDIwMjQgMTI6NTEgUE0NCj4gVG86IEIsIEplZXZhbiA8amVldmFuLmJAaW50ZWwuY29t
PjsgaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcNCj4gQ2M6IEpvc2hpLCBLdW5hbDEgPGt1
bmFsMS5qb3NoaUBpbnRlbC5jb20+DQo+IFN1YmplY3Q6IFJlOiBbaS1nLXQgVjYgNi84XSB0ZXN0
cy9rbXNfZmxpcDogRm9yY2Ugam9pbmVyIHN1cHBvcnQgaW4gYmlnam9pbmVyIGNoZWNrcw0KPiAN
Cj4gSGkgSmVldmFuLA0KPiANCj4gVGhhbmtzIGZvciB0aGUgcmV2aWV3LCBwbGVhc2UgZmluZCBt
eSBjb21tZW50cyBpbmxpbmUuDQo+IA0KPiBPbiAyNy0wNi0yMDI0IDEyOjM0IHBtLCBCLCBKZWV2
YW4gd3JvdGU6DQo+ID4NCj4gPg0KPiA+PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiA+
PiBGcm9tOiBNb2RlbSwgQmhhbnVwcmFrYXNoIDxiaGFudXByYWthc2gubW9kZW1AaW50ZWwuY29t
Pg0KPiA+PiBTZW50OiBUdWVzZGF5LCBKdW5lIDE4LCAyMDI0IDE6NTMgUE0NCj4gPj4gVG86IGln
dC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnOyBCLCBKZWV2YW4gPGplZXZhbi5iQGludGVsLmNv
bT4NCj4gPj4gQ2M6IE1vZGVtLCBCaGFudXByYWthc2ggPGJoYW51cHJha2FzaC5tb2RlbUBpbnRl
bC5jb20+OyBKb3NoaSwNCj4gS3VuYWwxDQo+ID4+IDxrdW5hbDEuam9zaGlAaW50ZWwuY29tPg0K
PiA+PiBTdWJqZWN0OiBbaS1nLXQgVjYgNi84XSB0ZXN0cy9rbXNfZmxpcDogRm9yY2Ugam9pbmVy
IHN1cHBvcnQgaW4NCj4gPj4gYmlnam9pbmVyIGNoZWNrcw0KPiA+Pg0KPiA+PiBBcyB3ZSByZWNl
bnRseSBpbnRyb2R1Y2VkIHRoZSBvcHRpb24gKHRocm91Z2ggZGVidWdmcykgdG8gZm9yY2UgdGhl
DQo+ID4+IGJpZ2pvaW5lciwgbmVlZHMgdG8gZXh0ZW5kIHRoZSBzdXBwb3J0IGluIGJpZ2pvaW5l
ciBjaGVja3MgdG8gaGFuZGxlIHRoZSBmb3JjZQ0KPiBqb2luZXIuDQo+ID4+DQo+ID4+IFYyOiAt
IEZpeCBjb25uZWN0b3IgbmFtZQ0KPiA+Pg0KPiA+PiBDYzogS3VuYWwgSm9zaGkgPGt1bmFsMS5q
b3NoaUBpbnRlbC5jb20+DQo+ID4+IFNpZ25lZC1vZmYtYnk6IEJoYW51cHJha2FzaCBNb2RlbSA8
YmhhbnVwcmFrYXNoLm1vZGVtQGludGVsLmNvbT4NCj4gPj4gLS0tDQo+ID4+ICAgdGVzdHMva21z
X2ZsaXAuYyB8IDIzICsrKysrKysrKysrKysrKysrKystLS0tDQo+ID4+ICAgMSBmaWxlIGNoYW5n
ZWQsIDE5IGluc2VydGlvbnMoKyksIDQgZGVsZXRpb25zKC0pDQo+ID4+DQo+ID4+IGRpZmYgLS1n
aXQgYS90ZXN0cy9rbXNfZmxpcC5jIGIvdGVzdHMva21zX2ZsaXAuYyBpbmRleA0KPiA+PiBkMzUy
ZWUxNGMuLmNiYWJiZTc0Zg0KPiA+PiAxMDA3NTUNCj4gPj4gLS0tIGEvdGVzdHMva21zX2ZsaXAu
Yw0KPiA+PiArKysgYi90ZXN0cy9rbXNfZmxpcC5jDQo+ID4+IEBAIC0xNzMwLDIyICsxNzMwLDM3
IEBAIHN0YXRpYyB2b2lkIHJ1bl90ZXN0X29uX2NydGNfc2V0KHN0cnVjdA0KPiA+PiB0ZXN0X291
dHB1dCAqbywgaW50ICpjcnRjX2lkeHMsDQo+ID4+ICAgCS8qDQo+ID4+ICAgCSAqIEhhbmRsZSBC
VyBsaW1pdGF0aW9ucyBvbiBpbnRlbCBoYXJkd2FyZToNCj4gPj4gICAJICoNCj4gPj4gLQkgKiBp
ZiBtb2RlIHJlc29sdXRpb24gPiA1SyAob3IpIG1vZGUgY2xvY2sgPiBtYXhfZG90Y2xvY2ssIHRo
ZW4gaWdub3JlDQo+ID4+ICsJICogaWYgZm9yY2Ugam9pbmVyIChvcikgbW9kZSByZXNvbHV0aW9u
ID4gNUsgKG9yKSBtb2RlIGNsb2NrID4NCj4gPj4gK21heF9kb3RjbG9jaywgdGhlbiBpZ25vcmUN
Cj4gPj4gICAJICogIC0gbGFzdCBjcnRjIGluIHNpbmdsZS9tdWx0aS1jb25uZWN0b3IgY29uZmln
DQo+ID4+ICAgCSAqICAtIGNvbnNlY3V0aXZlIGNydGNzIGluIG11bHRpLWNvbm5lY3RvciBjb25m
aWcNCj4gPj4gICAJICoNCj4gPj4gICAJICogaW4gbXVsdGktY29ubmVjdG9yIGNvbmZpZyBpZ25v
cmUgaWYNCj4gPj4gLQkgKiAgLSBwcmV2aW91cyBjcnRjIChtb2RlIHJlc29sdXRpb24gPiA1SyBv
ciBtb2RlIGNsb2NrID4gbWF4X2RvdGNsb2NrKQ0KPiA+PiBhbmQNCj4gPj4gKwkgKiAgLSBwcmV2
aW91cyBjcnRjIChmb3JjZSBqb2luZXIgb3IgbW9kZSByZXNvbHV0aW9uID4gNUsgb3IgbW9kZQ0K
PiA+PiArY2xvY2sgPiBtYXhfZG90Y2xvY2spIGFuZA0KPiA+PiAgIAkgKiAgLSBjdXJyZW50ICYg
cHJldmlvdXMgY3J0Y3MgYXJlIGNvbnNlY3V0aXZlDQo+ID4+ICAgCSAqLw0KPiA+PiAgIAlpZiAo
IWlzX2ludGVsX2RldmljZShkcm1fZmQpKQ0KPiA+PiAgIAkJZ290byB0ZXN0Ow0KPiA+Pg0KPiA+
PiAgIAlmb3IgKGkgPSAwOyBpIDwgY3J0Y19jb3VudDsgaSsrKSB7DQo+ID4+IC0JCWlmICgoaWd0
X2JpZ2pvaW5lcl9wb3NzaWJsZSgmby0+a21vZGVbaV0sIG1heF9kb3RjbG9jaykgJiYNCj4gPj4g
KwkJY2hhciBjb25uX25hbWVbMjRdLCBwcmV2X2Nvbm5fbmFtZVsyNF07DQo+ID4+ICsNCj4gPj4g
KwkJc25wcmludGYoY29ubl9uYW1lLCBzaXplb2YoY29ubl9uYW1lKSwNCj4gPj4gKwkJCSAiJXMt
JWQiLA0KPiA+PiArCQkJIGttc3Rlc3RfY29ubmVjdG9yX3R5cGVfc3RyKG8tPmtjb25uZWN0b3Jb
aV0tDQo+ID4+PiBjb25uZWN0b3JfdHlwZSksDQo+ID4+ICsJCQkgby0+a2Nvbm5lY3RvcltpXS0+
Y29ubmVjdG9yX3R5cGVfaWQpOw0KPiA+PiArDQo+ID4+ICsJCWlmIChpID4gMCkNCj4gPj4gKwkJ
CXNucHJpbnRmKHByZXZfY29ubl9uYW1lLCBzaXplb2YocHJldl9jb25uX25hbWUpLA0KPiA+PiAr
CQkJCSAiJXMtJWQiLA0KPiA+PiArCQkJCSBrbXN0ZXN0X2Nvbm5lY3Rvcl90eXBlX3N0cihvLT5r
Y29ubmVjdG9yW2kgLQ0KPiA+PiAxXS0+Y29ubmVjdG9yX3R5cGUpLA0KPiA+PiArCQkJCSBvLT5r
Y29ubmVjdG9yW2kgLSAxXS0+Y29ubmVjdG9yX3R5cGVfaWQpOw0KPiA+IElzIHByaW50aW5nIHRo
aXMgbmVjZXNzYXJ5ID8/DQo+IA0KPiBIZXJlIHdlIGFyZSBub3QgcHJpbnRpbmcgYW55dGhpbmcs
IGJ1dCBleHRyYWN0aW5nIHRoZSBjb25uZWN0b3IgbmFtZSBmcm9tIG8tDQo+ID5rY29ubmVjdG9y
Lg0KPiANCk9rIGdvdCBpdC4gTEdUTSANCg0KUmV2aWV3ZWQtYnk6IEplZXZhbiBCIDxqZWV2YW4u
YkBpbnRlbC5jb20+DQo+IC0gQmhhbnUNCj4gDQo+ID4+ICsNCj4gPj4gKwkJaWYgKCgoaWd0X2No
ZWNrX2ZvcmNlX2pvaW5lcl9zdGF0dXMoZHJtX2ZkLCBjb25uX25hbWUpIHx8DQo+ID4+ICsJCSAg
ICAgIGlndF9iaWdqb2luZXJfcG9zc2libGUoJm8tPmttb2RlW2ldLCBtYXhfZG90Y2xvY2spKSAm
Jg0KPiA+PiAgIAkJICAgICAoKGNydGNfaWR4c1tpXSA+PSAodG90YWxfY3J0Y3MgLSAxKSkgfHwN
Cj4gPj4gICAJCSAgICAgICgoaSA8IChjcnRjX2NvdW50IC0gMSkpICYmIChhYnMoY3J0Y19pZHhz
W2kgKyAxXSAtDQo+ID4+IGNydGNfaWR4c1tpXSkgPD0gMSkpKSkgfHwNCj4gPj4gLQkJICAgICgo
aSA+IDApICYmIGlndF9iaWdqb2luZXJfcG9zc2libGUoJm8tPmttb2RlW2kgLSAxXSwNCj4gPj4g
bWF4X2RvdGNsb2NrKSAmJg0KPiA+PiArCQkgICAgKChpID4gMCkgJiYgKGlndF9jaGVja19mb3Jj
ZV9qb2luZXJfc3RhdHVzKGRybV9mZCwNCj4gPj4gcHJldl9jb25uX25hbWUpIHx8DQo+ID4+ICsJ
CQkJIGlndF9iaWdqb2luZXJfcG9zc2libGUoJm8tPmttb2RlW2kgLSAxXSwNCj4gPj4gbWF4X2Rv
dGNsb2NrKSkgJiYNCj4gPj4gICAJCSAgICAgKGFicyhjcnRjX2lkeHNbaV0gLSBjcnRjX2lkeHNb
aSAtIDFdKSA8PSAxKSkpIHsNCj4gPj4NCj4gPj4gICAJCQlpZ3RfZGVidWcoIkNvbWJvOiAlcyBp
cyBub3QgcG9zc2libGUgd2l0aCBzZWxlY3RlZA0KPiBtb2RlKHMpLlxuIiwNCj4gPj4gdGVzdF9u
YW1lKTsNCj4gPj4gLS0NCj4gPj4gMi40My4yDQo+ID4NCg==
