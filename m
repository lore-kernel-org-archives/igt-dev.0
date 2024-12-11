Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 696DBE7717D
	for <igt-dev@archiver.kernel.org>; Wed, 11 Dec 2024 22:09:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1554910EC39;
	Wed, 11 Dec 2024 22:09:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QSZC729n";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A0F710EC43
 for <igt-dev@lists.freedesktop.org>; Wed, 11 Dec 2024 22:09:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1733954952; x=1765490952;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=fGUpOAASfCpPq1t5TzeCvvWy0WxBlQElIV5nkvizTn0=;
 b=QSZC729nGs45SKCYTjxiFUZAoMlccLthwS0tJ2s7sDAgjyT4WfUvH5AU
 j/Lbct6sJdyfspyULes6PjsLDzEpyphFt7LNwn9Yjj3hXw/6D8EaB3ao1
 PCHBhJJRG9QHzD49Yj0ZH59noTzBCnAj8iVpmVQ4JlVGx50xjvCpCOknF
 UtcQEnhqKPXdOFVrKE/EVKpnzia5YCvJGVcmRCgEI604oDSTW8yt+JLG3
 xWjxPaoL9c7wBB0tVGX3t75ISJ58iKX1fPoF7Lfu+QlgW6cJr/P0ksyBK
 N2b86cAnj3PCuKwkauY8N81p8gzjiupdlnxovi64kBmS/aKoWOQs+P6ub w==;
X-CSE-ConnectionGUID: ZR7UPNZ9QAaAHmTy4BTbxw==
X-CSE-MsgGUID: a6n/Ixy/RqKcbJPo8BcESg==
X-IronPort-AV: E=McAfee;i="6700,10204,11283"; a="34273802"
X-IronPort-AV: E=Sophos;i="6.12,226,1728975600"; d="scan'208";a="34273802"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Dec 2024 14:09:12 -0800
X-CSE-ConnectionGUID: //30INOzT2CIfbeuXjX5ug==
X-CSE-MsgGUID: HhyeD8guTWyICDsKvKsCXw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,226,1728975600"; d="scan'208";a="96475279"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa009.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 11 Dec 2024 14:09:10 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 11 Dec 2024 14:09:09 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 11 Dec 2024 14:09:09 -0800
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.44) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 11 Dec 2024 14:09:09 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fwEUJK+G0ZtWFgbgXFQVcGy0+MYM4aLKirm8JHoCa72DjrA8vsFQ5h09AIpPImr+sTnkr2lu7h3KoAr4l3/bgDbQjH2G+Gb9cO4L6NgqqRTTohmpLaIyO4OrJJs+x1O/HxmBkkYy6kJowXU5cc43Nrucws13DQ251qaUYsPJx+yFGiZ5a3x0K8Ke6B/D9rPpKmuncO6F/Cok1RNRaqNxrxe1c2esO0lFGr2C1ziigJy8Rr2il52W4k8hSCbvaSyeO3vy4Jm9v2BibqZXvMX1nWVJCbTbSse01EY3ury2KtZZwKINT/VnTsKXKpATK0hNLALnrrBMbQg447g/lBhj+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fGUpOAASfCpPq1t5TzeCvvWy0WxBlQElIV5nkvizTn0=;
 b=SLPaaYrSmYZOHwlW0q9qmtFsD6WBe+pX3L/INcQRP+lk3Il+/5K6cFfj1zdFhBArXcuywy60vzKAWLRXsxp9lw+EfuaO9Vy55j0an6VM6V1iQZulY52Z2V1XRM1/6gcF5giUM5TbEJ1zNVJ2VJXYLnByoOE5G78a5AcbTsZxJT5RuhqfKHsFFoNPlz/oeSBADhvH3lrtVeY8RU0hEAB4rfkJBjjLAr+YO5+rjAO77NSJoeeKI6VZkB5bf0Nme+IBpwPC+5I5KaJfqQfyIIySBlNCUdBGTWKAtjbjKDMtAjgH6kLCrgwofXmOs75Sk8HpA9OfO7X6l3JoIx4+LyYAEw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5751.namprd11.prod.outlook.com (2603:10b6:8:12::16) by
 MN6PR11MB8242.namprd11.prod.outlook.com (2603:10b6:208:474::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8251.14; Wed, 11 Dec
 2024 22:08:38 +0000
Received: from DM8PR11MB5751.namprd11.prod.outlook.com
 ([fe80::4046:430d:f16c:b842]) by DM8PR11MB5751.namprd11.prod.outlook.com
 ([fe80::4046:430d:f16c:b842%6]) with mapi id 15.20.8251.008; Wed, 11 Dec 2024
 22:08:38 +0000
From: "Teres Alexis, Alan Previn" <alan.previn.teres.alexis@intel.com>
To: "Dong, Zhanjun" <zhanjun.dong@intel.com>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>
CC: "kamil.konieczny@linux.intel.com" <kamil.konieczny@linux.intel.com>
Subject: Re: [PATCH v9] tests/intel/xe_exec_capture: Add xe_exec_capture test
Thread-Topic: [PATCH v9] tests/intel/xe_exec_capture: Add xe_exec_capture test
Thread-Index: AQHbSDJ/rULFXyfQPE6WCBrh40ledLLhog0A
Date: Wed, 11 Dec 2024 22:08:38 +0000
Message-ID: <c4b8b102d50c8cb81524c8d2b5335201c4bc4bb8.camel@intel.com>
References: <20241206225911.465603-1-zhanjun.dong@intel.com>
In-Reply-To: <20241206225911.465603-1-zhanjun.dong@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.44.4-0ubuntu2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR11MB5751:EE_|MN6PR11MB8242:EE_
x-ms-office365-filtering-correlation-id: 1b74e449-908b-4d18-ec95-08dd1a305d48
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?bU0rRVBvRHN3d3VQYVl4UkxDMlNOemtmNkdubXE3cVNQRXdMSVVkYUhYZmEy?=
 =?utf-8?B?UEk3SDdONjd2bVFJVWR2WGlLOVNwL2pDeHF0akZ6eitwY0tyUVgrMWdIWDlT?=
 =?utf-8?B?aEt2UVBmZmtMQ2Fta3lWK0NKY0xtUmcySHpEVnV0MG5hRkRsUVlCMU5mT1hu?=
 =?utf-8?B?all5Q1BNZm1VdW93RTVDQTFHanZBVkRFVTM1aWxiSlVmTG5BVCttNmNlaS93?=
 =?utf-8?B?eWxWTDF6WmswYVFoTFgyWHdpRFlyMHdmcEo3aWFnN21TcDVaUkdLWW41b2E4?=
 =?utf-8?B?eUt2SWlBaitEWFg1NGx2RHJYWGhYTEZZbWlkZGNyS0dObUp4REFOMXpYZk5S?=
 =?utf-8?B?UFZjbGZPTWY4MHdORXdHRWhSNUM0dVpuZHR3cFA5K3dKUnVwYXZHbGt6RWxz?=
 =?utf-8?B?cXFLazN0ZVBoMHRndWlvOWd3N2R2Szgrc09GenRYaUx5eGdEeWFzK1ltMjhL?=
 =?utf-8?B?R2o0YkJ3VFltV3RpWDl3SnpKWVpnSEJTS2IvdVFvaXBwK1Q3MjR3NTlreCs0?=
 =?utf-8?B?b1MvcWhlblZNTXBUQXFaVVNuUGdsVjU4MCt3cWNRRzltY1kzbVNNYXRQd0Vn?=
 =?utf-8?B?MGdRWWVVZ2QweXNQM0xIL3J2bnA3cDZOWWk4cnNRVWw2TXZrK0VrN1pMVkZU?=
 =?utf-8?B?Znp3Zy9kSXEyaWNJQ0FpTEIvdExoT01aZWpXY2JNdFQ0aTVnY0laemN1eVFX?=
 =?utf-8?B?NFczTTJ2WDRaQVRUSXZMNGhNRE8vbC9sN3hNSkJoTFJzTXV6R0NJaGo5STY5?=
 =?utf-8?B?enZGekpHY1dYVmNRYXNVN0VoaWt0RzVDSUxNd0dIUUFNQXpwajhBVlBiVDI1?=
 =?utf-8?B?cDRWWTRySmUwQjdOaXBIVnhUQVpSNTlHQmswOElyYkJjMXl6Zzk5ODdpRDVT?=
 =?utf-8?B?QzVHSC9HMWNwUkJMTmhhQmVxTmVlek5NQUZubGZYaDJUTG9QY1lNR0Vib1RD?=
 =?utf-8?B?TXEzZlU5c0hqZGM5TmVpa0p0ZDdhTmtZbEY5blc2Q1hVTzdrbHF1NEVETHlX?=
 =?utf-8?B?N1hnYW1STzJBTlV6RmhFY3czK1ZQTk4zaCtTcjB6ZGNrR2YzRTI2RnJFK3U0?=
 =?utf-8?B?WkFGeTYrVEU0ZWhzQlFSNjAxK1Bud1BGa3hjeGtqeG9FZlB2VmN2MkRHeWxT?=
 =?utf-8?B?cmZRUU9WcFhoazc1MVN6U3ZwUm9DWW85RExMU25UaXRvRm4yY3ZvcWx3UTV4?=
 =?utf-8?B?bDhqK3UrQ2xoQTVSR3JHc3FRQ3VmUENUUUt3YXo2TmdBUUtpQ0d3VzZuZHJC?=
 =?utf-8?B?cnltZ2RVbGh4TUFWVkNrQWRSa0d2SExISFExdllxRWcxTTM3ckRTcVpzRTd5?=
 =?utf-8?B?ZDcyTzdqay84aFhkdFU4bFJvRDMybXRoSEZBU05hM3dKR2VWS0MrWUJPdXk3?=
 =?utf-8?B?WHRVUXhmVG1SNGpQVElqaFJ2RFFFWmJ4eXNYVU1BcDNtR3lhZEJPSVdsL1hs?=
 =?utf-8?B?OG9jTWdzTmlmMVdtbng5b1FodTNVQXNYeW1sWUJVZS9laDJsTWN6YlRuRGtW?=
 =?utf-8?B?bVRxVW9vYjBiS1VnaWlGU2c5ZGsxcnVicUhvRUJYR0g5SUFDL09Rd1BsZ2NL?=
 =?utf-8?B?eHdESmJrVXAzcXNXaE1JZGxRWE1sMERiYVlNMjhqRlBia1dtY0R5ODUwMUtG?=
 =?utf-8?B?WFdPYW5MQmI3dDIwREEzSGZIS0dnNVBRdElLN0J3eU5TeFdoNnUwMUV0MW9s?=
 =?utf-8?B?VjBZdkg3SmpDbXVTTmthSWNjVDdkdTgxVGNBVDF6ZS85MW0xK1M4d2xnWnly?=
 =?utf-8?B?TmUvejFGRGRXN20vKzhlYVpqWjdUcE4vS0dFdUViNHdMMTRnZW0zTXBTWGdX?=
 =?utf-8?B?ZWp0T29ib3hHQmljcWxUcDZEa2VKT0N0clVkOGJOYXV1VlNYL2dicHBDclZJ?=
 =?utf-8?B?NkNvVTgzaU9Nd2xndGU2TG5CSU9vN00zZlMvUzFSOXEyVlE9PQ==?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5751.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?TnJHT2kyR2V1M1pxTmhvSTA0aFVPRmtITHIzNG9MR0NqS0VlVDg1Tk8vYktX?=
 =?utf-8?B?bGIwMWlJQlVUekQvYjJOaTUwNzB3cVVmSnpwa2VqeTI2Lzg1Q2w0WFk2cUlB?=
 =?utf-8?B?bFVhcGRGZEtPV1dVcnpDLzdzaDZJUUdXeHBKb1B6c3BFUDdKdUtyeWlWaFQz?=
 =?utf-8?B?eldDQUs2NE50QXA3WXBJUDUxTmo0aXNqSVhBVmw3dW9RdlRrN2JsT0x2QnpC?=
 =?utf-8?B?aitkeTY5OXJ5SGx1d1pjR2EvOEY3Uk9TUUlPcWNRREVDMmlXSEtKTTJBRkE5?=
 =?utf-8?B?SkJBRUNtR3RxeUV1Mmw4MFk5K2EzVHRYUHY0THhSOU83M240VUZNd29HbHVT?=
 =?utf-8?B?MG11Q2hIRis3UkRZYWhJc0g1Ry9DaTFOc3NwREZSVE02V3FVTzVVdlRXS0Ji?=
 =?utf-8?B?aVdJZ0drNGx2UlpZd29pNnFpOXE5RittMVdXSTN0SEs3cC92dEdRVmdWVmVZ?=
 =?utf-8?B?RW5UaVArY0N4SUo1KzFLMk1HTUZXcU51SUYwMmZjekI4SGRYcE1EM1Jicmkv?=
 =?utf-8?B?QWJaSkpBQzFJWWxwWWs0eXI1WkM4Zjc0OTZsUWhRbHFHTGlDM2NCNkFKTXVG?=
 =?utf-8?B?aEIwN0IzWFh6Rkd2d0ZBVnl1eFJJQ1pSaU01OTJyZXZ1aFdpd3dpM2xaMGUw?=
 =?utf-8?B?UjZCWlVkdjVpNkh2ZEVMUmxwOGZGaUtsQkdtQm5ubEh2amV3T2d6K09Vc3VT?=
 =?utf-8?B?SG4rc0YxWmNlYitGYVRaNnA1OFBtN0NTQnU4QXZsU29ERDVHK1R5WDlPMjlh?=
 =?utf-8?B?LzJaM3hFN0EvcVRDMWtjdEhxRFZoMVhuUDVudThLWE1TcW1wcTVKUldidUhm?=
 =?utf-8?B?MFNEajN3eTFkWGtDVEVrbXZadkk1ZGNlWm5nQVd0MU1iT0FVRHZSS3ZXbklw?=
 =?utf-8?B?RWtyTzVCZUJmSkwvTG5nTDR6cE0vMzFQNGlQN0oyNUhVbWdadGxDWnlydno4?=
 =?utf-8?B?SWo3bHFPbkxrbVA0N0tyUFZkN2t5cHoyN21IeWk2elViekQzL1llYTVTL3Jh?=
 =?utf-8?B?VkdwcGZlZFZqb0lFdVlNRWdtSFpVbXRERkp1VjVsa0dJbm5SSWZVdmE2bEZP?=
 =?utf-8?B?Ni9QRU5VVEFGeGdpSEl1RTU4OGtSU0R6Y204ZDQzSVliSzdmWU0rVFpMYlpO?=
 =?utf-8?B?dzJaMTJtYmlFTnlJd3NXQXdBZUhmbGpQN21WMUVXOFcxbkp1dFJaZFhBNk4x?=
 =?utf-8?B?dkk5NXV2WktzYStaZjBZOU9YbW1YMkFOVEgraFBoNTRVQUo3UnRVU2hCeFJh?=
 =?utf-8?B?YW5RZTRDSTROTSt3RENtZGNrQ0hYUGIrMGE2M1g2K2dmUHhMUnJCZ3JlMDFR?=
 =?utf-8?B?cXlCVVVRdGpWTjdpemsxU3dqdmc5dGtRN3ptbmVZUkVPb1NWeFN5bE9IaHRK?=
 =?utf-8?B?TWMvaFJpbmNUNXM0Qkh4T3VUSUZ0dllCb3ZURFQzMUhyWjVDYjd6Z1did3Vo?=
 =?utf-8?B?eEJwTDJpZzRKTDc4Y2dMTGdEWmVpUzhGazE3RzMvdzF6bGY0elIrWG8ydnQ5?=
 =?utf-8?B?L3NNNE12ckNIb2I5cFpnVzhxamw0VDdxNzlDd1doRjNwTG5zTlVPdVgxTFNU?=
 =?utf-8?B?QzNLZzRrU3k2cnVheDVtQkd1QkZHbFJ3WHA3ejVMVHpmNW0rS3doTmVENUVD?=
 =?utf-8?B?V0xGMjRUY21yWEdld3M1SndlbUFVZ09tMSt1clpQZVRLbGNPUzVwR2V0Z0ps?=
 =?utf-8?B?dCs2bGM5MXYzNUQ2QkxhcGE5d01pMWRwWUpXcDVDWEFBL204cFNjWnk3aC9a?=
 =?utf-8?B?aDY2K1RlNTd3Q1hITE9CVGRyWGJoUGt4Y1FudFRjMEpsNVZvMFRGNEREZWRp?=
 =?utf-8?B?eUVhbkJXam5vU0IwZ1ZBTHdTYnI0STllTExYeW1Qd2pzN09YL2lnVnRFOVN0?=
 =?utf-8?B?TmpqTFBQWXpMS2dZK2xwV3ppY3J0UXREY3hCbEpmYWdaM1dNVkp4TkF4S2U4?=
 =?utf-8?B?KysyWTVxd3VhdTVRMWJEREl1QVNURElBMnZhZkY5UkRRRkJwRXV1b0x2OU1Z?=
 =?utf-8?B?Z2FRalZYZ3BHQklEejB4L0R0elgwZGZZMzI5VDk4eE8zUVhTYkYvWS9aMUQ2?=
 =?utf-8?B?WUwvbGk1aERRZW5YcGE0VExtckJpWnh5S2RBa1R6UUJmZkxFM0t0SUFycXF2?=
 =?utf-8?B?cWZTalo3MlNzOXlmVVFKUXAvRzBMeUxrSEpaaWJTYnNwSHVoVVZBNS9XYnp2?=
 =?utf-8?Q?rnNfepobcmoNLCMi2wspQ0Q=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <5D60206909E70745B58E5767C78EEE47@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5751.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1b74e449-908b-4d18-ec95-08dd1a305d48
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Dec 2024 22:08:38.2033 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 4/5Uvfe5dJreI0C2SR8gpioXfEoe1S/UHfMDJTYlVwFv8GEv/YAgczLvGkeg0syTKVFCoTp9udLxZoB3FAamh9eGB7h+y/Rm2WLyfXp9oB4MtHFLxxW2EI0wcSrAqHOj
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN6PR11MB8242
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

SnVzdCByZS1SQi1pbmcgYWZ0ZXIgdGhlIHJlY2VudCBhZGRpdGlvbiBmb3IgdGhlIGNoYW5nZSB0
byBzZXQgZW5naW5lIGV4ZWN1dGlvbiB0aW1lIG1hbnVhbGx5IGJlZm9yZSBydW5uaW5nIHRoZSB0
ZXN0cw0Kb24gZWFjaCBlbmdpbmUgaW4gb3JkZXIgdG8gbGltaXQgdGhlIGV4ZWN1dGlvbiB0aW1l
IG9mIHRoaXMgdGVzdDoNCg0KUmV2aWV3ZWQtYnk6IEFsYW4gUHJldmluIDxhbGFuLnByZXZpbi50
ZXJlcy5hbGV4aXNAaW50ZWwuY29tPg0KDQoNCk9uIEZyaSwgMjAyNC0xMi0wNiBhdCAxNDo1OSAt
MDgwMCwgRG9uZywgWmhhbmp1biB3cm90ZToNCj4gU3VibWl0IGNtZHMgdG8gdGhlIEdQVSB0aGF0
IHJlc3VsdCBpbiBhIEd1QyBlbmdpbmUgcmVzZXQgYW5kIGNoZWNrIHRoYXQNCj4gZGV2Y29yZWR1
bXAgcmVnaXN0ZXIgZHVtcCBpcyBnZW5lcmF0ZWQsIGJ5IHRoZSBHdUMsIGFuZCBpbmNsdWRlcyB0
aGUNCj4gZnVsbCByZWdpc3RlciByYW5nZS4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6IFpoYW5qdW4g
RG9uZyA8emhhbmp1bi5kb25nQGludGVsLmNvbT4NCj4gQ2M6IEFsYW4gUHJldmluIDxhbGFuLnBy
ZXZpbi50ZXJlcy5hbGV4aXNAaW50ZWwuY29tPg0KPiBDYzogS2FtaWwgS29uaWVjem55IDxrYW1p
bC5rb25pZWN6bnlAbGludXguaW50ZWwuY29tPg0KPiAtLS0NCj4gQ2hhbmdlcyBmcm9tIHByaW9y
IHJldnM6DQo+IMKgdjk6LcKgIFJlZHVjZWQgam9iIHRpbWVvdXQgdG8gMiBzZWNvbmRzIHRvIHNw
ZWVkdXAgdGVzdA0KPiDCoMKgwqDCoMKgwqAgQWRkIGluZm8gcHJpbnQgdG8gc2hvdyB0ZXN0IGlz
IHJ1bm5pbmcgb24gc2luZ2xlL211bHRpcGxlIEdQVQ0KPiDCoHY4Oi3CoCBNb3ZlIGNoYW5nZSBs
aXN0IGJlbG93IC0tLQ0KDQoNCmFsYW46IEkganVzdCByZXZpZXdlZCB0aGUgZGlmZmVyZW5jZSBv
ZiB0aGUgbGFzdCB0d28gcmV2cyAoZGlmZiBvZiBkaWZmDQpmYXJ0aGVyIGJlbG93KToNCndpdGgg
dGhhdCBjaGFuZ2UsIHdlIGhvcGUgaXQgd2lsbCBhZGRyZXNzIEthbWlsJ3MgY29uY2VybiBieSBy
ZWR1Y2luZyB0aGUgZXhlY3V0aW9uDQp0aW1lIGRyYW1hdGljYWxseS4gSUlSQyBaaGFuanVuIGNv
dWxkbid0IGRlc2lnbmF0ZSBhbnkgc3VidGVzdCB0byBkZWNsYXJlIHBhc3MNCm9yIGZhaWwgd2l0
aG91dCBlbnN1cmluZyBtdWx0aXBsZSBlbmdpbmVzIGFyZSBleGVjdXRlZC1vbiBiYWNrIHRvIGJh
Y2sgc2luY2UgdGhlDQp0ZXN0IG5lZWRzIHRvIGVuc3VyZSB0aGF0IFhFLUtNRCBpcyBjYXRjaGlu
ZyB0aGUgY29ycmVjdCBndWMtZXJyb3ItZHVtcCBmb3IgdGhlDQpleGFjdCBiYXRjaCBvbiB0aGUg
ZXhhY3QgZW5naW5lIHdlIGV4cGVjdCBpdCB0byBjYXB0dXJlIGFtaWRzdCBtdWx0aXBsZSBiYWNr
IHRvIGJhY2sNCnJ1bnMgb2YgZGlmZmVyZW50LWJhdGNoZXMtc2FtZS1lbmdpbmUgdnMgZGlmZmVy
ZW50LWVuZ2luZXMuICh0aGUgdGVzdCB1c2VzIHRoZSByaW5nDQpidWZmZXIgYmF0Y2ggYnVmZmVy
IGFkZHJlc3MgYXMgYSB3YXkgdG8gZGlmZmVyZW50aWF0ZSBhbmQgZGV0ZXJtaW5lIHByZWNpc2Vs
eSkuDQoNCg0KMjhhMjkNCj4gKyNpbmNsdWRlICJpZ3Rfc3lzZnMuaCINCjM3YTM5LDQwDQo+ICsj
ZGVmaW5lIENBUFRVUkVfSk9CX1RJTUVPVVQJCTIwMDANCj4gKyNkZWZpbmUgSk9CX1RJTU9VVF9F
TlRSWQkJImpvYl90aW1lb3V0X21zIg0KODNhODcsMTA5DQo+ICtzdGF0aWMgdTY0DQo+ICt4ZV9z
eXNmc19nZXRfam9iX3RpbWVvdXRfbXMoaW50IGZkLCBzdHJ1Y3QgZHJtX3hlX2VuZ2luZV9jbGFz
c19pbnN0YW5jZSAqZWNpKQ0KPiArew0KPiArCWludCBlbmdpbmVfZmQgPSAtMTsNCj4gKwl1NjQg
cmV0Ow0KPiArDQo+ICsJZW5naW5lX2ZkID0geGVfc3lzZnNfZW5naW5lX29wZW4oZmQsIGVjaS0+
Z3RfaWQsIGVjaS0+ZW5naW5lX2NsYXNzKTsNCj4gKwlyZXQgPSBpZ3Rfc3lzZnNfZ2V0X3U2NChl
bmdpbmVfZmQsIEpPQl9USU1PVVRfRU5UUlkpOw0KPiArCWNsb3NlKGVuZ2luZV9mZCk7DQo+ICsN
Cj4gKwlyZXR1cm4gcmV0Ow0KPiArfQ0KPiArDQo+ICtzdGF0aWMgdm9pZCB4ZV9zeXNmc19zZXRf
am9iX3RpbWVvdXRfbXMoaW50IGZkLCBzdHJ1Y3QgZHJtX3hlX2VuZ2luZV9jbGFzc19pbnN0YW5j
ZSAqZWNpLA0KPiArCQkJCQl1NjQgdGltZW91dCkNCj4gK3sNCj4gKwlpbnQgZW5naW5lX2ZkID0g
LTE7DQo+ICsNCj4gKwllbmdpbmVfZmQgPSB4ZV9zeXNmc19lbmdpbmVfb3BlbihmZCwgZWNpLT5n
dF9pZCwgZWNpLT5lbmdpbmVfY2xhc3MpOw0KPiArCWlndF9zeXNmc19zZXRfdTY0KGVuZ2luZV9m
ZCwgSk9CX1RJTU9VVF9FTlRSWSwgQ0FQVFVSRV9KT0JfVElNRU9VVCk7DQo+ICsJY2xvc2UoZW5n
aW5lX2ZkKTsNCj4gK30NCj4gKw0KDQouLi4NCg0KPiAJeGVfZm9yX2VhY2hfZW5naW5lKGZkLCBo
d2UpIHsNCj4gCQkvKg0KPiAJCSAqIFRvIHRlc3QgZGV2Y29yZWR1bXAgcmVnaXN0ZXIgZGF0YSwg
dGhlIHRlc3QgYmF0Y2ggYWRkcmVzcyBpcw0KPiAJCSAqIHVzZWQgdG8gY29tcGFyZSB3aXRoIHRo
ZSBkdW1wLCBhZGRyZXNzIGJpdCA0MCB0byA0NiBhY3QgYXMNCj4gCQkgKiBjb250ZXh0IGlkLCB3
aGljaCBzdGFydCB3aXRoIGFuIHJhbmRvbSBudW1iZXIsIGluY3JlYXNlZCAxDQo+IAkJICogcGVy
IGVuZ2luZS4gQnkgdGhpcyB3YXksIHRoZSBhZGRyZXNzIGlzIHVuaXF1ZSBmb3IgZWFjaA0KPiAJ
CSAqIGVuZ2luZSwgYW5kIHN0YXJ0IHdpdGggYW4gcmFuZG9tIG51bWJlciBvbiBlYWNoIHJ1bi4N
Cj4gCQkgKi8NCj4gCQljb25zdCB1NjQgYWRkciA9IEJBU0VfQUREUkVTUyB8ICgodTY0KShlbmdp
bmVfY2lkKysgJSBDSURfQUREUkVTU19NQVNLKSA8PA0KPiAJCQkJCQkgQUREUkVTU19TSElGVCk7
DQo0MTNhNDQwDQo+ICsJCXU2NCBqb2JfdGltZW91dCA9IHhlX3N5c2ZzX2dldF9qb2JfdGltZW91
dF9tcyhmZCwgaHdlKTsNCjQxN2E0NDUsNDQ3DQo+ICsJCS8qIFJlZHVjZSB0aW1lb3V0IHZhbHVl
IHRvIHNwZWVkdXAgdGVzdCAqLw0KPiArCQl4ZV9zeXNmc19zZXRfam9iX3RpbWVvdXRfbXMoZmQs
IGh3ZSwgQ0FQVFVSRV9KT0JfVElNRU9VVCk7DQo+ICsNCjQxOWE0NTAsNDUyDQo+ICsJCS8qIFJl
c3RvcmUgdGltZW91dCB2YWx1ZSAqLw0KPiArCQl4ZV9zeXNmc19zZXRfam9iX3RpbWVvdXRfbXMo
ZmQsIGh3ZSwgam9iX3RpbWVvdXQpOw0KPiArDQo0NjBhNDk0LDQ5NQ0KPiArCQkJaWd0X2luZm8o
IlJ1bm5pbmcgdGVzdCBvbiBtdWx0aXBsZSBHUFVcbiIpOw0KPiArDQo0NzNhNTA5DQo+ICsJCQlp
Z3RfaW5mbygiUnVubmluZyB0ZXN0IG9uIHNpbmdsZSBHUFVcbiIpOw0KDQo=
