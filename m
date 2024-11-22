Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFDE0E65D2F
	for <igt-dev@archiver.kernel.org>; Fri, 22 Nov 2024 08:08:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 877F110EAED;
	Fri, 22 Nov 2024 08:08:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="V9/DWQAn";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6727510EAE8;
 Fri, 22 Nov 2024 08:08:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1732262937; x=1763798937;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=MP4sX3Dpcurn98BhPA/qiKN2jR1ukD46foV/gR9CFEk=;
 b=V9/DWQAnGFwElXksiAywFQD6z8vNZn+Y3qVrcbw+ncvNKZN3zceZV8gb
 nof4iun5ynuB3EhgrNE4ypHnqtzHV7jmqslGNTkABvhlh3lTaBgsQA+4r
 hbj7caVRQjAFjTdvA1ybqh0gN5//CIdWfZi3FYHw0e5ZSOBJPhq4O0JyH
 ZvYXjL7kmVPtNpMwSfqq+GnUZ2Fy+kXk/jgh5vJpnnOlZcM0gxTJ8NDI/
 CGofeap/MhclTOdc+0Hl3zKUm+MJXdaD6/tiz+rPA/tnSMC9kSNtoknOl
 Auh2eSngR1MVpprnpXWbQJ8xBB3uIMbh/Ws0xAIjaIGtvnbPx7PcDwLBV w==;
X-CSE-ConnectionGUID: xemR2FcPS0Osv/YPCSrPRQ==
X-CSE-MsgGUID: VueHFbr5RgiNwqe+ClxywQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11263"; a="49928293"
X-IronPort-AV: E=Sophos;i="6.12,175,1728975600"; d="scan'208";a="49928293"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Nov 2024 00:08:57 -0800
X-CSE-ConnectionGUID: xuBbs5SlSQyzrZ945K4Ytg==
X-CSE-MsgGUID: PIchE91MTAeVA4htDPpoGQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,175,1728975600"; d="scan'208";a="90919865"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa009.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 22 Nov 2024 00:08:57 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 22 Nov 2024 00:08:56 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 22 Nov 2024 00:08:56 -0800
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.48) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 22 Nov 2024 00:08:56 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rPTYAA42RogtHE373b0rchE+pCf4dmjepJJlExhPI3yLDTr5dTSz5Vlm2TsdkKhqQHAj1V0YbIa63xE9iGtOT5UW00f/V29RqHASyliricUOau+bFGXTJVTZIiCk6zkCQSvxovMushmvbG60Tm4qLH0KLTDNnvLAj9Ath5Ht+UqnrnngCgudADVw0SpjMeD3SzenJEJHITjofdFYkN+BrDUEYHlKrdQO765/UvtuK7wDbQd/xkCqEpj128QYWJ2af500vanAqT8nxRtKxCxOSqmKCB2Lp3StIxkPsq0s+4IeyHdSOizJcaaRqlW5PcScpznB6GWJCr49eyKAnSj6bw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MP4sX3Dpcurn98BhPA/qiKN2jR1ukD46foV/gR9CFEk=;
 b=shfMCUzgdjMn9gaWLcGckbnz7DDe9KndVmtUIScoExh9eB6XVf7P1eV2W353Jt8xF1ZDO0zT4QAD6ZmUjuqHqbxk9CiEmZhy59pcGamjqFzkztZlhNT0RNI8CIs7tKtrpbY3P3qYk6EA6ZpqiwiMOKo2jUobArEvo+8m83O2VJIq32pteVlZaxAx4/eKzx/eJXwrAhm1LRzyWRfLwo3A7harE4LMSoPj5Kulvi+sPtm543O0dbcmxB1A7NnOSkSxPUbfZSHTh7B9oFGPGFUOAsUh+ShwMYa1tDvEViGPixnKV+DgFTf6QL1YHLqJB6hrR72d+y2Tt7xr0qwM9pGE9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from PH8PR11MB6753.namprd11.prod.outlook.com (2603:10b6:510:1c8::22)
 by LV8PR11MB8488.namprd11.prod.outlook.com (2603:10b6:408:1e7::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8182.14; Fri, 22 Nov
 2024 08:08:53 +0000
Received: from PH8PR11MB6753.namprd11.prod.outlook.com
 ([fe80::2554:e827:dbde:714]) by PH8PR11MB6753.namprd11.prod.outlook.com
 ([fe80::2554:e827:dbde:714%7]) with mapi id 15.20.8158.024; Fri, 22 Nov 2024
 08:08:53 +0000
From: "Illipilli, TejasreeX" <tejasreex.illipilli@intel.com>
To: "i915-ci-infra@lists.freedesktop.org"
 <i915-ci-infra@lists.freedesktop.org>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>
Subject: =?utf-8?B?UkU6IOKclyBpOTE1LkNJLkJBVDogZmFpbHVyZSBmb3IgaWd0LXJ1bm5lciBm?=
 =?utf-8?Q?act_checking_(rev8)?=
Thread-Topic: =?utf-8?B?4pyXIGk5MTUuQ0kuQkFUOiBmYWlsdXJlIGZvciBpZ3QtcnVubmVyIGZhY3Qg?=
 =?utf-8?Q?checking_(rev8)?=
Thread-Index: AQHbPFf0FSV6sm8Zk0S0aLbSA6Fcd7LC2Q8AgAAZq5A=
Date: Fri, 22 Nov 2024 08:08:53 +0000
Message-ID: <PH8PR11MB6753294C97C8ACF1832615D2F2232@PH8PR11MB6753.namprd11.prod.outlook.com>
References: <136a49f8-8173-47a8-ac5d-e62e972e1005@linux.intel.com>
 <173222262236.1312350.79223373296069783@b555e5b46a47>
 <267a718c-1d29-4e3e-824f-09d707a6c396@linux.intel.com>
In-Reply-To: <267a718c-1d29-4e3e-824f-09d707a6c396@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH8PR11MB6753:EE_|LV8PR11MB8488:EE_
x-ms-office365-filtering-correlation-id: 247afc60-484a-4cdd-64dc-08dd0acce7e9
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|10070799003|366016|1800799024|38070700018|7053199007; 
x-microsoft-antispam-message-info: =?utf-8?B?VSt3a1BNd1lEdHlQRlJjSGM4YVJxckwzMmJUaSs3NnFnTitzbExHejJKU2Y3?=
 =?utf-8?B?YzAweVI5S1dIZWFJNEhJOUZxVmRTVG9obGxibncrN05aYld0alU5TzVDYldH?=
 =?utf-8?B?U0pIdWoxWVg5TURTK3hhOHh3Yll1Tkx6SzAyN2VCN0JTOU5KQ1MybVdlNEI2?=
 =?utf-8?B?Wk1pRk1ZM0xseGFTVG9mZGtaa0o5OHJGbnBXbXA4S2xXdVQyczFWKyt3WVpP?=
 =?utf-8?B?NmZMTWNZYjJ5c3ZtaGtBMGFzRitJQmYxYVFCbEljMm4yYWxtZy8ya0xMQXUx?=
 =?utf-8?B?Q3BabHc4UTdOS0hRdU9EL2M0ZzdzSG9tOWJ5UWVOSm1CMUQxbHZ3WTdHcWdC?=
 =?utf-8?B?U3E0UmpBR1FZTVBUb1JmVlVvUitLUHd3ZjJvc0hoQ2FXbm1qNkZ5R21vNXlZ?=
 =?utf-8?B?N0U4Zjdid1BRejE2RkdCRlUvQnozM1VkcG14MmhtU1lRa3J5VU9FUHMvSHMv?=
 =?utf-8?B?U3llYmt1Y3pWOTYwd2x0Ym5xaUlQeldzby9NZXlhMzJwNi9MUFVOSUU1Nnpq?=
 =?utf-8?B?OUtKdnpLUVl4dUFyMVZ4S1BkQ2xENVpXUDRFbnFpRHc3WGV4WnB6RVBkK1pK?=
 =?utf-8?B?RTNvaXFNQi93RTFYOEc5SzduRGE5YW5ybDRCUnJ3MzBsZitqU0lUdHUveFRT?=
 =?utf-8?B?cTZGMy93cDh3UUpSUkhrSEUrWGFONUo5U091TlFDV0J3QStzNlpIVWpGbHV5?=
 =?utf-8?B?VTREN05IZUI4N2l0MzIwQWJHeFEzeHcyRzQxTmU5c3ZyTHlhY0Njc0VFRHM3?=
 =?utf-8?B?R2lBOHhrbWNXVE1pNnl0emRPTkJLdmNXWVJ0eTVHQkNHQ1owUHBwS2dKa1Vs?=
 =?utf-8?B?enQ2dGRGV094dlNoRzJWd1Mzb2s0a3drdnV5VHhEaDdQUGNNc2N1anZtajVW?=
 =?utf-8?B?aW42SkFiR1hMQVF1MzRCSEtxb1hwdFh3OWJQSU91c1VsbVhidzdndUtZempw?=
 =?utf-8?B?M1ArWkliOGhvYnd3MDJqYmJtczBLZERDV3l0UDF2b2xlTTVjV1ozSEIvUUlN?=
 =?utf-8?B?RWFnKytTcGdNWHcwbVMwRjExV1kvZmd4MmphN0pvZi9yWVFGSTRhM0Q3bHNG?=
 =?utf-8?B?d2llZ2pwMmh3eFh1elhYVVFzZWJ0V2o4R1dhSUVnOVFlN2U1K1BIWGdCcmRs?=
 =?utf-8?B?NUI3L08zWFFJWW5tcmFEU3puT0QwR0JudHpOZVhJcTlZeXBRYk44Zml2dXND?=
 =?utf-8?B?NE5KOEFDZE9wQWxNblBxRGxsamlzUlZ0cTNQTGkwSFcwOE5BVE04S2kzc3VL?=
 =?utf-8?B?WFI3N3ExUVhBMDRaZ2t3MSttRkw4N1ZFbUdZUXpOaDVrV2JFYlVYVkFGSkF2?=
 =?utf-8?B?NGZ1eWRLNzhyTG5jUFlnSS9vK0g2YmJRVXNVekpXRkJGd05DVTZTR3UvaGt5?=
 =?utf-8?B?OWZBSm1oQ3NleGRlTzllNFo1c0szOFNEcGpUWC81cGRGdEZyMDZoSUhzckh4?=
 =?utf-8?B?YnRHYnFWV1hwZkNjUWF2Y1hvaVpZcEJTN2p3SWdpY25Ma3hiMXM1NnFOM2NF?=
 =?utf-8?B?ckRSdUZGVHBPUkVteFM4ZERtMVA5Wm1BR1ZsdXlNZ3F6V2dXTFZJdVdxaHFt?=
 =?utf-8?B?QVRHUlcwS0RHRzRLMHRVUytqL25hQjFaTjhWclEzMFg4Z2czM2JxWGI3Qlkr?=
 =?utf-8?B?cWhMTkhtcllVU1NTcWU4T295YTVVRGRMUVJjNm1ydWlwT1lIOTlnQlI3c2dT?=
 =?utf-8?B?QzNoSDk4R04yTWNhQTVmVEIwYVo4RmUrWVAxaitmdnJmQ0JMbmowOVltMVZ4?=
 =?utf-8?Q?kp2SwRXOiYT5qtsIBexZ3P/LL8g6lCV4T8g+ABh?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB6753.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(10070799003)(366016)(1800799024)(38070700018)(7053199007);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?MWk2Q3hiMmptOHhlZHRzVm9LSHhONnRyb244aXFjdUNVQ1VkT1k4QmRYWjZ3?=
 =?utf-8?B?YWFId3dSUnI5aGM5ZWt5RHhCS0l0bTEzNlBnTFFXNXBDTmNieThKMU5WaldI?=
 =?utf-8?B?VXR1ZnozVzVtYzE4MFhPZWJlVWFoZ3p2RHZJRitHbkI1L2xtdkloRzZGZ2Rj?=
 =?utf-8?B?MXhJcWxVeHVuLzArYUFLMGZPeTg5ZlljWDB3Tko3S2RyOHFzdUNXZithczVZ?=
 =?utf-8?B?ajJCNGJNVXBML3RDNEhjR3RmUGdRZGc3ZFNrSldZN29ja2FyaENja1pGUncx?=
 =?utf-8?B?TU1lWUQrazA1dDNYMmZpcks2Y1dzc0NVZTMwOXNqckRuQW1ONEN5bG1vb0Y4?=
 =?utf-8?B?SVorWkNWRDRDdWs4SCtjcTFMQ0YzR056RjhVLzRHeWwwQTVWa2UrS21kNTNa?=
 =?utf-8?B?Qks1VjlhYnRwdWwyUW5odFZqSHgzRCtnZE9HeGIzMUhuZGtKSjVsZW9ua1Jx?=
 =?utf-8?B?cVJ0N2x5WFg3MWgzM3dQejJLcWJTN1NOZVd2MVkvVW5UelJMQjd1ckY4c3Zt?=
 =?utf-8?B?QmRPY2F2UE1HRnhiNlhFTGpUcVRDanhJRkJQaE9qdCtwMlNtMXYwQ0dYemJH?=
 =?utf-8?B?WWxORkxFUlJwbmZMTzJOU3BFRGxZeDV4dU1vblJub3ZsUFRoRVJ4WU5KWk5C?=
 =?utf-8?B?azRkVUhleGpwWEpuaGlDTjJUMzhaSnI4cklzalU1VFNXZjRCVnNXWk5GTTdE?=
 =?utf-8?B?ODFyczZDUVU1T05JVmp2M3FROWpjSjZGUXVOOGZuN2htSlExNHFOT1RFRTQw?=
 =?utf-8?B?a3ZDQ1VJbWlhMmZza2RaOXlSN3RNU1Erbmx0S2ZOWU1MTlF0TVhobUpjdTJS?=
 =?utf-8?B?Z2ZzeTNEN1dHaCtrV2NxNitiVkhvdnVjdWc3dlo4QTBzNnphZnJuSWRLcTVG?=
 =?utf-8?B?ZmtWMi9McE1obVBUMnFCZ2hwbk02YTNZQ3pEQytWTnhsM294dnhhckMxY09L?=
 =?utf-8?B?ZkR4RHBKUVJ6TkVLaGJlUFU5Y1FZZHdIS1NqdEw5TXBldUM2Qmd1dHVsYTcw?=
 =?utf-8?B?SG9ZdmRVb2g0ZVBZemEwMXo3eEJMaUxJT2gvcCtpYktyMG91aHU5NkdxVVhH?=
 =?utf-8?B?dWtUbFhnQUdLT2oycDZieUtrZjlSemZhY0N4SGZRU3ExMVVKckpOKzU0SW1O?=
 =?utf-8?B?Ny9aOGQ4c2tzMG1aek5TSmNaNmgyeXlVOGg1OTdPNzEvVWVicWcvbUFFRE84?=
 =?utf-8?B?UlBhekRqWFZqK1NKRHV2aWVOM3JJK2VuVEtxaDh5ZmtlZHQvWVdDcG9mVS9l?=
 =?utf-8?B?bFRVQmY3L0xBVjNLbWlkY3hUL3hqMFBmT0MyaVl4ZWRTUHFFSUE3VC9wZTJI?=
 =?utf-8?B?UTgrWVlsYytSVUxJUlJRcURnY21oK0liV2ZRZlFkWmJ0TWs5cFo4Q1c4UXhn?=
 =?utf-8?B?dFgrQXRFSXZvOGRDTzF5a2ZiMkluQlFEbjdzZmhTTmlRUFcrMGw3QjQ1bHQ1?=
 =?utf-8?B?LzBHazJUUnA1MlJQREpzcGRoM1orYkNqenMxSjRQVk1qaGJVbW1tbEtYM3ky?=
 =?utf-8?B?K0YrSUtZbTd2MHVHVTNTNnN0aXBJZlhwUXFEbndPMTdiYzR5NkFKODdaak1i?=
 =?utf-8?B?cDFNNnJzRlIwQVJSS0JndnZSV2EySjY0M2hCTkUrRW1CeGFkcjF2cGlIVzcz?=
 =?utf-8?B?SVpTY3pObXNMRStIdGY4Rm5yT05MdGN3ZlpOUGJYZGZic0lVd1E2d25oM1JX?=
 =?utf-8?B?cUN1bmZPeFZFcUJ0TjAzSy8reGN6VUE1WXBzMlBOcDMrK3IyYzBIS0VjenVm?=
 =?utf-8?B?bVUyR3l0Nm41ajhZeHdpSjhBcE1jM3FGWDhZcCtDcld0cERiUE4yNHVBNnI4?=
 =?utf-8?B?ek1oclBPK0l3VU9Wc2hpR0VMS1FPdTg0QVh1eDhERjBnc2Ivb0JJRDNXajRF?=
 =?utf-8?B?d3ZvV3loMGQ5QVZFSXpycDFHUlNFVmpTVWN6d29VTWFGWTYyRlpyTzJYQzNu?=
 =?utf-8?B?L0V0ZWhFalVVNDNCQU9teFdWSzZraVB0S3ZJOVkwbEJEa3hVaHIyZGU0Q2wy?=
 =?utf-8?B?K2h3dXBiYms5UUppZHZ2UUcwVzhRa0E5c0IxbGRqWTZlQXpEcTY3UUpROVhl?=
 =?utf-8?B?S3JMQjY3YkRkVU5QbVZZTEZEbmpmZWg3K0lWR1BtU3NUQWl3N2hGd04ra1hG?=
 =?utf-8?B?RkcyOTF2a3BkT2xHelRqK01CWndJaXRiaHZqM1l1TXNLNWhQa0U2aGMySDcy?=
 =?utf-8?B?Qlh0LzRjNDU4Qi9hd0N1d0lRbWZQNE9aQktySE1xVmp4bzFuNUxkRG04emRU?=
 =?utf-8?B?VjMxeFY2aHhsdlNKUWp4M0JTcUFRPT0=?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB6753.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 247afc60-484a-4cdd-64dc-08dd0acce7e9
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Nov 2024 08:08:53.6882 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: VwPLbMe4tnnOpzTXPHIOJ35RSegIyc1IPrOUaX3DTkiXfeTGurdfniBeDJEswfJz3Jx1jXE7DI6tws/MJCgeeZ+b7C01NlZopItPLfYHfa4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR11MB8488
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

SGksDQoNCmh0dHBzOi8vcGF0Y2h3b3JrLmZyZWVkZXNrdG9wLm9yZy9zZXJpZXMvMTQwODQxLyAt
IFJlLXJlcG9ydGVkLg0KDQpUaGFua3MsDQpUZWphc3JlZQ0KDQotLS0tLU9yaWdpbmFsIE1lc3Nh
Z2UtLS0tLQ0KRnJvbTogSTkxNS1jaS1pbmZyYSA8aTkxNS1jaS1pbmZyYS1ib3VuY2VzQGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZz4gT24gQmVoYWxmIE9mIFBldGVyIFNlbm5hIFRzY2h1ZGluDQpTZW50
OiBGcmlkYXksIE5vdmVtYmVyIDIyLCAyMDI0IDEyOjA3IFBNDQpUbzogaWd0LWRldkBsaXN0cy5m
cmVlZGVza3RvcC5vcmc7IEk5MTUtY2ktaW5mcmFAbGlzdHMuZnJlZWRlc2t0b3Aub3JnDQpTdWJq
ZWN0OiBSZTog4pyXIGk5MTUuQ0kuQkFUOiBmYWlsdXJlIGZvciBpZ3QtcnVubmVyIGZhY3QgY2hl
Y2tpbmcgKHJldjgpDQoNCkRlYXIgSTkxNSwNCg0KT24gMjEuMTEuMjAyNCAyMTo1NywgUGF0Y2h3
b3JrIHdyb3RlOg0KDQo+ID09IFNlcmllcyBEZXRhaWxzID09DQo+IA0KPiBTZXJpZXM6IGlndC1y
dW5uZXIgZmFjdCBjaGVja2luZyAocmV2OCkNCj4gVVJMICAgOiBodHRwczovL3BhdGNod29yay5m
cmVlZGVza3RvcC5vcmcvc2VyaWVzLzE0MDg0MS8NCj4gU3RhdGUgOiBmYWlsdXJlDQo+IA0KPiA9
PSBTdW1tYXJ5ID09DQo+IA0KPiBDSSBCdWcgTG9nIC0gY2hhbmdlcyBmcm9tIElHVF84MTIxIC0+
IElHVFBXXzEyMTYzIA0KPiA9PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09DQo+IA0KPiBTdW1tYXJ5DQo+IC0tLS0tLS0NCj4gDQo+ICAgKipGQUlMVVJF
KioNCj4gDQo+ICAgU2VyaW91cyB1bmtub3duIGNoYW5nZXMgY29taW5nIHdpdGggSUdUUFdfMTIx
NjMgYWJzb2x1dGVseSBuZWVkIHRvIGJlDQo+ICAgdmVyaWZpZWQgbWFudWFsbHkuDQo+ICAgDQo+
ICAgSWYgeW91IHRoaW5rIHRoZSByZXBvcnRlZCBjaGFuZ2VzIGhhdmUgbm90aGluZyB0byBkbyB3
aXRoIHRoZSBjaGFuZ2VzDQo+ICAgaW50cm9kdWNlZCBpbiBJR1RQV18xMjE2MywgcGxlYXNlIG5v
dGlmeSB5b3VyIGJ1ZyB0ZWFtIChJOTE1LWNpLWluZnJhQGxpc3RzLmZyZWVkZXNrdG9wLm9yZykg
dG8gYWxsb3cgdGhlbQ0KPiAgIHRvIGRvY3VtZW50IHRoaXMgbmV3IGZhaWx1cmUgbW9kZSwgd2hp
Y2ggd2lsbCByZWR1Y2UgZmFsc2UgcG9zaXRpdmVzIGluIENJLg0KPiANCj4gICBFeHRlcm5hbCBV
Ukw6IA0KPiBodHRwczovL2ludGVsLWdmeC1jaS4wMS5vcmcvdHJlZS9kcm0tdGlwL0lHVFBXXzEy
MTYzL2luZGV4Lmh0bWwNCj4gDQo+IFBhcnRpY2lwYXRpbmcgaG9zdHMgKDQ1IC0+IDQ0KQ0KPiAt
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0NCj4gDQo+ICAgTWlzc2luZyAgICAoMSk6IGZp
LXNuYi0yNTIwbSANCj4gDQo+IFBvc3NpYmxlIG5ldyBpc3N1ZXMNCj4gLS0tLS0tLS0tLS0tLS0t
LS0tLQ0KPiANCj4gICBIZXJlIGFyZSB0aGUgdW5rbm93biBjaGFuZ2VzIHRoYXQgbWF5IGhhdmUg
YmVlbiBpbnRyb2R1Y2VkIGluIElHVFBXXzEyMTYzOg0KPiANCj4gIyMjIElHVCBjaGFuZ2VzICMj
Iw0KPiANCj4gIyMjIyBQb3NzaWJsZSByZWdyZXNzaW9ucyAjIyMjDQo+IA0KPiAgICogaWd0QGk5
MTVfc2VsZnRlc3RAbGl2ZToNCj4gICAgIC0gYmF0LWFybGgtMjogICAgICAgICBbUEFTU11bMV0g
LT4gW0FCT1JUXVsyXQ0KPiAgICBbMV06IGh0dHBzOi8vaW50ZWwtZ2Z4LWNpLjAxLm9yZy90cmVl
L2RybS10aXAvSUdUXzgxMjEvYmF0LWFybGgtMi9pZ3RAaTkxNV9zZWxmdGVzdEBsaXZlLmh0bWwN
Cj4gICAgWzJdOiBodHRwczovL2ludGVsLWdmeC1jaS4wMS5vcmcvdHJlZS9kcm0tdGlwL0lHVFBX
XzEyMTYzL2JhdC1hcmxoLTIvaWd0QGk5MTVfc2VsZnRlc3RAbGl2ZS5odG1sDQo+ICAgICAtIGJh
dC1hZGxwLTY6ICAgICAgICAgW1BBU1NdWzNdIC0+IFtBQk9SVF1bNF0NCj4gICAgWzNdOiBodHRw
czovL2ludGVsLWdmeC1jaS4wMS5vcmcvdHJlZS9kcm0tdGlwL0lHVF84MTIxL2JhdC1hZGxwLTYv
aWd0QGk5MTVfc2VsZnRlc3RAbGl2ZS5odG1sDQo+ICAgIFs0XTogDQo+IGh0dHBzOi8vaW50ZWwt
Z2Z4LWNpLjAxLm9yZy90cmVlL2RybS10aXAvSUdUUFdfMTIxNjMvYmF0LWFkbHAtNi9pZ3RAaTkN
Cj4gMTVfc2VsZnRlc3RAbGl2ZS5odG1sDQoNClRoZXNlIGFyZSBub3QgcmVsYXRlZCB0byBteSBj
aGFuZ2UuIENhbiB5b3UgcGxlYXNlIGZpeCBhbmQgcmVydW4/DQoNClsuLi5dDQo=
