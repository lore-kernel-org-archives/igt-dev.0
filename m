Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9A80CF6499
	for <igt-dev@archiver.kernel.org>; Mon, 30 Sep 2024 12:20:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A0B3510E409;
	Mon, 30 Sep 2024 12:20:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QWXRn8td";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3912610E409
 for <igt-dev@lists.freedesktop.org>; Mon, 30 Sep 2024 12:20:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727698857; x=1759234857;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=StqssE6T8IpqQDpv+mbPS+ctUGsBj06jFBqafcZkJBU=;
 b=QWXRn8tdlk/XdwmC3HkGXOQ7aiGbF+zPIrKWLo+rF1HmDNO3rjXrq9oV
 5Oy3ey8D7Uexhp2QagcdrJzWOeyqlw2u7rHx2SbhshGQ/8ZN6v3Qxw5MR
 DZRGDvKEpnN+feTm/CgtfiQUZMYWTtVh8J+4qC6uQ3QU8ZVQIpn0brG0L
 GSuk1888Cds0woNWlyePs5moaSEVIkW3OZ/onBMSHzulyReOEmMW3THQd
 u82Uu8lekRfof170lyzSM+Fp0pvcqpvfB6fi0HCEWzbPnybc9eg8yvvd8
 w08Cqwohn3OrIqSrBEMEPnTSgE8xpm3d5TCqG7iGwP8Fmsg3N0kQWvQkr A==;
X-CSE-ConnectionGUID: NQRqUaygQ2SB1JFs4VE4ww==
X-CSE-MsgGUID: W9PbbvO4Q663eKmTl3nxmg==
X-IronPort-AV: E=McAfee;i="6700,10204,11210"; a="30665438"
X-IronPort-AV: E=Sophos;i="6.11,165,1725346800"; d="scan'208";a="30665438"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Sep 2024 05:20:56 -0700
X-CSE-ConnectionGUID: 6RkaFeU7SbyEHr6DzsWSUA==
X-CSE-MsgGUID: M3k15MedTmqAu+8Jsqq9jg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,165,1725346800"; d="scan'208";a="74077367"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orviesa008.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 30 Sep 2024 05:20:57 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 30 Sep 2024 05:20:55 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 30 Sep 2024 05:20:55 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 30 Sep 2024 05:20:55 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.45) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 30 Sep 2024 05:20:55 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QAtBHz0g9FQY3O54sTLjstAmQIbqau73sTsPxcJD5NmTTyo7mlgn/ee90ZLbuxMEOBr+88nPdOUWdxF8i8fjt7F0QO5EdMw8vZD7D8cwhMdY86PcBwpJxriDOI3Mkjmxt5DDdof0CO+TqLugH+9n6MEhJ7nOWvd7Mm1HJSVTM+zanAWh6jR/DqSUIMWv5MvTp8PMZKs1kZJUKbZ5jojii29Gulcpgw8dyuyXasHV0wRxKaguUenVVynvM4q9hkOovrjeoywjvWED4PobXWIlu7S7SsU1wa7lHYbo36mH9Knq8jJKbgKE2vHCsgtHdZaGRTy08DSwO7UmKmMYfIaYkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=StqssE6T8IpqQDpv+mbPS+ctUGsBj06jFBqafcZkJBU=;
 b=YAlSzjKoVSOLcC5C+POgaDDYPeqcjI8S93C5HeLYDh6Ga8A9k8rIbbxFnZ+Mem902yZR271SkQB2FmCHONgIpwzYVzX4ogrmy0WLKDRLJVLXP5i29blKWzTZVTw00PBwPOaoPIbmbU2yhIYMws2YOEtwR8d6kj2a2ym0lEtrWrvY3o04AGOHL2Zcz3SNcAjrAp5thCe9d3+6XuMhnhCTohxonfbjrIkBzATHxSSXNNdO4dwIifKAJin2mydrSszCA3LiLoMEQXCPiTyjIGMcsFcQMgCGntHf/MN/NcErW3tMTzWgzi2txYf6qW7QyICV2XpPemLt31OL39AMKC9tZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH3PR11MB8434.namprd11.prod.outlook.com (2603:10b6:610:176::19)
 by PH8PR11MB8258.namprd11.prod.outlook.com (2603:10b6:510:1c1::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8005.27; Mon, 30 Sep
 2024 12:20:53 +0000
Received: from CH3PR11MB8434.namprd11.prod.outlook.com
 ([fe80::1670:23da:3abe:c525]) by CH3PR11MB8434.namprd11.prod.outlook.com
 ([fe80::1670:23da:3abe:c525%5]) with mapi id 15.20.8005.024; Mon, 30 Sep 2024
 12:20:53 +0000
From: "Dandamudi, Priyanka" <priyanka.dandamudi@intel.com>
To: "Ch, Sai Gowtham" <sai.gowtham.ch@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
Subject: RE: [PATCH] tests/intel/xe_tlb: Add test to check TLB invalidation
Thread-Topic: [PATCH] tests/intel/xe_tlb: Add test to check TLB invalidation
Thread-Index: AQHbEy3YY/cyOkTxgEuD3Nnc15R0qbJwP+ww
Date: Mon, 30 Sep 2024 12:20:53 +0000
Message-ID: <CH3PR11MB8434971FF9D94BCBB860878B8D762@CH3PR11MB8434.namprd11.prod.outlook.com>
References: <20240930115038.2045395-1-sai.gowtham.ch@intel.com>
In-Reply-To: <20240930115038.2045395-1-sai.gowtham.ch@intel.com>
Accept-Language: en-IN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH3PR11MB8434:EE_|PH8PR11MB8258:EE_
x-ms-office365-filtering-correlation-id: 770756a7-c6db-45ea-3076-08dce14a53dd
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|10070799003|1800799024|376014|38070700018; 
x-microsoft-antispam-message-info: =?utf-8?B?VG85MUlLNTRlL3lHTzdJczRyNUlLS09KMHkyMVY1eXArS25ZOTBBV2RzQi9u?=
 =?utf-8?B?bVc3aGIzTkVHck9RdHhDNDR5cFpzYjN5TlQ1cXNuRHRQQnZsK2IxY1dqQmVP?=
 =?utf-8?B?REhIN1NoZS9ybU9KWWpBeE42a1pBcHE5TDZUN3duU3BRQldPeldMMWJzOXhL?=
 =?utf-8?B?dkRHQVFlY0creG5NWDZIeU9Ud3BNVXdTaEMwYjkvcGs4aDZDMjJMREpCNEhS?=
 =?utf-8?B?ZWRJK1ExSUlTekVvdXJKd2VEWFI0L01aZmpLK3dYM1MrRXpNS0k1b251RC9i?=
 =?utf-8?B?UXIweVlZYXlhb01WRlUwYnovcytITWZkVGR4OWlzWkJteWd6UFVvd2lTMCtt?=
 =?utf-8?B?cm5keHdoWUE0SmhYbDN4ZmlzK2RNcHNFQnNuYkZIUFNNM283clQ5TmtKZHdJ?=
 =?utf-8?B?a0JRRmtHbSs1Q1ZkRkZackdVeGs2eTFRRXBjZkRyV2g4TVhVTU9tMU9DZEVL?=
 =?utf-8?B?MnB6VVM4UEx0QnlwYjhobEp0ajhHMjJsa0dkblJXeEptOWJISE5ZVUljbnNR?=
 =?utf-8?B?ZXZPNzFDaE1nSmxJbDJpUWE4ckxvS2cwdkxCT3NCdm1odGRVVU0zdFgxNjdL?=
 =?utf-8?B?MmtLNmdZVHowMVB5UG5yUytUNEZVMGlpOHhBMDhOVll1RjNPSGRpMStzeHAy?=
 =?utf-8?B?bzRpZXEvdCtOYlU0U054R3BKNWlFMDlqMWQ5Ukx1WmY4MC80Q1QvSDdUWjVD?=
 =?utf-8?B?S0EzcXJLQ01BSXRKeFpRdTR1bGY3TjZ4QmFHbllMckVNRkIrTGcrNXd0OEsx?=
 =?utf-8?B?VW1DMVFLMzhKa0RZQTBoakVwR0JORmZiS3daNmdtemloc2NzUHdCbTBFSUx4?=
 =?utf-8?B?SkhHT0k0K2U5U3BiRW1IUkNzOU1FNFBvaDJtb0lEWXJ2Vk0vK3RpOTdOT2Ft?=
 =?utf-8?B?enlJUUU5MDloVVpuWHFHZnlCOXVyWEZ4WXVyN1duYkducklWWjhZVTVKbnpH?=
 =?utf-8?B?WkFoMno5emlqcjJHdGpOYTJFS1NqWUR2VTRiMmlURE81QU5EZktnQjFNdUlN?=
 =?utf-8?B?UUpPQXJrSmJhanMvN3dMUVh5MFlPUUVRaUhTYnBkK2I2VndGYVcvWk03djhC?=
 =?utf-8?B?bnVJQUtuVjRyYnRaWjFRUVB5OFlTNVdla0hFM0pIRmtpZndPQkRqUHUyQUs5?=
 =?utf-8?B?MU9LNG1JUUQwNFhvOFNTcE5yckt4S3FFdExQaFg2M1Q2d21oejNmSVhNVDZZ?=
 =?utf-8?B?K2VIODZzTEFKVit6bTE0Tmxad1pjellUVDNYNE1vMloxenIxVjJ3dksrTVlq?=
 =?utf-8?B?a0orcTk1cE1BbjNOQWsxZEFrWGc5NXVCcjZUTzRQeWs2bWRoY2ZqWmVGbkU5?=
 =?utf-8?B?WHhURWF4a01aVm1YQ3ErR1hrNGNzNS96b0Q4WElGQlEwbC9lbmdRV01LVUxI?=
 =?utf-8?B?Uk94YnQrc0FHdDI0TUp0ZmlFTjlDamVEdVRTWldMSFZveks0OGVqWWlnRjZI?=
 =?utf-8?B?clNzTXR0dHZYSTVNN3h3ZG9lZDF3TmxzWkxNZ0ZlemZmaW9kK2dSNVlpS0JC?=
 =?utf-8?B?RHR5VldDMmJaQzB0ZDVOK3huMEYreHlRWDNkaWJNbUpCUEZlb29BcVdkTlpy?=
 =?utf-8?B?b2F0MVNBT0kzMFdCcHRVL0hjWFhtVVNhZHc1VHBCclZDaXNubzRlaUlpcTdU?=
 =?utf-8?B?T2RWK0kzTlkxdkJhS3MwQkNVZkJzUDllcktXeVI1Zzg3SGhyYnh0dTZjbWc2?=
 =?utf-8?B?cU9QYTg4YzVUYUd6VElmZWp5OTNKWU91aXFJK25xN2lJbEU2WlFmUXR2U2RK?=
 =?utf-8?B?dy9Pby9UcThKMlg2N3dyWFM1QTZ3YWNYV2NBZ3VOTUhaYkZCbWFaWHdaZzB1?=
 =?utf-8?B?K3M2SFdYM0JNQi80d015dz09?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB8434.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(10070799003)(1800799024)(376014)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?azRkOGkrdFNnOVgwOFF2RWdWSHZPYzQyYXplaGpDemcvZjFjWnJlUjJuVERJ?=
 =?utf-8?B?cjZQOWFkVjBOY0Ezb3JLVUZMcWhSdVZhQU9uSStCU0cvOVcvaXZXbDhXT3Ex?=
 =?utf-8?B?WXBHa3h4SnFldVN4RDRpai9zZU5kVmZaMFBwQktpUko3Rk1WOUJDOXo0MWZD?=
 =?utf-8?B?WW5HWHdMdWVmZWp4MkNlWHRDNkthK3p3elNRMWM5Q3dKbTJ3V3pENVBSK0dV?=
 =?utf-8?B?NXp2U1lKa0pkejZTT0ZLQ1d0eGlTQWRUbWpJaE5BRHduZllvOFBCdmtUdmFr?=
 =?utf-8?B?Ui9GUEw1OGw3RmpBKzFCNi9QK0hIbHN3MnI5N1YvOFZwbTFnYjFsUjF4L3RF?=
 =?utf-8?B?VWM1amtubmtkZXFYak00eEQ4eFVaWXdybmRJZVV1MVpCc2xmQ1psN1c5QlB4?=
 =?utf-8?B?anoyS08xVVJKSHl3ajllT0gyNncwYnZFeEEvQjdjanIwMmc3OE40bmdkbjBm?=
 =?utf-8?B?TlNRbU1OTW9lcTF3eHZTd292eitVZk1VQWZYZEZKMzhZV2ZPVmNCZ2V0VHJ3?=
 =?utf-8?B?NVFPdzFmYTd1ZC9VZVB2bXAxYjBaTXA0ZE1NMWs5dkRDWEs1ZDRoQnhoZlh4?=
 =?utf-8?B?bWdmTCt4ZXB4UEpHMWk4aGhpK3VHaC9BbittbDlaK2t3ZnNyWVIxalozc1A0?=
 =?utf-8?B?YXovZlZxYWYyTm5YVXE3MmRFZ3F4dlorajJhUnBtQUV3aEV2UXFTUlJ5dGFi?=
 =?utf-8?B?aDhNbGNHWXJJa2lFZmIzVjFzMEEwY0g3MWM3NlF3NkFtdGdLNnV6eWwzbmlC?=
 =?utf-8?B?ZURsRFMrOVFOcEVwSVRtbEhEbmNDSjdQNCtkNUhGVGtTR0hoOXdSVkFrV1FJ?=
 =?utf-8?B?NmJrTWJIOHFUNS9WaWIvRTFseE1TTjExbHVtQ05tcmZyWVFvVVdEdEIreXUy?=
 =?utf-8?B?MVhiOElybUhtV05adHllelorT3ZLNElnRUYya2FFSDU0VnhsZnRiQWtndERY?=
 =?utf-8?B?M0lBeitsTUJNS0tCTmFBTWhQWXVFZDl4cktINk9PcGQ5WFAxZUFzQXZScWZB?=
 =?utf-8?B?YlBZdWY3Zys0c0pPajhhUjM2cTE5RHQ2SHl6Tk1yWUhiR1NtMkZWbytLN2Fx?=
 =?utf-8?B?Y25kYjRHZXhsc2xiZnRISzNsekVIb3BLZUZmazNvZGpWN1RoRmxaWWRYZm9u?=
 =?utf-8?B?Ukkvb2M2V1JLeU5hZlM2MTUzKy9ZbDdhR1Z0OHVaUmU3cGwzb3pqeXhOSEtn?=
 =?utf-8?B?VGU5NjVZV3RXOVcxNXNycnY3Tk1CUlRLdTlNYUs1VnJodzNBeGNBZ2pReG5l?=
 =?utf-8?B?NkxIZzhlbGdkS010OWtYQWpNTHM2WTVKbk9xZlV1Ykw2a3IwWVl6ZW9PZHRZ?=
 =?utf-8?B?YWRPemcvWFZHeUdzTzkwbGZBM2FQMS93Ry9QRmlzU2Fxd2M5QXJrc3poT2pa?=
 =?utf-8?B?aCt0VEZmdk8xM04vbVNwZjZ0RDl6eFFmUit1Y0twN2tSYkh3K1Rsc0dCRTV4?=
 =?utf-8?B?VUoxbkt3dDV1cWQ1SXVQdzdzUjJ4Z2plQjVXdTc3aDBFSHIySDFJZEZ1ZmZB?=
 =?utf-8?B?TlY4K3pLUnVPUlZNQlVnWEZMM1hZVUlFeGxHb3RBdWNodmgxem9tYWVmNUdh?=
 =?utf-8?B?VUd0ZlhOR2FTc2EvNjdEZkdoQWsxR3RzWDhKUUJkeUJ0Y2lzdFdwU0dGTHQr?=
 =?utf-8?B?VzZOUHoyK0hGa1pjY2t1bWJrMG4wckNwRkp4MXhBT1hKR2FSWnA5RHAyRzRN?=
 =?utf-8?B?MVQvTFJ1ZE1kYXk1ait4MDdibUhEL0RhSWZsRnFZVE9NY0k4NDlEWWlwbDJ0?=
 =?utf-8?B?bWpSeXdGS2FEVjV6eHVYcXRPSTFiOVR2NVVUOFB2bmE1S09NWC9RZWwxSkk3?=
 =?utf-8?B?OTRtRlZnMndOMWFoQi9VUHdPU2FvM2VhdVoyejJVeFNYYzROUzlObEg1RWNi?=
 =?utf-8?B?RkgyTExKcmFEejB0a3RCaEZqMDdybG1CMzBaVHhuTTB2T1NvWVowandMWElE?=
 =?utf-8?B?WmJqRVNhK0twSjlkNXZEKzNLaDFwU3V2SGhNT0VidFV3ejY0QWg5dGhvYWtX?=
 =?utf-8?B?QWRGM2pDTlQxOXpYN09NOXlTUHFHbnR0YXdFbGRUOHRQMUNVTGE0TWo5L1RR?=
 =?utf-8?B?Mk1JdEF2alpoQ3hJVG9LWGd2Y0RPYUZVYmU0M0xjT2ttZFdZY0c2L3BVQXcx?=
 =?utf-8?B?d1U1VlkyeHNSL3ZlRTNYYzVPSWhDNEkxR2JVdWloS2w5bi9wRHhPM0dsS0ZH?=
 =?utf-8?B?UHYwMGc4alJhaGcrWTdlbXFTZXZweGcrbGlpM1lTa29iMEVQOW13M2J3NW5J?=
 =?utf-8?B?MXFXOVQvNkd3TGZlU3VadGVDaUZnPT0=?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8434.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 770756a7-c6db-45ea-3076-08dce14a53dd
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Sep 2024 12:20:53.0403 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: P1+rVHa42AVGNd7Q7jNte9iAG0IaFJykyYK2YbkAgb6Pk4mB+OtmlhTwuEO+RWHQViw0w2pV1nP0GBWV6wgYfeI42YQ28i5vzVfIEOHnqXU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB8258
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

TEdUTQ0KUmV2aWV3ZWQtYnkgOiBQcml5YW5rYSBEYW5kYW11ZGkgPFByaXlhbmthLmRhbmRhbXVk
aUBpbnRlbC5jb20+DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogQ2gs
IFNhaSBHb3d0aGFtIDxzYWkuZ293dGhhbS5jaEBpbnRlbC5jb20+DQo+IFNlbnQ6IE1vbmRheSwg
U2VwdGVtYmVyIDMwLCAyMDI0IDU6MjEgUE0NCj4gVG86IGlndC1kZXZAbGlzdHMuZnJlZWRlc2t0
b3Aub3JnOyBEYW5kYW11ZGksIFByaXlhbmthDQo+IDxwcml5YW5rYS5kYW5kYW11ZGlAaW50ZWwu
Y29tPjsgQ2gsIFNhaSBHb3d0aGFtDQo+IDxzYWkuZ293dGhhbS5jaEBpbnRlbC5jb20+DQo+IFN1
YmplY3Q6IFtQQVRDSF0gdGVzdHMvaW50ZWwveGVfdGxiOiBBZGQgdGVzdCB0byBjaGVjayBUTEIg
aW52YWxpZGF0aW9uDQo+IA0KPiBGcm9tOiBTYWkgR293dGhhbSBDaCA8c2FpLmdvd3RoYW0uY2hA
aW50ZWwuY29tPg0KPiANCj4gVGVzdCB2YWxpZGF0ZXMgVExCIGludmFsaWRhdGlvbiBieSBiaW5k
aW5nIGRpZmZlcmVudCBidWZmZXIgb2JqZWN0cyB3aXRoIHRoZQ0KPiBzYW1lIHZtYSBhbmQgc3Vi
bWl0dGluZyB3b3JrbG9hZCBzaW11bHRhbmVvdXNseSwgSWRlYWxseSBleHBlY3RpbmcgZ3B1IHRv
DQo+IGhhbmRsZSBwYWdlcyBieSBpbnZhbGlkYXRpbmcgYW5kIGF2b2RpbmcgcGFnZSBmYXVsdHMu
DQo+IA0KPiBDYzogTmlybW95IERhcyA8bmlybW95LmRhc0BpbnRlbC5jb20+DQo+IENjOiBQcml5
YW5rYSBEYW5kYW11ZGkgPHByaXlhbmthLmRhbmRhbXVkaUBpbnRlbC5jb20+DQo+IFNpZ25lZC1v
ZmYtYnk6IFNhaSBHb3d0aGFtIENoIDxzYWkuZ293dGhhbS5jaEBpbnRlbC5jb20+DQo+IC0tLQ0K
PiAgdGVzdHMvaW50ZWwveGVfdGxiLmMgfCAxNjIgKysrKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrKw0KPiAgdGVzdHMvbWVzb24uYnVpbGQgICAgfCAgIDEgKw0KPiAgMiBm
aWxlcyBjaGFuZ2VkLCAxNjMgaW5zZXJ0aW9ucygrKQ0KPiAgY3JlYXRlIG1vZGUgMTAwNjQ0IHRl
c3RzL2ludGVsL3hlX3RsYi5jDQo+IA0KPiBkaWZmIC0tZ2l0IGEvdGVzdHMvaW50ZWwveGVfdGxi
LmMgYi90ZXN0cy9pbnRlbC94ZV90bGIuYyBuZXcgZmlsZSBtb2RlIDEwMDY0NA0KPiBpbmRleCAw
MDAwMDAwMDAuLjg4MDlkMDllYw0KPiAtLS0gL2Rldi9udWxsDQo+ICsrKyBiL3Rlc3RzL2ludGVs
L3hlX3RsYi5jDQo+IEBAIC0wLDAgKzEsMTYyIEBADQo+ICsvKiBTUERYLUxpY2Vuc2UtSWRlbnRp
ZmllcjogTUlUICovDQo+ICsvKg0KPiArKiBDb3B5cmlnaHQgwqkgMjAyNCBJbnRlbCBDb3Jwb3Jh
dGlvbg0KPiArKg0KPiArKiBBdXRob3JzOg0KPiArKiAgICBTYWkgR293dGhhbSBDaCA8c2FpLmdv
d3RoYW0uY2hAaW50ZWwuY29tPg0KPiArKi8NCj4gKyNpbmNsdWRlICJpZ3QuaCINCj4gKyNpbmNs
dWRlICJsaWIvaWd0X3N5bmNvYmouaCINCj4gKyNpbmNsdWRlICJ4ZS94ZV9pb2N0bC5oIg0KPiAr
I2luY2x1ZGUgInhlL3hlX3F1ZXJ5LmgiDQo+ICsjaW5jbHVkZSAieGVfZHJtLmgiDQo+ICsjaW5j
bHVkZSAiaWd0X2RlYnVnZnMuaCINCj4gKw0KPiArLyoqDQo+ICsgKiBURVNUOiBDaGVjayBUcmFu
c2xhdGlvbiBMb29rYXNpZGUgQnVmZmVyIEludmFsaWRhdGlvbi4NCj4gKyAqIENhdGVnb3J5OiBT
b2Z0d2FyZSBidWlsZGluZyBibG9jaw0KPiArICogTWVnYSBmZWF0dXJlOiBHZW5lcmFsIENvcmUg
ZmVhdHVyZXMNCj4gKyAqIFN1Yi1jYXRlZ29yeTogQ01EIHN1Ym1pc3Npb24NCj4gKyAqIEZ1bmN0
aW9uYWxpdHk6IFRMQiBpbnZhbGlkYXRlDQo+ICsgKiBUZXN0IGNhdGVnb3J5OiBmdW5jdGlvbmFs
aXR5IHRlc3QNCj4gKyAqLw0KPiArc3RydWN0IGRhdGEgew0KPiArCXVpbnQzMl90IGJhdGNoWzE2
XTsNCj4gKwl1aW50MzJfdCBkYXRhOw0KPiArCXVpbnQ2NF90IGFkZHI7DQo+ICt9Ow0KPiArDQo+
ICtzdGF0aWMgdm9pZCBzdG9yZV9kd29yZF9iYXRjaChzdHJ1Y3QgZGF0YSAqZGF0YSwgdWludDY0
X3QgYWRkciwgaW50DQo+ICt2YWx1ZSkgew0KPiArCWludCBiOw0KPiArCXVpbnQ2NF90IGJhdGNo
X29mZnNldCA9IChjaGFyICopJihkYXRhLT5iYXRjaCkgLSAoY2hhciAqKWRhdGE7DQo+ICsJdWlu
dDY0X3QgYmF0Y2hfYWRkciA9IGFkZHIgKyBiYXRjaF9vZmZzZXQ7DQo+ICsJdWludDY0X3Qgc2Rp
X29mZnNldCA9IChjaGFyICopJihkYXRhLT5kYXRhKSAtIChjaGFyICopZGF0YTsNCj4gKwl1aW50
NjRfdCBzZGlfYWRkciA9IGFkZHIgKyBzZGlfb2Zmc2V0Ow0KPiArDQo+ICsJYiA9IDA7DQo+ICsJ
ZGF0YS0+YmF0Y2hbYisrXSA9IE1JX1NUT1JFX0RXT1JEX0lNTV9HRU40Ow0KPiArCWRhdGEtPmJh
dGNoW2IrK10gPSBzZGlfYWRkcjsNCj4gKwlkYXRhLT5iYXRjaFtiKytdID0gc2RpX2FkZHIgPj4g
MzI7DQo+ICsJZGF0YS0+YmF0Y2hbYisrXSA9IHZhbHVlOw0KPiArCWRhdGEtPmJhdGNoW2IrK10g
PSBNSV9CQVRDSF9CVUZGRVJfRU5EOw0KPiArCWlndF9hc3NlcnQoYiA8PSBBUlJBWV9TSVpFKGRh
dGEtPmJhdGNoKSk7DQo+ICsNCj4gKwlkYXRhLT5hZGRyID0gYmF0Y2hfYWRkcjsNCj4gK30NCj4g
Kw0KPiArc3RhdGljIGludCB0bGJfY291bnQoaW50IGZkLCBpbnQgZ3QpDQo+ICt7DQo+ICsJY2hh
ciB0bGJfcGF0aFs0MDk2XTsNCj4gKwljaGFyIHBhdGhbMjU2XTsNCj4gKwlpbnQgY291bnQ7DQo+
ICsNCj4gKwlzcHJpbnRmKHBhdGgsICIvc3lzL2tlcm5lbC9kZWJ1Zy9kcmkvMC9ndCVkL3N0YXRz
IiwgZ3QpOw0KPiArCWlndF9kZWJ1Z2ZzX2R1bXAoZmQsIHBhdGgpOw0KPiArCWlndF9kZWJ1Z2Zz
X3JlYWQoZmQsIHBhdGgsIHRsYl9wYXRoKTsNCj4gKw0KPiArCXNzY2FuZih0bGJfcGF0aCwgIiUq
W146XTogJWQiLCAmY291bnQpOw0KPiArCWlndF9pbmZvKCIlc1xuIiwgdGxiX3BhdGgpOw0KPiAr
DQo+ICsJcmV0dXJuIGNvdW50Ow0KPiArfQ0KPiArDQo+ICsvKioNCj4gKyAqIFNVQlRFU1Q6IGJh
c2ljLXRsYg0KPiArICogRGVzY3JpcHRpb246IENoZWNrIFRyYW5zbGF0aW9uIExvb2thc2lkZSBC
dWZmZXIgSW52YWxpZGF0aW9uLg0KPiArICovDQo+ICtzdGF0aWMgdm9pZCB0bGJfaW52YWxpZGF0
aW9uKGludCBmZCwgc3RydWN0DQo+ICtkcm1feGVfZW5naW5lX2NsYXNzX2luc3RhbmNlICplY2kp
IHsNCj4gKwlzdHJ1Y3QgZHJtX3hlX3N5bmMgc3luY1syXSA9IHsNCj4gKwkJeyAudHlwZSA9IERS
TV9YRV9TWU5DX1RZUEVfU1lOQ09CSiwgLmZsYWdzID0NCj4gRFJNX1hFX1NZTkNfRkxBR19TSUdO
QUwsIH0sDQo+ICsJCXsgLnR5cGUgPSBEUk1fWEVfU1lOQ19UWVBFX1NZTkNPQkosIC5mbGFncyA9
DQo+IERSTV9YRV9TWU5DX0ZMQUdfU0lHTkFMLCB9DQo+ICsJfTsNCj4gKwlzdHJ1Y3QgZHJtX3hl
X2V4ZWMgZXhlYyA9IHsNCj4gKwkJLm51bV9iYXRjaF9idWZmZXIgPSAxLA0KPiArCQkubnVtX3N5
bmNzID0gMiwNCj4gKwkJLnN5bmNzID0gdG9fdXNlcl9wb2ludGVyKCZzeW5jKSwNCj4gKwl9Ow0K
PiArCXN0cnVjdCBkYXRhICpkYXRhMTsNCj4gKwlzdHJ1Y3QgZGF0YSAqZGF0YTI7DQo+ICsJdWlu
dDMyX3Qgdm07DQo+ICsJdWludDMyX3QgZXhlY19xdWV1ZTsNCj4gKwl1aW50MzJfdCBiaW5kX2Vu
Z2luZTsNCj4gKwl1aW50MzJfdCBzeW5jb2JqOw0KPiArCXNpemVfdCBib19zaXplOw0KPiArCWlu
dCB2YWx1ZTEgPSAweDEyMzQ1NjsNCj4gKwlpbnQgdmFsdWUyID0gMHgxMjM0NjU7DQo+ICsJdWlu
dDY0X3QgYWRkciA9IDB4MTAwMDAwOw0KPiArCXVpbnQzMl90IGJvMSwgYm8yOw0KPiArCWludCB0
bGJfcHJlLCB0bGJfcG9zOw0KPiArDQo+ICsJc3luY29iaiA9IHN5bmNvYmpfY3JlYXRlKGZkLCAw
KTsNCj4gKwlzeW5jWzBdLmhhbmRsZSA9IHN5bmNvYmpfY3JlYXRlKGZkLCAwKTsNCj4gKwlzeW5j
WzFdLmhhbmRsZSA9IHN5bmNvYmo7DQo+ICsNCj4gKwl2bSA9IHhlX3ZtX2NyZWF0ZShmZCwgMCwg
MCk7DQo+ICsJYm9fc2l6ZSA9IHNpemVvZigqZGF0YTEpOw0KPiArCWJvX3NpemUgPSB4ZV9iYl9z
aXplKGZkLCBib19zaXplKTsNCj4gKwlibzEgPSB4ZV9ib19jcmVhdGUoZmQsIHZtLCBib19zaXpl
LA0KPiArCQkJCSAgIHZyYW1faWZfcG9zc2libGUoZmQsIGVjaS0+Z3RfaWQpLA0KPiArDQo+IERS
TV9YRV9HRU1fQ1JFQVRFX0ZMQUdfTkVFRFNfVklTSUJMRV9WUkFNKTsNCj4gKwlibzIgPSB4ZV9i
b19jcmVhdGUoZmQsIHZtLCBib19zaXplLA0KPiArCQkJCSAgIHZyYW1faWZfcG9zc2libGUoZmQs
IGVjaS0+Z3RfaWQpLA0KPiArDQo+IERSTV9YRV9HRU1fQ1JFQVRFX0ZMQUdfTkVFRFNfVklTSUJM
RV9WUkFNKTsNCj4gKw0KPiArCXRsYl9wcmUgPSB0bGJfY291bnQoZmQsIGVjaS0+Z3RfaWQpOw0K
PiArCWV4ZWNfcXVldWUgPSB4ZV9leGVjX3F1ZXVlX2NyZWF0ZShmZCwgdm0sIGVjaSwgMCk7DQo+
ICsJYmluZF9lbmdpbmUgPSB4ZV9iaW5kX2V4ZWNfcXVldWVfY3JlYXRlKGZkLCB2bSwgMCk7DQo+
ICsJeGVfdm1fYmluZF9hc3luYyhmZCwgdm0sIGJpbmRfZW5naW5lLCBibzEsIDAsIGFkZHIsIGJv
X3NpemUsIHN5bmMsDQo+IDEpOw0KPiArCWRhdGExID0geGVfYm9fbWFwKGZkLCBibzEsIGJvX3Np
emUpOw0KPiArDQo+ICsJc3RvcmVfZHdvcmRfYmF0Y2goZGF0YTEsIGFkZHIsIHZhbHVlMSk7DQo+
ICsJZXhlYy5leGVjX3F1ZXVlX2lkID0gZXhlY19xdWV1ZTsNCj4gKwlleGVjLmFkZHJlc3MgPSBk
YXRhMS0+YWRkcjsNCj4gKwlzeW5jWzBdLmZsYWdzICY9IH5EUk1fWEVfU1lOQ19GTEFHX1NJR05B
TDsNCj4gKwlzeW5jWzFdLmZsYWdzIHw9IERSTV9YRV9TWU5DX0ZMQUdfU0lHTkFMOw0KPiArCXhl
X2V4ZWMoZmQsICZleGVjKTsNCj4gKwlpZ3RfYXNzZXJ0KHN5bmNvYmpfd2FpdChmZCwgJnN5bmNv
YmosIDEsIElOVDY0X01BWCwgMCwgTlVMTCkpOw0KPiArCXhlX3ZtX2JpbmRfYXN5bmMoZmQsIHZt
LCBiaW5kX2VuZ2luZSwgYm8yLCAwLCBhZGRyLCBib19zaXplLCBzeW5jLA0KPiAxKTsNCj4gKwlk
YXRhMiA9IHhlX2JvX21hcChmZCwgYm8yLCBib19zaXplKTsNCj4gKw0KPiArCXN0b3JlX2R3b3Jk
X2JhdGNoKGRhdGEyLCBhZGRyLCB2YWx1ZTIpOw0KPiArCWV4ZWMuZXhlY19xdWV1ZV9pZCA9IGV4
ZWNfcXVldWU7DQo+ICsJZXhlYy5hZGRyZXNzID0gZGF0YTItPmFkZHI7DQo+ICsJc3luY1swXS5m
bGFncyAmPSB+RFJNX1hFX1NZTkNfRkxBR19TSUdOQUw7DQo+ICsJc3luY1sxXS5mbGFncyB8PSBE
Uk1fWEVfU1lOQ19GTEFHX1NJR05BTDsNCj4gKwl4ZV9leGVjKGZkLCAmZXhlYyk7DQo+ICsJaWd0
X2Fzc2VydChzeW5jb2JqX3dhaXQoZmQsICZzeW5jb2JqLCAxLCBJTlQ2NF9NQVgsIDAsIE5VTEwp
KTsNCj4gKw0KPiArCXRsYl9wb3MgPSB0bGJfY291bnQoZmQsIGVjaS0+Z3RfaWQpOw0KPiArCWln
dF9hc3NlcnRfZXEoZGF0YTEtPmRhdGEsIHZhbHVlMSk7DQo+ICsJaWd0X2Fzc2VydF9lcShkYXRh
Mi0+ZGF0YSwgdmFsdWUyKTsNCj4gKwlpZ3RfYXNzZXJ0KHRsYl9wb3MgPiB0bGJfcHJlKTsNCj4g
Kw0KPiArCXN5bmNvYmpfZGVzdHJveShmZCwgc3luY1swXS5oYW5kbGUpOw0KPiArCXN5bmNvYmpf
ZGVzdHJveShmZCwgc3luY29iaik7DQo+ICsJbXVubWFwKGRhdGExLCBib19zaXplKTsNCj4gKwlt
dW5tYXAoZGF0YTIsIGJvX3NpemUpOw0KPiArCWdlbV9jbG9zZShmZCwgYm8xKTsNCj4gKwlnZW1f
Y2xvc2UoZmQsIGJvMik7DQo+ICsJeGVfZXhlY19xdWV1ZV9kZXN0cm95KGZkLCBleGVjX3F1ZXVl
KTsNCj4gKwl4ZV92bV9kZXN0cm95KGZkLCB2bSk7DQo+ICt9DQo+ICsNCj4gK2lndF9tYWluDQo+
ICt7DQo+ICsJaW50IGZkOw0KPiArCXN0cnVjdCBkcm1feGVfZW5naW5lICplbmdpbmU7DQo+ICsN
Cj4gKwlpZ3RfZml4dHVyZSB7DQo+ICsJCWZkID0gZHJtX29wZW5fZHJpdmVyKERSSVZFUl9YRSk7
DQo+ICsJfQ0KPiArDQo+ICsJaWd0X3N1YnRlc3QoImJhc2ljLXRsYiIpIHsNCj4gKwkJZW5naW5l
ID0geGVfZW5naW5lKGZkLCAwKTsNCj4gKwkJdGxiX2ludmFsaWRhdGlvbihmZCwgJmVuZ2luZS0+
aW5zdGFuY2UpOw0KPiArCX0NCj4gKw0KPiArCWlndF9maXh0dXJlIHsNCj4gKwkJZHJtX2Nsb3Nl
X2RyaXZlcihmZCk7DQo+ICsJfQ0KPiArfQ0KPiBkaWZmIC0tZ2l0IGEvdGVzdHMvbWVzb24uYnVp
bGQgYi90ZXN0cy9tZXNvbi5idWlsZCBpbmRleA0KPiA2MmJkZTM1M2IuLjg0NGRlNDlkMSAxMDA2
NDQNCj4gLS0tIGEvdGVzdHMvbWVzb24uYnVpbGQNCj4gKysrIGIvdGVzdHMvbWVzb24uYnVpbGQN
Cj4gQEAgLTMxNyw2ICszMTcsNyBAQCBpbnRlbF94ZV9wcm9ncyA9IFsNCj4gIAkneGVfc3lzZnNf
cHJlZW1wdF90aW1lb3V0JywNCj4gIAkneGVfc3lzZnNfc2NoZWR1bGVyJywNCj4gICAgICAgICAg
J3hlX3N5c2ZzX3RpbWVzbGljZV9kdXJhdGlvbicsDQo+ICsgICAgICAgICd4ZV90bGInLA0KPiAg
XQ0KPiANCj4gIGludGVsX3hlX2V1ZGVidWdfcHJvZ3MgPSBbDQo+IC0tDQo+IDIuMjUuMQ0KDQo=
