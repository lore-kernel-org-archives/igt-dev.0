Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 761BFCAC592
	for <igt-dev@archiver.kernel.org>; Fri, 19 Sep 2025 07:19:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B44110E227;
	Fri, 19 Sep 2025 07:19:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ROEf3cSv";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 276A310E227
 for <igt-dev@lists.freedesktop.org>; Fri, 19 Sep 2025 07:19:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758266390; x=1789802390;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=lbl2k5Ynx+TmU0qqWypCTiUrWakqCjAueJO9icsPBjo=;
 b=ROEf3cSv8lc+NwtM0gsB+NheiAlcnt9vxIcP4H2gWUMrkIDp8uube4s8
 To0plkxhlbuFxO2Qf7rMN0sn5fKkNX/whRnQXJ/YwS9U0LAhD6GLu0+Rq
 bIVU8clMtRCGpYJ0aqnP478a+6cVPcBG8PIv1HDTWNZt6zk9SExuXE0LK
 yJfy8VjFMwBQKRE/SyLgdJ2Zj/QqGwLfwtWZZasXFC1B8RE4dNBe8kHao
 h/IM4zLRBiFd4x7f7mwMOKvqLQEEvXPBmcMfR/8dw6DkkkaNrWrg+CL07
 xew5vnC+hgFDP/oierU4ZE12Qv3oiXH7CZmKX4WmEly50bLxoqb0tTWoC w==;
X-CSE-ConnectionGUID: uVVDmcRzR4qyBUJcdiRdpA==
X-CSE-MsgGUID: vPPh4Em5SgOWYGgBGJ69/w==
X-IronPort-AV: E=McAfee;i="6800,10657,11557"; a="83209273"
X-IronPort-AV: E=Sophos;i="6.18,277,1751266800"; d="scan'208";a="83209273"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Sep 2025 00:19:50 -0700
X-CSE-ConnectionGUID: UoDZC6qbSmaM99XIsJk7rQ==
X-CSE-MsgGUID: QySRxevrSwCm19JoiFHa5w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,277,1751266800"; d="scan'208";a="206711703"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Sep 2025 00:19:49 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Fri, 19 Sep 2025 00:19:48 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Fri, 19 Sep 2025 00:19:48 -0700
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.68)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Fri, 19 Sep 2025 00:19:47 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JxMNeJd+hfPLQh4Zzd45UKGpGqvuUOWkGpZpnypTM8hENNmFA3BkeDfPx75+VbvzInsD7Dt5Uoo/3n7hFNE0KuKSgSRTBmstmHCmta+T4UB9NETYE2Y49g5+7k8hs7Tmtk3Uh1Ak8H9BcHJ/pPBvqVS70q/ifhQBkbxmfyOYoRdYtGWQYFqVO7HQRqvPPoVghmcpk4udGmP1/0Q++h8uyqAWKzNs+SBjSQLV/qxXbbKdH4aXRkL4DLgobRpFzr8Zoh/uWeMIQ7JynjYpM4Nezq6T0K8+OVeLmdHr5YAuHD64pEYvAnAVJte967W+EuEiZXHuYOGhBDY92W3ii+2Miw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mN+UcM032f5QE73fRep58lUJQGSjPoA/U4PlIUhU5lI=;
 b=iCxMU0NNVBpg4H7jBICt3TYVKwe9i0e2nYw0zH2VuGm72MQdDVWFzLRQBBQ8UoPn4UewC1rUP8ykVSzBR1LYy/YaUHfuaJStrKojyY/wIxOQ+z+uRarLUwJLQT8j1637AYN804rkHLu0GcFtnEvg3hTFlME2/9SmfK7PrAGNxDGQZh8BeHbz7vfdtLEny6ktqL3PfJRXrVoINptb+4+YYAqxdLHkr+AxA8GbpiJRcRwvLpnb6VI2VieIPXfwA8BeICN7o/U38cCn7FT3Te9HQz7Tk1aQN/JM6lPeZE6gzSNTBLyXXlTzUnpoTbHOS+18bIYHc3RrCRUvPAdl0oHXwA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL1PR11MB5979.namprd11.prod.outlook.com (2603:10b6:208:386::9)
 by SJ0PR11MB5920.namprd11.prod.outlook.com (2603:10b6:a03:42e::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.13; Fri, 19 Sep
 2025 07:19:45 +0000
Received: from BL1PR11MB5979.namprd11.prod.outlook.com
 ([fe80::246b:dc12:ea88:b19c]) by BL1PR11MB5979.namprd11.prod.outlook.com
 ([fe80::246b:dc12:ea88:b19c%5]) with mapi id 15.20.9137.012; Fri, 19 Sep 2025
 07:19:45 +0000
Message-ID: <5b909804-494f-4ffa-909d-25cbd38ea17c@intel.com>
Date: Fri, 19 Sep 2025 12:49:36 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V10 09/30] tests/kms_colorop: Add kms_colorop tests
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>, Alex Hung
 <alex.hung@amd.com>, <igt-dev@lists.freedesktop.org>,
 <harry.wentland@amd.com>, <leo.liu@amd.com>
References: <20250815040659.3321102-1-alex.hung@amd.com>
 <20250815040659.3321102-10-alex.hung@amd.com>
 <20250827105359.kg2x5jmo2w25iqxa@kamilkon-DESK.igk.intel.com>
Content-Language: en-US
From: "Sharma, Swati2" <swati2.sharma@intel.com>
In-Reply-To: <20250827105359.kg2x5jmo2w25iqxa@kamilkon-DESK.igk.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0079.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:ae::7) To BL1PR11MB5979.namprd11.prod.outlook.com
 (2603:10b6:208:386::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR11MB5979:EE_|SJ0PR11MB5920:EE_
X-MS-Office365-Filtering-Correlation-Id: a8df788a-4ff0-4399-458a-08ddf74ce8c5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?WGRaU1doQjlMV2hpNjA1cTNNODRaenZMOVdwQ2ExYXZzeU02L2o4Yjd2SnBV?=
 =?utf-8?B?ZnJZRUJLbWtodjRPcUd5em1lQWhpeHljLzRiOXBlT2ZDY2FQZk5pa04wVWh3?=
 =?utf-8?B?cWY1SmlFZmlleU5QU09oUDRxQXNOaDNUcEUxbVFnTmNjMEtFaXg1eStuLy9G?=
 =?utf-8?B?YVJnZTBBNXJxNmZHWUhBYTdDZWNTVFBhQ09mU3VMVkdwVksvMktid0xtK3FH?=
 =?utf-8?B?RmNZZmV3Qm1ZaDZKRmV4WnlxQVBDbjlxdkplSTA4di9YaE9CdDhnd3VUd2g4?=
 =?utf-8?B?RUNHOWU5SExoelp1aUtHVmUwSE5ldUdsMHhkMVRKbjZPMldyTjBJc21hbG9z?=
 =?utf-8?B?dWdZTTVlcFdZakVCdkV6NnI5bGtUMkxOaDRDMUFpRGF4bmJRcFMvc0VCZVZx?=
 =?utf-8?B?SlBENzZTcWdIRmhPQ2U1Z3F1T1pWM3lTMklpVHRwd2tEeW83eURWMHdISkZ3?=
 =?utf-8?B?bVNZclI5cHV5dzBjZithelhydTEyanpyRmhtZXJMOFVSOWNTRnhobzUzZWla?=
 =?utf-8?B?MWtuWnZEdXZySUxtRW5NVVFSR1hjcjlBNlRjVWFLSzNoMHc4Wkk0TlZCWDNn?=
 =?utf-8?B?WFFrMEVsSGVpZERrWWJCVUtpOG92WXdpaDVyejVXamRmTnQ2YWNTS3RIZEtu?=
 =?utf-8?B?elUwU3VOcTZpVktOMnJneXcrRHFCWGVWV3QyV3pPVGs3NnFGTWhXMXNKbml1?=
 =?utf-8?B?cHhOenkvOXRYQjczVnZxcmVUMjk0aUFqU2w2R3RzMnJHTW4vVGZURStmbm9T?=
 =?utf-8?B?c1FHQ2xJdlYySk9RUzJMTWtURG1XTDVQanA4SnFHRWVhRFU5WitBeVVJSDFk?=
 =?utf-8?B?UFJjQUVVQUpMOE4vWGlUei9ycVhKQnVRQml0Vk02azl2cU9IdlFmZ3VpRTAy?=
 =?utf-8?B?UHBNbDg2SHBEK1pob045a1BETUhjamVCZ3pNSHkxeUZ0eUtYeWVtQjh3WTM5?=
 =?utf-8?B?dGZvY2QzQTM4R2xoVnhoeG9RcTNxd1o0QkdCSzRkck4wZVRLODZOaXh6Rks2?=
 =?utf-8?B?cXRYR3lyblVvK2xOcllnamc3dGUzMElWVEFjY2l2WTRLS1ZyTGRkWTBLVjNq?=
 =?utf-8?B?SFM4dkVOdnhHNDdEQUMvbnh5RVhFWk9LdHpNZUlTckZkZk9tUUtqNlZVSmNN?=
 =?utf-8?B?L0xPdWRBVHJaL3RxUVp4NDMybGdjK1d2UDVKQzdlSEJRblBXc2RVeFBlTG8w?=
 =?utf-8?B?c2pPVEd0ZUpNUUtYVjVPallrTHJOSmgyeVdaeGFjcEVOWEZXejhzYk9hQmYx?=
 =?utf-8?B?MHRXUDNDY05kck1RQjBZdTNlRnE1NGdCQnNsQ3hwcTdxMEpLTEFRL052U1BM?=
 =?utf-8?B?UFBNRkZaK293UEJ1Wkg1b0xyTTB5NkNvcFlNWnBHVjFhbUNoMDRtQ1ZiYWJB?=
 =?utf-8?B?UWZTa1lIelBOcWd0RlRqQWZvcXlqZE5xaloxdzdyN25XV2Q2dHNJMlJuNVBG?=
 =?utf-8?B?Z3dSSms2SDV6OTlodlBQMWQ0Rks1Tm1pRjdvVXkyTlVvcHBCMm40RlJvVzNx?=
 =?utf-8?B?WitUN2k3eFE2Unl0SnIzanFHQng4WlJJTlNENzlmWldWaFZKU2RvMllxdmwx?=
 =?utf-8?B?bEZlNFJaQ05pbno3TFlYNndmVGRMWFgxRDhDai9idUl4dHJzeHlWQUhsZk9N?=
 =?utf-8?B?ZmlLS21lSXpZWGpuUnhyc0xmMTVjSlk3MFg1OEkvOEp4blNIalY2a0ZtV2Yw?=
 =?utf-8?B?SmNyYVp1bG8wc3pJa3lkR2JQd2FjaC84Snh3a20xVnVLcDRwL0ovRFdtaU0v?=
 =?utf-8?B?WFZ3eWRuSE03bTRUN1AwMDl1L0JEN0F1Mi9ZWEtIdThiUFh2U0Z4MXJ4eWl6?=
 =?utf-8?B?SHI1dFlnV3FuTWVCaTNIUTVVRUtUZUxLdlhwSlIyWUlzQTl6cFJJWm12VUJ3?=
 =?utf-8?B?WWFCbUVUV2ZNbFlSU0c5cGJ0Q2VHa3dtRVdjWklKQk1xMVNhei84ZFVzUWtp?=
 =?utf-8?Q?TGPom0l66eQ=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR11MB5979.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZG5SaFhpYzRaT0tzQ3VjSzA0QitzTnNmMVhwdVNEWU9MNTFibjl1Y2RQQWRu?=
 =?utf-8?B?eTVIVXhCRm5xSDRnSVF3MnJhV05XcW9JSkV1Sy9RekxrVGdWR0F4SkVEMG5R?=
 =?utf-8?B?V1ZRVm1VamhaM3JqVFFvYU9rdytyMnRLSVBpMHFZYW5lMGhQMlY3bXREVmk1?=
 =?utf-8?B?OW02OFVzUFlQR1poUFNFa05xWUp4Y3lZMUt4cFM0YXMreDBSWmhiVHdRQmMx?=
 =?utf-8?B?Ukc2WDQrdzFjOTUwMEhDNFNLei9GaE9MM3JyOEp1TitkMXVhdWJMWkNsVi9C?=
 =?utf-8?B?N3NUVGMySzdSaG84R0dMNUFlcHB6ZEtCM3hoYWZpSkx0VmY0QmhueklEWmhp?=
 =?utf-8?B?ZVRYL3U5dG1EeDMvUWxWT2ptMjVKRjJCMHpvcU9hUzl5T2JST3Y4c3RET0Zu?=
 =?utf-8?B?d2l6Q0M2c0NoOUpVWVJGUXU4UkVCa0tlMTd5cGprZjV5dWpZOEdxTjJUT0pr?=
 =?utf-8?B?WE93TG96VlkzNkRjejFIU3phd1Zkd0hnZW5LRFhpS2JlSVNZMWo0SElVdUFH?=
 =?utf-8?B?c0NiQmRVSEM1a0pXVlBGbTZQTi9aSGJZeVlJR0dxc2xlbzdURmtMTlRuekMw?=
 =?utf-8?B?QTlKTHF1RWwybUp3U1lFazZ6SC9QSmxna3ZCOXB0WXV0Qmc3elNyaGpDelU3?=
 =?utf-8?B?SXFtaEY4K3J5Y2wvUFZKQ1RKTXJwb0dDdFNueVVwSHZDeHVuQ3FmdnQwM0hT?=
 =?utf-8?B?Ym04bVI5Vml6U3UwZFRwSEcwNDRNa3VjNWJhZEZ5SWV4d0ExeW5pRWNLd0NG?=
 =?utf-8?B?aDFZaWFib09HeEhFalRBV0p4dEVlM0NoM0VaMVhFb3htWDUyRGVid2RVVkF0?=
 =?utf-8?B?cEloK3hoK2ROblp5NVdzNno0d3pCR21qMGxoT2V1NlpraGxwVjJNT3FZVmdJ?=
 =?utf-8?B?cS9EaTNqaFJrQzJHbUxTWGhvNElBRm1UMWVmcVdoWStNT01YdzZ6blp4cERP?=
 =?utf-8?B?MTZHcVpweWlsaGZNS0VTR1pPa0VhQk9jcWx3dWZ1N3hqQnpNZTIrdDR4VmlL?=
 =?utf-8?B?cTNmanJyR3lQbWF1RURSeTFxYXloeExXQ24vcTkyVTUxUFRNRkRySkZDdGMr?=
 =?utf-8?B?Ni93Y2x3T2ZOUHB3d016MTdBc2dQc0ozUkhtT0dwajhHSzJ4Zm41dVRKaFRQ?=
 =?utf-8?B?WlI4b1dHRi9xaURabURLRHZqRUp5WnFPN2xGaWNZRmlmVGlEeDU5ck5mMGMv?=
 =?utf-8?B?TkhyYnROSWxhVVZaL01HT2txa3ZvSkoyRm9SSkl6Ky9nSTBxc0NUa2lmS2F4?=
 =?utf-8?B?V0ZSU3ZxVmVaZ0ZmdXozRUlBbVR1cG1OczNMMFZJbXJSUlluQ245U25NSXd6?=
 =?utf-8?B?TjRmMVFqZXAwbEUrb0Z2dDR6OVp6NXl6Q0VTaFpodHRSQmtFRVdtQjhWTEp4?=
 =?utf-8?B?cjNwUEpiODJhVVRVNmtEZ0xPc2lqeXR1NUZmQUx4MUg1THRIcms1MDlXWTRZ?=
 =?utf-8?B?VHZuZE0vNmtSTGFtZSsrR1lJb3I3MEZBTVFCK2I5aU5xUmZtRWlWVzh2R2tz?=
 =?utf-8?B?ZVMrMGxsNnRBM3BCSnNkVTk1bnJCT0dBcXQvM0ZQNm0yd3JqbnZsaG4wV3N3?=
 =?utf-8?B?NCsrSzZPY2RTS0hWRUNtU2VNRW50NG9BelBZMlUyVVNWNk1GczlYci9KMm5r?=
 =?utf-8?B?SnhDejdLSWxlZTBNR2VsSERlKytucVBQWGFsdTFscVFJcDBoc3gyOHd1SGhl?=
 =?utf-8?B?bjVqMUNmVmdyelpLYkd0ZlRqd20vVWRFUWd2eFEwdUsrTjhPWTNUdVdrUlhS?=
 =?utf-8?B?THpXb3FDWE5JaWhMZEtxaVVBVDF5RUd2bmNMNXFRZHYwRCtJYy8wdXJBUFRr?=
 =?utf-8?B?Yk5KYzFacEp1Tjh1ZVpNTWRqbzdWL3dMaHJhYlU1ZTZxaWhrbGI1My9GTjJj?=
 =?utf-8?B?YzFZeEdjcDFVcndwTVZSR1BRdGFyUEJrWnd2MXNTYUJ2OTBQY3VtWG91SUIy?=
 =?utf-8?B?NmkvcFc0bThJZGlKcmdSNnhIUGE5UW96VzZmbkIxem8wSTNyYlZsSjJ0S2ho?=
 =?utf-8?B?YmxIYi9BZ2QrMU5LZmFkSVpIUVZiK3hubnYrOGo5WTg2d0trd1ZuNFZLWkFs?=
 =?utf-8?B?OE5SdHZJYTJIWHhvN3VFbm9kdStncFkyQ3dYNzY2M3lXYmp6TlJ3TzFhNkdB?=
 =?utf-8?B?aTJOSVY5ZHV3cFZ3cWRlZU5oWnRnUVBUa2VBMjNrd2ZKNmpaREZ0K3dNRHRB?=
 =?utf-8?B?b1E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a8df788a-4ff0-4399-458a-08ddf74ce8c5
X-MS-Exchange-CrossTenant-AuthSource: BL1PR11MB5979.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Sep 2025 07:19:45.5518 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KUP+Qf00cGRkHg5zUdA+avm/Oz2+426mAGUTMGpqilPigeMoOfsIMg3uhB+VBsUSEbzHsLk/DR3OjJiet3a6WQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5920
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

Hi Alex,

Is it possible to move colorop basic func() like
can_use_colorop(), map_to_pipline(), etc. to lib?

On 27-08-2025 04:23 pm, Kamil Konieczny wrote:
> Hi Alex,
> On 2025-08-14 at 22:06:38 -0600, Alex Hung wrote:
>> From: Harry Wentland <harry.wentland@amd.com>
>>
>> This tests the color pipeline API, exposed via the
>> COLOR PIPELINE plane property and drm_colorop objects.
>>
>> We introduce tests for:
>>   - sRGB EOTF
>>   - sRGB Inverse EOTF
>>   - sRGB EOTF + sRGB Inverse EOTF
>>
>> The last one is the holy grail of LUT testing. It tests that
>> after applying an EOTF, followed by its inverse EOTF we arrive
>> back at the original value. We can use this to test for
>> precision loss in the pipeline.
>>
>> All tests are tested via writeback. All transforms are done in
>> SW (in floating point) and at the end the SW transformed buffer
>> is compared with the KMS writeback output buffer. The two should
>> match within a bracket of acceptable deviations. Since these
>> deviations might look different for different KMS drivers we'll
>> do this check on a driver-specific basis.
>>
>> Signed-off-by: Alex Hung <alex.hung@amd.com>
>> Signed-off-by: Harry Wentland <harry.wentland@amd.com>
>> ---
>>   tests/kms_colorop.c | 508 ++++++++++++++++++++++++++++++++++++++++++++
>>   tests/kms_colorop.h |  88 ++++++++
>>   tests/meson.build   |   1 +
>>   3 files changed, 597 insertions(+)
>>   create mode 100644 tests/kms_colorop.c
>>   create mode 100644 tests/kms_colorop.h
>>
>> diff --git a/tests/kms_colorop.c b/tests/kms_colorop.c
>> new file mode 100644
>> index 000000000..e247477ec
>> --- /dev/null
>> +++ b/tests/kms_colorop.c
>> @@ -0,0 +1,508 @@
>> +// SPDX-License-Identifier: MIT
>> +/*
>> + * Copyright 2023 Advanced Micro Devices, Inc.
>> + *
>> + * Permission is hereby granted, free of charge, to any person obtaining a
> Please remove this text as it is replaced by SPDX above.
>
>> + * copy of this software and associated documentation files (the "Software"),
>> + * to deal in the Software without restriction, including without limitation
>> + * the rights to use, copy, modify, merge, publish, distribute, sublicense,
>> + * and/or sell copies of the Software, and to permit persons to whom the
>> + * Software is furnished to do so, subject to the following conditions:
>> + *
>> + * The above copyright notice and this permission notice shall be included in
>> + * all copies or substantial portions of the Software.
>> + *
>> + * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
>> + * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
>> + * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
>> + * THE COPYRIGHT HOLDER(S) OR AUTHOR(S) BE LIABLE FOR ANY CLAIM, DAMAGES OR
>> + * OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
>> + * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
>> + * OTHER DEALINGS IN THE SOFTWARE.
>> + */
>> +
>> +#include "igt.h"
>> +#include "igt_color.h"
>> +#include "sw_sync.h"
>> +#include "kms_colorop.h"
>> +
>> +/**
>> + * TEST: kms colorop
>> + * Category: Display
>> + * Description: Test to validate the retrieving and setting of DRM colorops
>> + *
>> + * SUBTEST: plane-%s
>> + * Description: Tests DRM colorop properties on a plane
>> + * Driver requirement: amdgpu
>> + * Functionality: kms_core
>> + * Mega feature: General Display Features
>> + * Test category: functionality test
>> + *
>> + * arg[1]:
>> + *
>> + * @srgb_eotf:                   sRGB EOTF
>> + * @srgb_inv_eotf:               sRGB Inverse EOTF
>> + * @srgb_eotf-srgb_inv_eotf:     sRGB EOTF -> sRGB Inverse EOTF
>> + *
>> + */
>> +
>> +/* TODO move to lib for kms_writeback and kms_colorop (and other future) use */
>> +static bool check_writeback_config(igt_display_t *display, igt_output_t *output,
>> +				    drmModeModeInfo override_mode)
>> +{
>> +	igt_fb_t input_fb, output_fb;
>> +	igt_plane_t *plane;
>> +	uint32_t writeback_format = DRM_FORMAT_XRGB8888;
>> +	uint64_t modifier = DRM_FORMAT_MOD_LINEAR;
>> +	int width, height, ret;
>> +
>> +	igt_output_override_mode(output, &override_mode);
>> +
>> +	width = override_mode.hdisplay;
>> +	height = override_mode.vdisplay;
>> +
>> +	ret = igt_create_fb(display->drm_fd, width, height,
>> +			    DRM_FORMAT_XRGB8888, modifier, &input_fb);
>> +	igt_assert(ret >= 0);
>> +
>> +	ret = igt_create_fb(display->drm_fd, width, height,
>> +			    writeback_format, modifier, &output_fb);
>> +	igt_assert(ret >= 0);
>> +
>> +	plane = igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
>> +	igt_plane_set_fb(plane, &input_fb);
>> +	igt_output_set_writeback_fb(output, &output_fb);
>> +
>> +	ret = igt_display_try_commit_atomic(display, DRM_MODE_ATOMIC_TEST_ONLY |
>> +					    DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);
>> +	igt_plane_set_fb(plane, NULL);
>> +	igt_remove_fb(display->drm_fd, &input_fb);
>> +	igt_remove_fb(display->drm_fd, &output_fb);
>> +
>> +	return !ret;
>> +}
>> +
>> +/* TODO move to lib for kms_writeback and kms_colorop (and other future) use */
>> +typedef struct {
>> +	bool builtin_mode;
>> +	bool custom_mode;
>> +	bool list_modes;
>> +	bool dump_check;
>> +	int mode_index;
>> +	drmModeModeInfo user_mode;
>> +} data_t;
>> +
>> +static data_t data;
>> +
>> +/* TODO move to lib for kms_writeback and kms_colorop (and other future) use */
>> +static igt_output_t *kms_writeback_get_output(igt_display_t *display)
>> +{
>> +	int i;
>> +	enum pipe pipe;
>> +
>> +	drmModeModeInfo override_mode = {
>> +		.clock = 25175,
>> +		.hdisplay = 640,
>> +		.hsync_start = 656,
>> +		.hsync_end = 752,
>> +		.htotal = 800,
>> +		.hskew = 0,
>> +		.vdisplay = 480,
>> +		.vsync_start = 490,
>> +		.vsync_end = 492,
>> +		.vtotal = 525,
>> +		.vscan = 0,
>> +		.vrefresh = 60,
>> +		.flags = DRM_MODE_FLAG_NHSYNC | DRM_MODE_FLAG_NVSYNC,
>> +		.name = {"640x480-60"},
>> +	};
>> +
>> +	for (i = 0; i < display->n_outputs; i++) {
>> +		igt_output_t *output = &display->outputs[i];
>> +
>> +		if (output->config.connector->connector_type != DRM_MODE_CONNECTOR_WRITEBACK)
>> +			continue;
>> +
>> +		for_each_pipe(display, pipe) {
>> +			igt_output_set_pipe(output, pipe);
>> +
>> +			if (data.custom_mode)
>> +				override_mode = data.user_mode;
>> +			if (data.builtin_mode)
>> +				override_mode = output->config.connector->modes[data.mode_index];
>> +
>> +			if (check_writeback_config(display, output, override_mode)) {
>> +				igt_debug("Using connector %u:%s on pipe %d\n",
>> +					  output->config.connector->connector_id,
>> +					  output->name, pipe);
>> +				return output;
>> +			}
>> +		}
>> +
>> +		igt_debug("We found %u:%s, but this test will not be able to use it.\n",
>> +			  output->config.connector->connector_id, output->name);
>> +
>> +		/* Restore any connectors we don't use, so we don't trip on them later */
>> +		kmstest_force_connector(display->drm_fd, output->config.connector, FORCE_CONNECTOR_UNSPECIFIED);
>> +	}
>> +
>> +	return NULL;
>> +}
>> +
>> +/* TODO move to lib for kms_writeback and kms_colorop (and other future) use */
>> +static uint64_t get_writeback_fb_id(igt_output_t *output)
>> +{
>> +	return igt_output_get_prop(output, IGT_CONNECTOR_WRITEBACK_FB_ID);
>> +}
>> +
>> +/* TODO move to lib for kms_writeback and kms_colorop (and other future) use */
>> +static void detach_crtc(igt_display_t *display, igt_output_t *output)
>> +{
>> +	if (get_writeback_fb_id(output) == 0)
>> +		return;
>> +
>> +	igt_output_set_pipe(output, PIPE_NONE);
>> +	igt_display_commit2(display, COMMIT_ATOMIC);
>> +}
>> +
>> +static void get_and_wait_out_fence(igt_output_t *output)
>> +{
>> +	int ret;
>> +
>> +	igt_assert(output->writeback_out_fence_fd >= 0);
>> +
>> +	ret = sync_fence_wait(output->writeback_out_fence_fd, 1000);
>> +	igt_assert_f(ret == 0, "sync_fence_wait failed: %s\n", strerror(-ret));
>> +	close(output->writeback_out_fence_fd);
>> +	output->writeback_out_fence_fd = -1;
>> +}
>> +
>> +static bool can_use_colorop(igt_display_t *display, igt_colorop_t *colorop, kms_colorop_t *desired)
>> +{
>> +	switch (desired->type) {
>> +	case KMS_COLOROP_ENUMERATED_LUT1D:
>> +		if (igt_colorop_get_prop(display, colorop, IGT_COLOROP_TYPE) == DRM_COLOROP_1D_CURVE)
>> +			return true;
>> +	case KMS_COLOROP_CUSTOM_LUT1D:
>> +	case KMS_COLOROP_CTM:
>> +	case KMS_COLOROP_LUT3D:
>> +	default:
>> +		return false;
>> +	}
>> +}
>> +
>> +/**
>> + * Iterate color pipeline that begins with colorop and try to map
>> + * colorops[] to it.
>> + */
>> +static bool map_to_pipeline(igt_display_t *display,
>> +			    igt_colorop_t *colorop,
>> +			    kms_colorop_t *colorops[])
>> +{
>> +	igt_colorop_t *next = colorop;
>> +	kms_colorop_t *current_op;
>> +	int i = 0;
>> +	int prop_val = 0;
>> +
>> +	current_op = colorops[i++];
>> +	igt_require(current_op);
>> +
>> +	while (next) {
>> +		if (can_use_colorop(display, next, current_op)) {
>> +			current_op->colorop = next;
>> +			current_op = colorops[i++];
>> +			if (!current_op)
>> +				break;
>> +		}
>> +		prop_val = igt_colorop_get_prop(display, next,
>> +						IGT_COLOROP_NEXT);
>> +		next = igt_find_colorop(display, prop_val);
>> +	}
>> +
>> +	if (current_op) {
>> +		/* we failed to map the pipeline */
>> +
>> +		/* clean up colorops[i].colorop mappings */
>> +		for (i = 0, current_op = colorops[0]; current_op; current_op = colorops[i++])
>> +			current_op->colorop = NULL;
>> +
>> +		return false;
>> +	}
>> +
>> +	return true;
>> +}
>> +
>> +static igt_colorop_t *get_color_pipeline(igt_display_t *display,
>> +					 igt_plane_t *plane,
>> +					 kms_colorop_t *colorops[])
>> +{
>> +	igt_colorop_t *colorop = NULL;
>> +	int i;
>> +
>> +	/* go through all color pipelines */
>> +	for (i = 0; i < plane->num_color_pipelines; ++i) {
>> +		if (map_to_pipeline(display, plane->color_pipelines[i], colorops)) {
>> +			colorop = plane->color_pipelines[i];
>> +			break;
>> +		}
>> +	}
>> +
>> +	return colorop;
>> +}
>> +
>> +static void set_colorop(igt_display_t *display,
>> +			kms_colorop_t *colorop)
>> +{
>> +	igt_assert(colorop->colorop);
>> +	igt_colorop_set_prop_value(colorop->colorop, IGT_COLOROP_BYPASS, 0);
>> +
>> +	/* Set to desired value from kms_colorop_t */
>> +	switch (colorop->type) {
>> +	case KMS_COLOROP_ENUMERATED_LUT1D:
>> +		switch (colorop->enumerated_lut1d_info.tf) {
>> +		case KMS_COLOROP_LUT1D_SRGB_EOTF:
>> +			igt_colorop_set_prop_enum(colorop->colorop, IGT_COLOROP_CURVE_1D_TYPE, "sRGB EOTF");
>> +			break;
>> +		case KMS_COLOROP_LUT1D_SRGB_INV_EOTF:
>> +			igt_colorop_set_prop_enum(colorop->colorop, IGT_COLOROP_CURVE_1D_TYPE, "sRGB Inverse EOTF");
>> +			break;
>> +		case KMS_COLOROP_LUT1D_PQ_EOTF:
>> +		case KMS_COLOROP_LUT1D_PQ_INV_EOTF:
>> +		default:
>> +			igt_fail(IGT_EXIT_FAILURE);
>> +		}
>> +		break;
>> +	case KMS_COLOROP_CUSTOM_LUT1D:
>> +	case KMS_COLOROP_CTM:
>> +	case KMS_COLOROP_LUT3D:
>> +	default:
>> +		igt_fail(IGT_EXIT_FAILURE);
>> +	}
>> +}
>> +
>> +static void set_color_pipeline(igt_display_t *display,
>> +			       igt_plane_t *plane,
>> +			       kms_colorop_t *colorops[],
>> +			       igt_colorop_t *color_pipeline)
>> +{
>> +	igt_colorop_t *next;
>> +	int prop_val = 0;
>> +	int i;
>> +
>> +	igt_plane_set_color_pipeline(plane, color_pipeline);
>> +
>> +	for (i = 0; colorops[i]; i++)
>> +		set_colorop(display, colorops[i]);
>> +
>> +	/* set unused ops in pipeline to bypass */
>> +	next = color_pipeline;
>> +	i = 0;
>> +	while (next) {
>> +		if (!colorops[i] || colorops[i]->colorop != next)
>> +			igt_colorop_set_prop_value(next, IGT_COLOROP_BYPASS, 1);
>> +		else
>> +			i++;
>> +
>> +		prop_val = igt_colorop_get_prop(display, next,
>> +						IGT_COLOROP_NEXT);
>> +		next = igt_find_colorop(display, prop_val);
>> +	}
>> +}
>> +
>> +static void set_color_pipeline_bypass(igt_plane_t *plane)
>> +{
>> +	igt_plane_set_prop_enum(plane, IGT_PLANE_COLOR_PIPELINE, "Bypass");
>> +}
>> +
>> +static bool compare_with_bracket(igt_fb_t *in, igt_fb_t *out)
>> +{
>> +	if (is_vkms_device(in->fd))
>> +		return igt_cmp_fb_pixels(in, out, 1, 1);
>> +
>> +	/*
>> +	 * By default we'll look for a [0, 0] bracket. We can then
>> +	 * define it for each driver that implements support for this
>> +	 * test. That way we can understand the precision of each
>> +	 * driver better.
>> +	 */
>> +	return igt_cmp_fb_pixels(in, out, 0, 0);
>> +}
>> +
>> +#define DUMP_FBS 1
>> +
>> +#define MAX_COLOROPS 3
>> +#define NUM_COLOROP_TESTS 3
>> +#define MAX_NAME_SIZE 256
>> +
>> +static void apply_transforms(kms_colorop_t *colorops[], igt_fb_t *sw_transform_fb)
>> +{
>> +	int i;
>> +	igt_pixel_transform transforms[MAX_COLOROPS];
>> +
>> +	for (i = 0; colorops[i]; i++)
>> +		transforms[i] = colorops[i]->transform;
>> +
>> +	igt_color_transform_pixels(sw_transform_fb, transforms, i);
>> +}
>> +
>> +static void colorop_plane_test(igt_display_t *display,
>> +			       kms_colorop_t *colorops[])
>> +{
>> +	igt_colorop_t *color_pipeline = NULL;
>> +	igt_output_t *output;
>> +	igt_plane_t *plane;
>> +	igt_fb_t input_fb;
>> +	igt_fb_t sw_transform_fb;
>> +	igt_fb_t output_fb;
>> +	drmModeModeInfo mode;
>> +	unsigned int fb_id;
>> +	igt_crc_t input_crc, output_crc;
>> +
>> +	output = kms_writeback_get_output(display);
>> +	igt_require(output);
>> +
>> +	if (output->use_override_mode)
>> +		memcpy(&mode, &output->override_mode, sizeof(mode));
>> +	else
>> +		memcpy(&mode, &output->config.default_mode, sizeof(mode));
>> +
>> +	/* create input fb */
>> +	plane = igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
>> +	igt_assert(plane);
>> +
>> +	fb_id = igt_create_color_pattern_fb(display->drm_fd,
>> +					mode.hdisplay, mode.vdisplay,
>> +					DRM_FORMAT_XRGB8888, DRM_FORMAT_MOD_LINEAR,
>> +					0.2, 0.2, 0.2, &input_fb);
>> +	igt_assert(fb_id >= 0);
>> +	igt_plane_set_fb(plane, &input_fb);
>> +#if DUMP_FBS
>> +	igt_dump_fb(display, &input_fb, ".", "input");
>> +#endif
>> +
>> +	/* create output fb */
>> +	fb_id = igt_create_fb(display->drm_fd, mode.hdisplay, mode.vdisplay,
>> +				DRM_FORMAT_XRGB8888,
>> +				igt_fb_mod_to_tiling(0),
>> +				&output_fb);
>> +	igt_require(fb_id > 0);
>> +
>> +	igt_fb_get_fnv1a_crc(&input_fb, &input_crc);
>> +
>> +	igt_require(igt_plane_has_prop(plane, IGT_PLANE_COLOR_PIPELINE));
>> +
>> +	/* reset color pipeline*/
>> +
>> +	set_color_pipeline_bypass(plane);
>> +
>> +	/* Commit */
>> +	igt_plane_set_fb(plane, &input_fb);
>> +	igt_output_set_writeback_fb(output, &output_fb);
>> +
>> +	igt_display_commit_atomic(output->display,
>> +				DRM_MODE_ATOMIC_ALLOW_MODESET,
>> +				NULL);
>> +	get_and_wait_out_fence(output);
>> +
>> +	/* Compare input and output buffers. They should be equal here. */
>> +	igt_fb_get_fnv1a_crc(&output_fb, &output_crc);
>> +
>> +	igt_assert_crc_equal(&input_crc, &output_crc);
>> +
>> +	/* create sw transformed buffer */
>> +
>> +	igt_copy_fb(display->drm_fd, &input_fb, &sw_transform_fb);
>> +	igt_assert(igt_cmp_fb_pixels(&input_fb, &sw_transform_fb, 0, 0));
>> +
>> +	apply_transforms(colorops, &sw_transform_fb);
>> +#if DUMP_FBS
>> +	igt_dump_fb(display, &sw_transform_fb, ".", "sw_transform");
>> +#endif
>> +	/* discover and set COLOR PIPELINE */
>> +
>> +	/* get COLOR_PIPELINE enum */
>> +	color_pipeline = get_color_pipeline(display, plane, colorops);
>> +
>> +	/* skip test if we can't find applicable pipeline */
>> +	igt_skip_on(!color_pipeline);
>> +
>> +	set_color_pipeline(display, plane, colorops, color_pipeline);
>> +
>> +	igt_output_set_writeback_fb(output, &output_fb);
>> +
>> +	/* commit COLOR_PIPELINE */
>> +	igt_display_commit_atomic(display,
>> +				DRM_MODE_ATOMIC_ALLOW_MODESET,
>> +				NULL);
>> +	get_and_wait_out_fence(output);
>> +#if DUMP_FBS
>> +	igt_dump_fb(display, &output_fb, ".", "output");
>> +#endif
>> +
>> +	/* compare sw transformed and KMS transformed FBs */
>> +	igt_assert(compare_with_bracket(&sw_transform_fb, &output_fb));
>> +
>> +	/* reset color pipeline*/
>> +	set_color_pipeline_bypass(plane);
>> +
>> +	/* Commit */
>> +	igt_plane_set_fb(plane, &input_fb);
>> +	igt_output_set_writeback_fb(output, &output_fb);
>> +
>> +	igt_display_commit_atomic(output->display,
>> +				DRM_MODE_ATOMIC_ALLOW_MODESET,
>> +				NULL);
>> +	get_and_wait_out_fence(output);
>> +
>> +	/* cleanup */
>> +	detach_crtc(display, output);
>> +	igt_remove_fb(display->drm_fd, &input_fb);
>> +	igt_remove_fb(display->drm_fd, &output_fb);
>> +}
>> +
>> +igt_main
>> +{
>> +
>> +	struct {
>> +		kms_colorop_t *colorops[MAX_COLOROPS];
>> +		const char *name;
>> +	} tests[] = {
>> +		{ { &kms_colorop_srgb_eotf, NULL }, "srgb_eotf" },
>> +		{ { &kms_colorop_srgb_inv_eotf, NULL }, "srgb_inv_eotf" },
>> +		{ { &kms_colorop_srgb_eotf, &kms_colorop_srgb_inv_eotf, NULL }, "srgb_eotf-srgb_inv_eotf" }
>> +	};
>> +
>> +	igt_display_t display;
>> +	int i, ret;
>> +
>> +	igt_fixture {
>> +		display.drm_fd = drm_open_driver_master(DRIVER_ANY);
>> +
>> +		if (drmSetClientCap(display.drm_fd, DRM_CLIENT_CAP_ATOMIC, 1) == 0)
>> +			display.is_atomic = 1;
>> +
>> +		ret = drmSetClientCap(display.drm_fd, DRM_CLIENT_CAP_WRITEBACK_CONNECTORS, 1);
>> +
>> +		igt_require_f(!ret, "error setting DRM_CLIENT_CAP_WRITEBACK_CONNECTORS\n");
>> +
>> +		igt_display_require(&display, display.drm_fd);
>> +
>> +		kmstest_set_vt_graphics_mode();
>> +
>> +		igt_display_require(&display, display.drm_fd);
>> +
>> +		igt_require(display.is_atomic);
>> +
>> +	}
>> +
>> +	for (i = 0; i < ARRAY_SIZE(tests); i++) {
>> +		igt_describe("Check color ops on a plane");
>> +		igt_subtest_f("plane-%s", tests[i].name)
>> +			colorop_plane_test(&display, tests[i].colorops);
>> +	}
>> +
>> +	igt_describe("Tests getting and setting COLOR_PIPELINE property on plane");
>> +	igt_fixture {
>> +		igt_display_fini(&display);
>> +	}
>> +}
>> diff --git a/tests/kms_colorop.h b/tests/kms_colorop.h
>> new file mode 100644
>> index 000000000..f414895dd
>> --- /dev/null
>> +++ b/tests/kms_colorop.h
>> @@ -0,0 +1,88 @@
>> +/* SPDX-License-Identifier: MIT */
>> +/*
>> + * Copyright 2023 Advanced Micro Devices, Inc.
>> + *
>> + * Permission is hereby granted, free of charge, to any person obtaining a
> Same here, remove this text.
>
> Regards,
> Kamil
>
>> + * copy of this software and associated documentation files (the "Software"),
>> + * to deal in the Software without restriction, including without limitation
>> + * the rights to use, copy, modify, merge, publish, distribute, sublicense,
>> + * and/or sell copies of the Software, and to permit persons to whom the
>> + * Software is furnished to do so, subject to the following conditions:
>> + *
>> + * The above copyright notice and this permission notice shall be included in
>> + * all copies or substantial portions of the Software.
>> + *
>> + * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
>> + * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
>> + * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
>> + * THE COPYRIGHT HOLDER(S) OR AUTHOR(S) BE LIABLE FOR ANY CLAIM, DAMAGES OR
>> + * OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
>> + * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
>> + * OTHER DEALINGS IN THE SOFTWARE.
>> + */
>> +
>> +#ifndef __KMS_COLOROP_H__
>> +#define __KMS_COLOROP_H__
>> +
>> +#include "igt_color.h"
>> +
>> +typedef bool (*compare_fb_t)(igt_fb_t *in, igt_fb_t *out);
>> +
>> +typedef int (*transform_fb)(igt_fb_t *in);
>> +
>> +typedef int (*transform_pixel)(igt_pixel_t *pixel);
>> +
>> +/* Test version definitions */
>> +typedef enum kms_colorop_type {
>> +	KMS_COLOROP_ENUMERATED_LUT1D,
>> +	KMS_COLOROP_CUSTOM_LUT1D,
>> +	KMS_COLOROP_CTM,
>> +	KMS_COLOROP_LUT3D
>> +} kms_colorop_type_t;
>> +
>> +typedef enum kms_colorop_lut1d_tf {
>> +	KMS_COLOROP_LUT1D_SRGB_EOTF,
>> +	KMS_COLOROP_LUT1D_SRGB_INV_EOTF,
>> +	KMS_COLOROP_LUT1D_PQ_EOTF,
>> +	KMS_COLOROP_LUT1D_PQ_INV_EOTF,
>> +} kms_colorop_lut1d_tf_t;
>> +
>> +typedef struct kms_colorop_enumerated_lut1d_info {
>> +	kms_colorop_lut1d_tf_t tf;
>> +} kms_colorop_enumerated_lut1d_info_t;
>> +
>> +typedef struct kms_colorop {
>> +	kms_colorop_type_t type;
>> +
>> +	union {
>> +		kms_colorop_enumerated_lut1d_info_t enumerated_lut1d_info;
>> +	};
>> +
>> +	const char *name;
>> +
>> +	igt_pixel_transform transform;
>> +
>> +	/* Mapped colorop */
>> +	igt_colorop_t *colorop;
>> +
>> +} kms_colorop_t;
>> +
>> +kms_colorop_t kms_colorop_srgb_eotf = {
>> +	.type = KMS_COLOROP_ENUMERATED_LUT1D,
>> +	.enumerated_lut1d_info = {
>> +		.tf = KMS_COLOROP_LUT1D_SRGB_EOTF
>> +	},
>> +	.name = "srgb_eotf",
>> +	.transform = &igt_color_srgb_eotf
>> +};
>> +
>> +kms_colorop_t kms_colorop_srgb_inv_eotf = {
>> +	.type = KMS_COLOROP_ENUMERATED_LUT1D,
>> +	.enumerated_lut1d_info = {
>> +		.tf = KMS_COLOROP_LUT1D_SRGB_INV_EOTF
>> +	},
>> +	.name = "srgb_inv_eotf",
>> +	.transform = &igt_color_srgb_inv_eotf
>> +};
>> +
>> +#endif /* __KMS_COLOROP_H__ */
>> diff --git a/tests/meson.build b/tests/meson.build
>> index 5c01c64e9..e612e1a05 100644
>> --- a/tests/meson.build
>> +++ b/tests/meson.build
>> @@ -26,6 +26,7 @@ test_progs = [
>>   	'kms_bw',
>>   	'kms_color',
>>   	'kms_concurrent',
>> +	'kms_colorop',
>>   	'kms_content_protection',
>>   	'kms_cursor_crc',
>>   	'kms_cursor_edge_walk',
>> -- 
>> 2.43.0
>>

