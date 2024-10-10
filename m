Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 492E8CF07A5
	for <igt-dev@archiver.kernel.org>; Thu, 10 Oct 2024 05:27:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 04FEE10E865;
	Thu, 10 Oct 2024 05:27:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CkpgxSQN";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 167D410E865
 for <igt-dev@lists.freedesktop.org>; Thu, 10 Oct 2024 05:27:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1728538026; x=1760074026;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=vteIgEe8XZ9makIosOx1mre2nTvaqtBeXchReSQMEzk=;
 b=CkpgxSQN6azXeciCQ3c0ckktmLfjUSJqqhZ4n0gqDj0yBLjG+svT6c1E
 B/8G/1IaOY2uCQV9P0/PKAKY4l6Vt5t3Hk5efy6UIv2HYZiQ7nNugPxdp
 Ww7HOCNMI6wQQNnz3nbKTglGjJevxr8aeOibPZ67Z92PLOyNyrFJUeIcQ
 9xcydQAI8BwjeIJr2jm85mNTB08jiDkTKxHvJVxiyL1jzzacn+7UV/4NM
 B6Kkn+G7A3RiJhY420xoMGFTJLKQCIJqchfX6XIlJV//riGNBR6lPRIQn
 fn01x1sEIqqEB9QvrjIm+FSTA4X7RIeEahoDAzgV+FxvOQY6dCpoEIQdi A==;
X-CSE-ConnectionGUID: hNMK/pqDRmeQtxoj5iHyXQ==
X-CSE-MsgGUID: cjw69UVoRbStEctOkmKCGQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11220"; a="28003764"
X-IronPort-AV: E=Sophos;i="6.11,192,1725346800"; d="scan'208";a="28003764"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Oct 2024 22:27:05 -0700
X-CSE-ConnectionGUID: wDp4X6csTiGl1P3qrRZydw==
X-CSE-MsgGUID: 1rNB3UbJSCOVAdwQ5a9ZDg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,192,1725346800"; d="scan'208";a="80473736"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmviesa003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 09 Oct 2024 22:27:06 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 9 Oct 2024 22:27:05 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 9 Oct 2024 22:27:05 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 9 Oct 2024 22:27:05 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.41) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 9 Oct 2024 22:27:04 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yZ70kTfzHvgNRvP8665yvNtUNUdDyxnxWLjCozJlbAgp0bgFHH2NaFmWqkYuMB9Xi8+kZ4hP/IGo9Gz5ZFKiICn9NJdxKP2mJAZXMTz77OE+XE0EBwX88H7Cgqg5DIcobACpeECKLVKwSAhDZx6DGbIRLKuXmiIZqNDvrHKG+fOjcoQ5GBUguVUBLjW8mLsabqSHCrymMIZGrgBVo+g9lBG1T7WLzomWMJdVGWYQ/H3vKpHWfmf3xbb2o39/0axGYcs/TTxNNLQEJITsUOhwJKui6hlKeKS48eC6Y+GQz0LMbsAp6sBwBfcpbu4YhFKSHTySL3XLX1xmeH1ulTDM0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vteIgEe8XZ9makIosOx1mre2nTvaqtBeXchReSQMEzk=;
 b=TkCOc99Y3TIuIen75fXH5myUWGAa3QeExoT6lBykTGZvQNROUN7+YQXUMUvz6zjCExkufnAex/++JMFXTCxrb+FC/1EbFYIgpspKlnZuseZ/MEh7ce0SQaZn8fd3DtcWC9VQSz7Aezbbs8FiosA3gPfKMexGsQdpBkw4gYdg0su1sXnAFSQWjoBxv62sr54rcbS5DudYxfIOs9szyqHfZijAdEoC8kJfjSb322PBIMpi4+WyYi46wjXfmxnglCOeRcgOyFXPUMQbPQHp4psHyo1PFaz9Ca4ewNMpm+Gb0IgstBw1VRQei9hKPfvSQoE4KlfNgPCuw2xW8pbTObkpJA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from PH7PR11MB8252.namprd11.prod.outlook.com (2603:10b6:510:1aa::14)
 by DM4PR11MB5232.namprd11.prod.outlook.com (2603:10b6:5:38b::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8026.24; Thu, 10 Oct
 2024 05:26:57 +0000
Received: from PH7PR11MB8252.namprd11.prod.outlook.com
 ([fe80::625b:17f6:495f:7ad]) by PH7PR11MB8252.namprd11.prod.outlook.com
 ([fe80::625b:17f6:495f:7ad%5]) with mapi id 15.20.8026.020; Thu, 10 Oct 2024
 05:26:56 +0000
From: "Anirban, Sk" <sk.anirban@intel.com>
To: "Tauro, Riana" <riana.tauro@intel.com>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>, "Gupta, Anshuman" <anshuman.gupta@intel.com>
CC: "Nilawar, Badal" <badal.nilawar@intel.com>
Subject: RE: [PATCH i-g-t] tests/xe: Add tests to validate GT coarse power
 gating status and toggle coarse power gating states
Thread-Topic: [PATCH i-g-t] tests/xe: Add tests to validate GT coarse power
 gating status and toggle coarse power gating states
Thread-Index: AQHbGno4uxE1j6jJSUOoiQGA7GeMNrJ/cQsAgAADkZA=
Date: Thu, 10 Oct 2024 05:26:56 +0000
Message-ID: <PH7PR11MB825262C685FEBCB008357F8D80782@PH7PR11MB8252.namprd11.prod.outlook.com>
References: <20241009183115.1981713-1-sk.anirban@intel.com>
 <9cf15121-2f87-45a2-93ec-ade00d3c1c7c@intel.com>
In-Reply-To: <9cf15121-2f87-45a2-93ec-ade00d3c1c7c@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH7PR11MB8252:EE_|DM4PR11MB5232:EE_
x-ms-office365-filtering-correlation-id: 04254dfb-ff5d-48fd-b1c5-08dce8ec2828
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?RHBKNy9NTVpmNmZuQjZQSEd4QTNid2syekJaZmlYeVJWZmZSTC9uY0p2ZGZQ?=
 =?utf-8?B?K0NmVCtZc3krREFvY2FvUkptR3dKVmZsQm8rNU5rSlRjNnBPQm5MYUdCckdM?=
 =?utf-8?B?RHJwTm41bEZFWk9YT1NObDUzOGF4NmRpNkMzdnp5V2JOTkx6eU5GT0NhN0F6?=
 =?utf-8?B?UTg5c2hlUjU3THlXbHVHWDFadGVCbEpqVEtaeE5JQm9TcEZ1ajZ0SEdLeVI4?=
 =?utf-8?B?eDZOREd0MFdMUVFxajRONWdUUlg5VTRVVFU3MEk0TWZEWDB5WENxVWcrRGhs?=
 =?utf-8?B?aUwraExLRjJsdGxZVlR2bWVKRUpLU004Rjd4M2Q0b3ZUaUl1bEQrcUo1Tlhu?=
 =?utf-8?B?TzRReTVFSWNOL1JJa05OMWZxU3F2VTBWa1pIazFwMUd4UWxCY1YzN2Fab3p5?=
 =?utf-8?B?Y0JMc3pPZk10ckdWeG5qK1Exd3ZiN3BlMTNkWlpDdzNVaklOQ25vckp0Vnlr?=
 =?utf-8?B?aXJEQU1Md00rTEp3QTg1THdpbFhIendyNWhZc0xKMnhGZ09NRzc2Nmhkd0Jz?=
 =?utf-8?B?ZFRkRWZGTnlGUUFnZExFcHprUmt3dDB3UHo5RmUvNjVLV24yZFlmaEZJc2dx?=
 =?utf-8?B?WENiRDQ0RlprNldIK0Y1WVJBK2dwdkVmQkFpWnFPalY5ODRYTTM5SFpsNWJZ?=
 =?utf-8?B?cURtSkVjVUxkWlh6SW9wSlFpZVhGNEI1SmVKd0lsN0phZEE5Y2t3MVRjcW5M?=
 =?utf-8?B?MjZDbmlTTzJpenlENlc3bTBhaXVjQUFyVU92NWRuSWgzemNLS25RakowMFlX?=
 =?utf-8?B?TWFjSExpQmczLzhGY0h1d0FiTmlCeGE3YTJSRU1IUEhIY2cwWUVzd1FkSHVM?=
 =?utf-8?B?N3ZYMFo0N1h4M0hUYkxDQ2wyS1pBcmd2WW1MN0VZRWxDQVR6TTlYZnRISTVa?=
 =?utf-8?B?TDQ4d2Q3dGdoSHp1MHd3UGNRUnNqUUVVSzhpR3U5Sk1YSS9qZy9hS1BhTTZR?=
 =?utf-8?B?a1Z2WG1lRUswRnhOYU4yQ05ickxMR2lacDFRTGZWQWhtbWRONFIvOFkzUk5N?=
 =?utf-8?B?NGNWc2tSZG1tQ3ozMEQ2RmNzc29wK2xkemcreDh2S01hVEEyejBoU2dXOWRz?=
 =?utf-8?B?WGo1Vjl6ZkJNaCs2eWJmNEVQM2JWOVNsNGVCaGYyMUJvNXdWb0h5c1hVa3JQ?=
 =?utf-8?B?WmlnODZ3SGJNOHhEVFlHQkx3b1lnS1dRU2VkdjlkQnFlTXF4VTd1UnQ3N2NN?=
 =?utf-8?B?TFlLNFNEbEMyZ2tTVzZaczcwSnJZTmFBM1JGbGZaUWora0Jyc3dqdVUzeWt3?=
 =?utf-8?B?bnUvQ21rNDB0N2Fub3RwQTdIK0NjVnhxaElWc2Vtd3o1OXR3QW1BcXNQTEVH?=
 =?utf-8?B?VzJzbG9oSEtkZHcybXd0VS9JZDhXRnlOaEJKdDUvVEY1dE4vSW4vY0owZ2Ni?=
 =?utf-8?B?TUJtSXBqQnlCQUgwRzYwc1V0cHdZVmhHYldYMWNsMUpTMjgxYTQ0QVZ4QlQw?=
 =?utf-8?B?VXpsdnhvWlQ2V2pIY3YzWDhMOVZ6Q3MwMDh4Vmx6SlRWeU10aFFHNmh5ektn?=
 =?utf-8?B?N3FjZ1ZrbFpUZ1lOVzhEVVBFaVV3dWRleU5ZMkJxTVpqVjY4aGxhUGREODlZ?=
 =?utf-8?B?N2FrRXE0NzVZUmQ4THFjaUZBZTljUWw2Mlh0clVoRmk1eTVIeTJLdkttaTRR?=
 =?utf-8?B?cjRaVkg2ZGcyemlqak5lRzFJb1dVeURBVnl3VmNsdzM2S1hWSWVVSHZwZGha?=
 =?utf-8?B?RXVaWmN3SUE2aHEvdmw0YTRzVEJic0cwNzhwMnA2N0tZdFZ5d2tmNmhXd3ky?=
 =?utf-8?B?SSs5eVpQL2V5alVHYWwzTkt1d2dhQzFQbG0wOTZJUmZ5b242SWVBOTZsTlNa?=
 =?utf-8?B?QzdNQUYwUTgxRmRWeDloUT09?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB8252.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Ukh5MlViNHdUbHlsWkZoc3EyOHhUMTBIcUNBT01hMXRXVGtiYXd0a3JyNXVo?=
 =?utf-8?B?ZUpHSUprQkQyLzladGlDWVYrb2l5YVgrelMvZjNDNEIwVEI0Ry90VTNCOXE0?=
 =?utf-8?B?Y2xZa25CZ3hKSEsxbWZCYlFkSTlSUTZ6SHQxL1F0d0VkeGxVN3hraG0vYVZJ?=
 =?utf-8?B?eC9sUjE1WGlQekRnemJvYTRSOEh2M3MwWGl5WkRLckhxNnUzMld1WE5JcExD?=
 =?utf-8?B?c1FHSWlZempBT1poTHo0TElNczBjbzUycXJwRERSejlPNXEwWnNBS3I5Uy9o?=
 =?utf-8?B?dzhmbDZpTHFVNzd5dFZ6b0tnQ0RMOWZSeVpUU3NOOGprZ3BjQjg5ZjVHeVFG?=
 =?utf-8?B?R1owOXp1dFNRZ1BrSVVCbzRNSG16Sjl0R0pCUG5iNjdCaFpDcjdCcWxPcVVN?=
 =?utf-8?B?YWRkaTN5bndubmFXL0hQT3lZcTRqdVJPci9zZ1BmWmhPR0FnMllNMUo4STJz?=
 =?utf-8?B?MHdja3F3RmYvNGszVjVuODRUSlN5dHQwVEpNSHA0NThnNjVxVHNEYTl6VUNK?=
 =?utf-8?B?dWJtN1RVaUFTSDJ2cmhJYjRkSGJsdUs4THkyUVdWZ0dVU2RhTnRGN3JsMnBY?=
 =?utf-8?B?SHZRUlFoTjRRVXZvSEQrTFBDZ0RzekpscFJrVkNnSFRvK1F5QVFPcDJ2bEpz?=
 =?utf-8?B?MGJPT2RrZHloNTAvMHlIZTZEVko3VXpETDFjL0g1VldTSDI0N2g2L2RZY1I0?=
 =?utf-8?B?QW1VbmlqZUphbm1DSkVwQTVtcXdMNEViZTJFZXpwRmhBVk1CVFM2VnB6a2RC?=
 =?utf-8?B?a3F0QXBmWHpCSk1YZWFxdExaY2dKdHo2WWIxK2pxTDdyem1Ld25WcGZ1OVNo?=
 =?utf-8?B?ZzhLcXZqc0UwQ0dmRVEzckZ3RTAyYkt5M1NRMzVRczJzWmNNYmFjRHVBY0lp?=
 =?utf-8?B?aXgwSGdUbEZuSklPQ056Z2JXaStyK1VsWkRyRDNGWlAzcUxHYk5YSzBJUUM0?=
 =?utf-8?B?aGpnUEc3YTA4ekxBNlE4d3M3NlBNeVZoY3ZGUUVrUG9Sdk01WDB6MDl2bDcw?=
 =?utf-8?B?U0Ivc1M4ekFuYi9ncFVoYkhxc2tiSUVMZGUzeUpnM1dLMlpyTDJhK243RE0w?=
 =?utf-8?B?bGRuNGI3YnJhY2luZkNmbmJ6ZDBHVy92bmg0Q0YxWUVhS2NtQzM2WFE4Wk4w?=
 =?utf-8?B?eTJ0SUZKZ2JRNUhaTE9rK1YzcUJ1Sit2RU5KT0E0WnpFMGZveDlHZnlkWGhy?=
 =?utf-8?B?OHhPRHJjMCs1cWMrclZjcjF6Snp4SDVoUkNLK2RrdTRjdlRiY1B3elNMZ3Z5?=
 =?utf-8?B?NThyc0N5YW9JZGxtYXlnSnlzcDVuMlYyd1d0dVNhd2FMU0ptNCtPTmk5NkZJ?=
 =?utf-8?B?cVBqV1k4R0JTN3dGYS93R0lOcFhKenhPYVk0VnNtMHZoR0dhRzA4QzV2eXo1?=
 =?utf-8?B?TkNVS1FtS1NZOEFrNDJvcjlnaWlVaFQ0dFNxVXJVdlIxRzgvUC8rNDB5L05T?=
 =?utf-8?B?cFlWRVYrdnpCMUxxcW9tMHhrN0FJT2FRcTBZeTRVRDJHSHdvcXoxTDl3NkNr?=
 =?utf-8?B?cEViUmRLV3dRM2NDN2FNaE12VFppTjI3bW5rMmpZN1NOREdvaDNCYVpRbytx?=
 =?utf-8?B?TWJlWHNCc2JOVHJCazBmNWllOHNGVVBIUnkzb3J3TkJqQWdxTFZ3N04yY3dw?=
 =?utf-8?B?cTMzNTBnL25aMUdGcGs5SkMvN2pRekRBdE9mN1hxL0FBMnM4cVBhcTNkZmJm?=
 =?utf-8?B?UkZ1TGJ0UzA0RCtGOWhUUVVyMGdqZ1hrTGFlTVJyalg2emJWbFFXMGM1RUhu?=
 =?utf-8?B?dDQvVkE3dTZXWVRGc3lkRlNETVRZODhpZGhtODZjcmU5bWd1OHJxSmg0ZDhj?=
 =?utf-8?B?Ulk3bHc5VlMydW50RkJQT1c4N2tnWkh3Y2JiTDlGNVYyS29aVitWT04xRHh4?=
 =?utf-8?B?NHlheXRjOS9tLzBPOWdFeW9CeERWa2ErTldqd1JQdjRkUmF1ZFpkcDZ2TStR?=
 =?utf-8?B?eUdZWTRib3dxTG0vQVBJd09CVE52WnRScXQ1RGNCZGV6c1d5OGdoMFYrQmh1?=
 =?utf-8?B?cG5aZlRkYTZoVlFnVHhkQXVxbFdvK09LRGg3aWJTaVNrV0lJRWFaK3JkWnNP?=
 =?utf-8?B?MjdnaGNtR1ByeTZ4bi8yOTZJTXhma1V0MHBpU0FsNGwzWXdwVG5QdXN4VEgr?=
 =?utf-8?Q?1Eiag2NaO9hs/Gr0srfIOv98J?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB8252.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 04254dfb-ff5d-48fd-b1c5-08dce8ec2828
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Oct 2024 05:26:56.3247 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /OJZYkmqUGJZur8gRNbHTFJX6k2toVncUIgqwGdk4e0AsNZtHNBJyN6lvWHALJIy2vxIjcQ+uxyuuAsjE5hMmA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB5232
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

SGkgUmlhbmEsDQpXaWxsIGZpeCB0aG9zZSBpc3N1ZXMuDQoNClRoYW5rcywNCkFuaXJiYW4NCg0K
LS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCkZyb206IFRhdXJvLCBSaWFuYSA8cmlhbmEudGF1
cm9AaW50ZWwuY29tPiANClNlbnQ6IFRodXJzZGF5LCBPY3RvYmVyIDEwLCAyMDI0IDEwOjQyIEFN
DQpUbzogQW5pcmJhbiwgU2sgPHNrLmFuaXJiYW5AaW50ZWwuY29tPjsgaWd0LWRldkBsaXN0cy5m
cmVlZGVza3RvcC5vcmc7IEd1cHRhLCBBbnNodW1hbiA8YW5zaHVtYW4uZ3VwdGFAaW50ZWwuY29t
Pg0KQ2M6IE5pbGF3YXIsIEJhZGFsIDxiYWRhbC5uaWxhd2FyQGludGVsLmNvbT4NClN1YmplY3Q6
IFJlOiBbUEFUQ0ggaS1nLXRdIHRlc3RzL3hlOiBBZGQgdGVzdHMgdG8gdmFsaWRhdGUgR1QgY29h
cnNlIHBvd2VyIGdhdGluZyBzdGF0dXMgYW5kIHRvZ2dsZSBjb2Fyc2UgcG93ZXIgZ2F0aW5nIHN0
YXRlcw0KDQpIaSBBbmlyYmFuDQoNCk9uIDEwLzEwLzIwMjQgMTI6MDEgQU0sIHNrLmFuaXJiYW5A
aW50ZWwuY29tIHdyb3RlOg0KPiBGcm9tOiBTayBBbmlyYmFuIDxzay5hbmlyYmFuQGludGVsLmNv
bT4NCj4gDQo+IEltcGxlbWVudCB0ZXN0IHRlc3QtY3BnLWJhc2ljIHRvIHZhbGlkYXRlIGNvYXJz
ZSBwb3dlciBnYXRpbmcgc3RhdHVzIA0KPiB1c2luZyBhIHN1c3BlbmQgY3ljbGUuDQo+IEFkZCB0
ZXN0IHRvZ2dsZS1ndC1jcGcgdG8gY2hlY2sgaWYgR1QgY29hcnNlIHBvd2VyIGdhdGluZyBpcyB1
cCB3aGVuIA0KPiBmb3JjZXdha2UgaXMgYWNxdWlyZWQgYW5kIGRvd24gd2hlbiByZWxlYXNlZC4N
Cj4gDQo+IFNpZ25lZC1vZmYtYnk6IFNrIEFuaXJiYW4gPHNrLmFuaXJiYW5AaW50ZWwuY29tPg0K
PiAtLS0NCj4gICB0ZXN0cy9pbnRlbC94ZV9wbV9yZXNpZGVuY3kuYyB8IDEwNCArKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrDQo+ICAgMSBmaWxlIGNoYW5nZWQsIDEwNCBpbnNlcnRp
b25zKCspDQo+IA0KPiBkaWZmIC0tZ2l0IGEvdGVzdHMvaW50ZWwveGVfcG1fcmVzaWRlbmN5LmMg
DQo+IGIvdGVzdHMvaW50ZWwveGVfcG1fcmVzaWRlbmN5LmMgaW5kZXggNzcyZmU5YjU3Li40MjQ1
ZWE4NzcgMTAwNjQ0DQo+IC0tLSBhL3Rlc3RzL2ludGVsL3hlX3BtX3Jlc2lkZW5jeS5jDQo+ICsr
KyBiL3Rlc3RzL2ludGVsL3hlX3BtX3Jlc2lkZW5jeS5jDQo+IEBAIC00MCw2ICs0MCw3IEBAIGlu
dCBmd19oYW5kbGUgPSAtMTsNCj4gICAJCSAgICAgKGRvdWJsZSkocmVmKSkNCj4gICANCj4gICBl
bnVtIHRlc3RfdHlwZSB7DQo+ICsJVEVTVF9TM0lETEUsDQolcy9URVNUX1MzSURMRS9URVNUX1Mz
DQo+ICAgCVRFU1RfUzJJRExFLA0KPiAgIAlURVNUX0lETEUsDQo+ICAgfTsNCj4gQEAgLTYzLDYg
KzY0LDEyIEBAIGVudW0gdGVzdF90eXBlIHsNCj4gICAgKiBTVUJURVNUOiB0b2dnbGUtZ3QtYzYN
Cj4gICAgKiBEZXNjcmlwdGlvbjogdG9nZ2xlcyBHVCBDIHN0YXRlcyBieSBhY3F1aXJpbmcvcmVs
ZWFzaW5nIGZvcmNld2FrZSwNCj4gICAgKgkJYWxzbyB2YWxpZGF0ZXMgcG93ZXIgY29uc3VtZWQg
YnkgR1BVIGluIEdUIEM2IGlzIGxlc3NlciB0aGFuIHRoYXQgb2YgR1QgQzAuDQo+ICsgKg0KPiAr
ICogU1VCVEVTVDogdGVzdC1jcGctYmFzaWMNCnJlbW92ZSB0ZXN0DQo+ICsgKiBEZXNjcmlwdGlv
bjogVmFsaWRhdGUgR1QgY29hcnNlIHBvd2VyIGdhdGluZyBzdGF0dXMgd2l0aCBhIHN1c3BlbmQg
Y3ljbGUuDQo+ICsgKg0KPiArICogU1VCVEVTVDogdG9nZ2xlLWd0LWNwZw0KPiArICogRGVzY3Jp
cHRpb246IFRvZ2dsZSBHVCBjb2Fyc2UgcG93ZXIgZ2F0aW5nIHN0YXRlcyBieSBhY3F1aXJpbmcv
cmVsZWFzaW5nIGZvcmNld2FrZS4NCj4gICAgKi8NCj4gICBJR1RfVEVTVF9ERVNDUklQVElPTigi
VGVzdHMgZm9yIGd0aWRsZSBwcm9wZXJ0aWVzIik7DQo+ICAgDQo+IEBAIC0zMTcsNiArMzI0LDk0
IEBAIHN0YXRpYyB2b2lkIHRvZ2dsZV9ndF9jNihpbnQgZmQsIGludCBuKQ0KPiAgIAkJCSAgICAg
IlBvd2VyIGNvbnN1bWVkIGluIEdUIEM2IHNob3VsZCBiZSBsb3dlciB0aGFuIEdUIEMwXG4iKTsN
Cj4gICB9DQo+ICAgDQo+ICsjZGVmaW5lIFJFTkRFUl9QT1dFUl9HQVRJTkcgIlJlbmRlciBQb3dl
ciBHYXRpbmcgRW5hYmxlZDogIg0KPiArI2RlZmluZSBNRURJQV9QT1dFUl9HQVRJTkcgIk1lZGlh
IFBvd2VyIEdhdGluZyBFbmFibGVkOiAiDQo+ICsjZGVmaW5lIFBPV0VSX0dBVEVfU1RBVFVTICJQ
b3dlciBHYXRlIFN0YXR1czogIg0KPiArDQo+ICtzdGF0aWMgdm9pZCBwb3dlcmdhdGVfaW5mbyhp
bnQgZmQsIGludCBndCkgew0KPiArCWludCBkaXI7DQo+ICsJY2hhciAqc3RyOw0KPiArCWNoYXIg
KnJlbmRlcl9zdWJzdHI7DQo+ICsJY2hhciAqbWVkaWFfc3Vic3RyOw0KPiArDQo+ICsJZGlyID0g
aWd0X2RlYnVnZnNfZ3RfZGlyKGZkLCBndCk7DQo+ICsJaWd0X2Fzc2VydChkaXIgPj0gMCk7DQo+
ICsNCj4gKwlzdHIgPSBpZ3Rfc3lzZnNfZ2V0KGRpciwgInBvd2VyZ2F0ZV9pbmZvIik7DQo+ICsJ
aWd0X2Fzc2VydF9mKHN0ciwgIkZhaWxlZCB0byByZWFkIHN5c2ZzIGF0dHJpYnV0ZVxuIik7DQo+
ICsJcmVuZGVyX3N1YnN0ciA9IHN0cnN0cihzdHIsIFJFTkRFUl9QT1dFUl9HQVRJTkcpOw0KPiAr
CWlmIChyZW5kZXJfc3Vic3RyICE9IE5VTEwpIHsNCnMvaWYgKHJlbmRlcl9zdWJzdHIgIT0gTlVM
TCkvIGlmKHJlbmRlcl9zdWJzdHIpIEZvciBhbGwgaWYgY29uZGl0aW9ucyBiZWxvdw0KPiArCQlp
Z3RfYXNzZXJ0X2Yoc3RybmNtcChyZW5kZXJfc3Vic3RyICsgc3RybGVuKFJFTkRFUl9QT1dFUl9H
QVRJTkcpLCAieWVzIiwgMykgPT0gMCwNCj4gKwkJIlJlbmRlciBQb3dlciBHYXRpbmcgc2hvdWxk
IGJlIGVuYWJsZWQiKTsNCkluZGVudGF0aW9uLiBTaG91bGQgbWF0Y2ggb3BlbiBwYXJlbnRoZXNp
cw0KPiArCX0NCj4gKw0KPiArCW1lZGlhX3N1YnN0ciA9IHN0cnN0cihzdHIsIE1FRElBX1BPV0VS
X0dBVElORyk7DQo+ICsJaWYgKG1lZGlhX3N1YnN0ciAhPSBOVUxMKSB7DQo+ICsJCWlndF9hc3Nl
cnRfZihzdHJuY21wKG1lZGlhX3N1YnN0ciArIHN0cmxlbihNRURJQV9QT1dFUl9HQVRJTkcpLCAi
eWVzIiwgMykgPT0gMCwNCj4gKwkJIk1lZGlhIFBvd2VyIEdhdGluZyBzaG91bGQgYmUgZW5hYmxl
ZCIpOw0KSW5kZW50YXRpb24uIFNob3VsZCBtYXRjaCBvcGVuIHBhcmVudGhlc2lzDQo+ICsJfQ0K
PiArDQo+ICsJZnJlZShzdHIpOw0KPiArCWNsb3NlKGRpcik7DQo+ICt9DQo+ICsNCj4gKw0KPiAr
c3RhdGljIHZvaWQgcG93ZXJnYXRlX3N0YXR1cyhpbnQgZmQsIGludCBndCwgY29uc3QgY2hhciAN
Cj4gKypleHBlY3RlZF9zdGF0dXMpIHsNCj4gKwlpbnQgZGlyOw0KPiArCWNoYXIgKnN0cjsNCj4g
KwljaGFyICpzdGF0dXNfc3Vic3RyOw0KPiArDQo+ICsJZGlyID0gaWd0X2RlYnVnZnNfZ3RfZGly
KGZkLCBndCk7DQo+ICsJaWd0X2Fzc2VydChkaXIgPj0gMCk7DQo+ICsNCj4gKwlzdHIgPSBpZ3Rf
c3lzZnNfZ2V0KGRpciwgInBvd2VyZ2F0ZV9pbmZvIik7DQo+ICsJaWd0X2Fzc2VydF9mKHN0ciwg
IkZhaWxlZCB0byByZWFkIHN5c2ZzIGF0dHJpYnV0ZVxuIik7DQo+ICsJc3RhdHVzX3N1YnN0ciA9
IHN0cnN0cihzdHIsIFBPV0VSX0dBVEVfU1RBVFVTKTsNCj4gKwl3aGlsZSAoc3RhdHVzX3N1YnN0
ciAhPSBOVUxMKSB7DQo+ICsJCWlndF9hc3NlcnRfZigoc3RybmNtcChzdGF0dXNfc3Vic3RyICsg
c3RybGVuKFBPV0VSX0dBVEVfU1RBVFVTKSwgZXhwZWN0ZWRfc3RhdHVzLA0KPiArCQlzdHJsZW4o
ZXhwZWN0ZWRfc3RhdHVzKSkgPT0gMCksICJQb3dlciBHYXRlIFN0YXR1cyBTaG91bGQgYmUgJXNc
biAlc1xuIiwNCj4gKwkJZXhwZWN0ZWRfc3RhdHVzLCBzdHIpOw0KPiArDQo+ICsJCXN0YXR1c19z
dWJzdHIgPSBzdHJzdHIoc3RhdHVzX3N1YnN0ciArIHN0cmxlbihQT1dFUl9HQVRFX1NUQVRVUyks
DQo+ICsJCVBPV0VSX0dBVEVfU1RBVFVTKTsNCj4gKwl9DQo+ICsJY2xvc2UoZGlyKTsNCj4gK30N
Cj4gKw0KPiArc3RhdGljIHZvaWQgdGVzdF9jcGdfYmFzaWMoaW50IGZkLCBpbnQgZ3QsIGVudW0g
dGVzdF90eXBlIGZsYWcpIHsNCj4gKwlpZ3RfYXNzZXJ0X2YoaWd0X3dhaXQoeGVfaXNfZ3RfaW5f
YzYoZmQsIGd0KSwgMTAwMCwgMSksICJHVCAlZCBub3QgDQo+ICtpbiBDNlxuIiwgZ3QpOw0Kbm90
IG5lY2Vzc2FyeQ0KPiArCWlmIChmbGFnID09IFRFU1RfUzNJRExFKSB7DQp5b3UgZG9uJ3QgbmVl
ZCBhIGZsYWcgc2luY2UgdGhlcmUgYXJlIG5vIG90aGVyIGNvbmRpdGlvbnMNCj4gKwkJcG93ZXJn
YXRlX2luZm8oZmQsIGd0KTsNCj4gKwkJaWd0X3N5c3RlbV9zdXNwZW5kX2F1dG9yZXN1bWUoU1VT
UEVORF9TVEFURV9GUkVFWkUsIA0KPiArU1VTUEVORF9URVNUX05PTkUpOw0KeW91IGhhdmUgbWVu
dGlvbmVkIFMzIGJ1dCB1c2luZyBzMmlkbGUuIFVzZSBTVVNQRU5EX1NUQVRFX1MzDQo+ICsJCXBv
d2VyZ2F0ZV9pbmZvKGZkLCBndCk7DQo+ICsJfQ0KPiArfQ0KPiArDQo+ICtzdGF0aWMgdm9pZCB0
b2dnbGVfZ3RfY3BnKGludCBmZCwgaW50IG4pIHsNCj4gKwlpbnQgZ3Q7DQo+ICsNCj4gKwl4ZV9m
b3JfZWFjaF9ndChmZCwgZ3QpIHsNCnVubmVjZXNzYXJ5IHBhcmVudGhlc2lzDQo+ICsJCXBvd2Vy
Z2F0ZV9pbmZvKGZkLCBndCk7DQo+ICsJfQ0KPiArDQo+ICsJZG8gew0KPiArCQlmd19oYW5kbGUg
PSBpZ3RfZGVidWdmc19vcGVuKGZkLCAiZm9yY2V3YWtlX2FsbCIsIE9fUkRPTkxZKTsNCj4gKwkJ
aWd0X2Fzc2VydF9sdGUoMCwgZndfaGFuZGxlKTsNCj4gKwkJeGVfZm9yX2VhY2hfZ3QoZmQsIGd0
KQ0KPiArCQkJcG93ZXJnYXRlX3N0YXR1cyhmZCwgZ3QsICJ1cCIpOw0KTmVlZCBhbiBleGl0IGhh
bmRsZXIgZm9yIHRoaXMgdGVzdC4gVGhlIGZvcmNld2FrZSB3aWxsIGJlIGhlbGQgaWYgdGhlcmUg
aXMgYW4gYXNzZXJ0DQo+ICsNCj4gKwkJY2xvc2UoZndfaGFuZGxlKTsNCj4gKwkJc2xlZXAoMSk7
DQo+ICsJCXhlX2Zvcl9lYWNoX2d0KGZkLCBndCkNCj4gKwkJCXBvd2VyZ2F0ZV9zdGF0dXMoZmQs
IGd0LCAiZG93biIpOw0KPiArCQl9IHdoaWxlICgtLW4pOw0KQWxpZ25tZW50LiBSZW1vdmUgbG9v
cC4gTm90IHJlcXVpcmVkDQpPbmNlIHNob3VsZCBiZSBlbm91Z2gNCj4gKw0KRXh0cmEgbGluZT8N
Cj4gK30NCj4gKw0KPiAgIGlndF9tYWluDQo+ICAgew0KPiAgIAl1aW50MzJfdCBkM2NvbGRfYWxs
b3dlZDsNCj4gQEAgLTM4MCw2ICs0NzUsMTUgQEAgaWd0X21haW4NCj4gICAJCXRvZ2dsZV9ndF9j
NihmZCwgTlVNX1JFUFMpOw0KPiAgIAl9DQo+ICAgDQo+ICsJaWd0X2Rlc2NyaWJlKCJWYWxpZGF0
ZSBDb2Fyc2UgcG93ZXIgZ2F0aW5nIHN0YXR1cyBkdXJpbmcgc3VzcGVuZCBjeWNsZSIpOw0KPiAr
CWlndF9zdWJ0ZXN0KCJ0ZXN0LWNwZy1iYXNpYyIpDQo+ICsJCXhlX2Zvcl9lYWNoX2d0KGZkLCBn
dCkNCj4gKwkJCXRlc3RfY3BnX2Jhc2ljKGZkLCBndCwgVEVTVF9TM0lETEUpOw0KPiArDQo+ICsJ
aWd0X2Rlc2NyaWJlKCJUb2dnbGUgR1QgY29hcnNlIHBvd2VyIGdhdGluZyBzdGF0ZXMgYnkgbWFu
YWdpbmcgZm9yY2V3YWtlIik7DQo+ICsJaWd0X3N1YnRlc3QoInRvZ2dsZS1ndC1jcGciKQ0KPiAr
CQkJdG9nZ2xlX2d0X2NwZyhmZCwgTlVNX1JFUFMpO0luZGVudGF0aW9uDQoNClRoYW5rcw0KUmlh
bmENCj4gKw0KPiAgIAlpZ3RfZml4dHVyZSB7DQo+ICAgCQljbG9zZShmZCk7DQo+ICAgCX0NCg==
