Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C75A9CF65CB
	for <igt-dev@archiver.kernel.org>; Mon, 26 Jan 2026 09:56:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7CDCD10E045;
	Mon, 26 Jan 2026 09:56:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IPHL5z5i";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 35AA810E045
 for <igt-dev@lists.freedesktop.org>; Mon, 26 Jan 2026 09:56:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769421384; x=1800957384;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=xW3yE1FoSr/D2mX5HJww0FF0Vmtr1ljkNIBtnUlPvOA=;
 b=IPHL5z5iLoWztrQl0RLmj68g1ZQ1I9PLZJhjmVhDBbcjU2LgM+dd/ZQd
 4w6gaDAWetBPRugUFBh8XRNpUNK0TF2zgjvD7MHOBM7d1rp8oOR7Ah2eu
 X5AkBko9Uxv5cM96xwpxjhgW6vzhE5kJMLS4ewykG9NZmcGFXlID+mE9e
 Xo8OyZgxXZSy2eh52lKTYKDia0XLIu/SuR0YV683oC+CcB/UWxGiviobX
 HEwylbGihjnP4X6kWU03h2z+bEnnsvFN9HL1HkgnCrOd3n6lypDd/6Ddy
 UpaBTJsVpAvvIT5YH95TL2D0ZvtHpbKCJ09KZtwxVP5WzFQtyleTtHmDL A==;
X-CSE-ConnectionGUID: BFMl6/pSTSS7VewqgggsNg==
X-CSE-MsgGUID: Nyer+z1OSwG3xPmh85sPsA==
X-IronPort-AV: E=McAfee;i="6800,10657,11682"; a="70754171"
X-IronPort-AV: E=Sophos;i="6.21,254,1763452800"; d="scan'208";a="70754171"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jan 2026 01:56:23 -0800
X-CSE-ConnectionGUID: gV8Os7J9RburTfvNtL518w==
X-CSE-MsgGUID: cYKRZnXTSqmzR8ed0Kj1lA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,254,1763452800"; d="scan'208";a="207527660"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jan 2026 01:56:23 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Mon, 26 Jan 2026 01:56:22 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Mon, 26 Jan 2026 01:56:22 -0800
Received: from CY7PR03CU001.outbound.protection.outlook.com (40.93.198.70) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Mon, 26 Jan 2026 01:56:22 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KFf1NVzucKsVC/r2rPc2nvRdw2UPDKNa4JM1jBszcgie85zv6AU5S+2vr6f+kwZG9FtYuWtl2RnBIcpiR6eL7mndTUdO3ZuIAgPvHORndQkMtq1+NIboyHKSXloQ/5HlNxhMqW6wnIPhgQ1nnaUB6ODNfXd5LtWkslezTgdOs4NUbWDPKJ+3OPe6A9gORN6QeCkkOXU32jeR4pblHACbZRKpSMykf/ppJF6XsuervAmLeRox5I00R0BHgJsMSVaIHO0ea7JdO3l0LfoWwOh+t+/FU+NqdjBhcrG7py701Kb1VYFQuO/Iq1pT2nQtV1HzJkjDJUgQTflsTE8l9Eyufw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HT9bBGa4I9XhysjmpZ52SBBc0jvqcw8ZJKASkpRikWc=;
 b=sxuo9SkT8Ag9QY2EPbe6SqFUODj9xWcQ3NpcD4HH6ygvyqZhojQ4iwmIiMQxPjZPv7XHIoM+QDaDLsC16/1yRwLijHlMiZH+E4I5VgueuzG7SfRgTbmzxgloGxIEbZPtLIT2zbzMjE5wvW/r/8Zg/VjmqCFUWebkIFBidmS7yLjP+gQoUGRjE71Tpnaimzc9WPeJf5UI8Bq9pV0EnotnKIgbbdn0HpXLCVqLhDSHTqXyq9oiDkXo8P8edK5vi9ruHzrLgF8hVjY73Wa8ioG+AJY+4cVn+hYMxkYVuszUplRZ2c/ovlcfTDrmN3YaFUJnUjIA1GAAzoj1sSR2O9cjUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB8179.namprd11.prod.outlook.com (2603:10b6:8:18e::22)
 by DM4PR11MB6526.namprd11.prod.outlook.com (2603:10b6:8:8d::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.14; Mon, 26 Jan
 2026 09:56:14 +0000
Received: from DM4PR11MB8179.namprd11.prod.outlook.com
 ([fe80::7396:3750:f6eb:4765]) by DM4PR11MB8179.namprd11.prod.outlook.com
 ([fe80::7396:3750:f6eb:4765%5]) with mapi id 15.20.9542.010; Mon, 26 Jan 2026
 09:56:14 +0000
Message-ID: <c06847bf-06c6-4adf-9356-289089e3dbe6@intel.com>
Date: Mon, 26 Jan 2026 10:56:10 +0100
User-Agent: Mozilla Thunderbird
Subject: =?UTF-8?Q?Re=3A_=E2=9C=97_Xe=2ECI=2EFull=3A_failure_for_series_star?=
 =?UTF-8?Q?ting_with_=5Bi-g-t=2Cv3=2C1/1=5D_tests/xe=5Feudebug=5Fonline=3A_E?=
 =?UTF-8?Q?xtract_workload_start_helpers?=
To: <igt-dev@lists.freedesktop.org>
References: <20260123125342.311645-2-piotr.rudnicki@intel.com>
 <176922071338.189692.11845357726788059203@a3b018990fe9>
Content-Language: en-US
From: "Rudnicki, Piotr" <piotr.rudnicki@intel.com>
In-Reply-To: <176922071338.189692.11845357726788059203@a3b018990fe9>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VIZP296CA0022.AUTP296.PROD.OUTLOOK.COM
 (2603:10a6:800:2a8::14) To DM4PR11MB8179.namprd11.prod.outlook.com
 (2603:10b6:8:18e::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB8179:EE_|DM4PR11MB6526:EE_
X-MS-Office365-Filtering-Correlation-Id: 476f24d7-6ff2-4417-2e3d-08de5cc1243f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ODArK1BlV0dUOVhnbGppUzRzaG1YZzBML1k3TGxnbGp0RGloM05qUmhjbDhF?=
 =?utf-8?B?UU1KRVdBRWFrNzNZSEo1MXB6aFNUR3hKcm1ZWlE2ZHRuelNabUM0Q2FLWVVC?=
 =?utf-8?B?bzN3b0tFY1JQZEJFNElxNzZSdG1vNWFtZkFpQzdLRGE4d0tFRCtXdGVVOVlU?=
 =?utf-8?B?Y2c2a21JUkZzVCthZ1RjMkROYm0zdWFFSnI3bElVZ1hUeTVPc0lmc1B0cXo4?=
 =?utf-8?B?UldGdXk0bGQ1dDRsS0VpMzVvdEU3eGFTcXM2WXJWbnZUUGpEZ25CS003K0tz?=
 =?utf-8?B?aHVzSWhGMlY0UDl3YmYvUGtkNFNYRVJiOTFGSTlrMy9RNXBNQW9FZkRMSEFU?=
 =?utf-8?B?Zk40alBtV3lWblc2RVlxVlRmMzZHaUdhOHJNc3Izd2oySHRlNER0NEdYb3pR?=
 =?utf-8?B?VWQ5Mm55dHhiMldtcjFJMmFmTDJQUG40MVdmRXZ1NHMvZzlnSXYwZHhNSkRn?=
 =?utf-8?B?em14c1ZmMDJDbTdNS2E5TVZHbkl3dDMyT005dkt6NDEyeVdLNFNZMHJKY1Ev?=
 =?utf-8?B?ZVE5bW5zWFpDa0d1bEhEQ0Z3RGVuQ0JzZUJhK3pyczRMcDFoNVNndnZDMFVI?=
 =?utf-8?B?ZTY3MGhjakF0OFBTNVdnOVA3ZDdNdCs5bHN4c2FESklDbFJYKzVMYzNDUmtx?=
 =?utf-8?B?WDVPYVpWY3I0Zk1IWENnOTBJTkhFenFrdCtvQUxYa2NLOEh1VjhQeVZ6OUJC?=
 =?utf-8?B?cHpleFBVL1h5Z2VYWFJTeFdOZXJHV3gxUzVQSmtLbjlaMk9XYzVYV1Qwd0pY?=
 =?utf-8?B?eitscDBnNnRUSXJYRHhhdEd2d1pseitFSVVYNzRJRXEwUWVxbUUzMFhNdytQ?=
 =?utf-8?B?cWtpYml5dVdqVkJuZFY4SklBdmNaelpGS2FUR2RGZmJLeFIyYk82U1MxTmRr?=
 =?utf-8?B?Q2hPVjVzendaK2E5NzV5cmJmSVIvaUpwOVBUMW5nVll4M1Rablh1ajZrK3cv?=
 =?utf-8?B?clErQTVDQlpFMVlxQzNORGtobTB2UC9xbWwxQ3pkSmpXWGdxc21wUFhacGZL?=
 =?utf-8?B?WEtMV3VJekpxc29VcVlkaDM3WG4rSFdta0V4UGg0akc5cGdXaDFkeDU2WVlp?=
 =?utf-8?B?SzhTK1puazFCSEs5MkVRSndCaWRsZVNMT0hiYjQzTFArUUFDY0dQempuTFlr?=
 =?utf-8?B?clpKNzFiUktMdU54YUdnTzlldlI5WG5MSGQ3Um5oRnFZRmUxcW5EbUFhODVR?=
 =?utf-8?B?bDlZTmZLaWxqZXlTMmxmRkZZRFRpQmlJdEJhZ2FsN0tkT0VBR29UUXJxaTg5?=
 =?utf-8?B?V0d6b1cxamFQcFlUbmdmQlRmR0tCKzhITHFocUZsZUJ4SThZNHJqRkZzVVgr?=
 =?utf-8?B?aGc0emZpWmpkcnJUeXBBY3EwMjZwZ1JxN1lDdmNOQWtIMnNKa2pPam1tYUto?=
 =?utf-8?B?Snk4cEp6TG5hQ0o5UG52R0JwYnJXQUF1ZmJMZFg4MGgyK0h0aEdIbTFxMFRD?=
 =?utf-8?B?SWxhV2FNVXBCMWxheCtoTC9GR1pnOWphNVpMWURXNVRWdzVjT3VZNEtRcmdO?=
 =?utf-8?B?aHpTOE5Xdk1OcllxUVlaRjZwQktIRmFkR1psNXE4OTlmZWY5Q1pUNEFjNDJm?=
 =?utf-8?B?dkE3aVR6N1U1ZXp5WGduVnJSaXFXRkxjemF2QmJ3WmUzZjE1ZW10YjRtVWJ6?=
 =?utf-8?B?TVA0WVhSUnVGc1pvc0pUYVI3eHlNTmUwWTB6eW84MU5uR3NCVDU1VU8xUiti?=
 =?utf-8?B?MVFDSm9KZXI0RldUcnZMNW5OK2Q0RVJCVDJRS0VvWjIxT3JseDJYaCtXZ0dU?=
 =?utf-8?B?WjhhV21DUXdQeXozVlAxejZOT0VuVURSQUxydzBlbCs0M3NNQ3V2VVU4Uk1H?=
 =?utf-8?B?UGlaalY0SUpPY0ZEdGhRbFBFcmxvbG5SdHRMNWVXMG9SN1hMU0lYR1FUUnVO?=
 =?utf-8?B?VWNUZVJRVThnNDlQN3ZsZld0QjZqNGNacU96VWJ3Y3FDSGF0OFRid3BIUnJ5?=
 =?utf-8?B?elhxM0IrdVQxWGpEdVMvWGFzZEpoeVpZbXNtOU9YQVF3SVlKTlVqSnlQbndr?=
 =?utf-8?B?N053YUc3R09aV3dPK0hPSC9HbldNeDNUNHB1TlZKWWZIa2hZaklCZ0VncjlZ?=
 =?utf-8?Q?cIb5Yf?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB8179.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NXZFNTB5TUZlZUVIc0YrcFhYVkxGVHNPbStiNEdZVTRIYkhVTWoxRGo2UXZY?=
 =?utf-8?B?MmV5MSt2TzN3M0swQ2VTdGZiUDNqUS9mRHg5cW15YzkvQmhrLzNMd2RXUE5Q?=
 =?utf-8?B?TFc2MlRiSndlVzNCSEVRSGUrcWtqZldZMDBpWHVRaHF0WU9veUpEbTcrRTho?=
 =?utf-8?B?bnpaS0dMRmxsWWJwMndVWW94bGI2cEpTZVJ5b3hBM3VSdmhaL0t1dnVTNHJk?=
 =?utf-8?B?anpZOUIxRVpWall5UFRjeTIyckVJd25kNGZWY1d0dVkzUmd4MHFhTVpLNktp?=
 =?utf-8?B?YmVkcjI4b2dXaGV5WEluc0ZkV25rZ1luUU1kejZNRHJVbm5CdDlEYnV6WFU4?=
 =?utf-8?B?d3FnSFpBVnJZcHUzTUpqa1FxcWlkeml2Sml5VnZDc1VpR3VXTFNjbkJabFVy?=
 =?utf-8?B?cWJzeU81cjNRaGtqakJnUituc2IzVTZkalFESnJYLzhOTUtCSHR5L3hubkZi?=
 =?utf-8?B?SjFiNmw2NVUyaHh0eUViUVF6L2RwUlh2ZEtydzJVdmtwdjEzNCtWWi93akE3?=
 =?utf-8?B?TkdwZ2d0MHRQVEZsczdpN2MvYjAycE9PencxUTE2dVBwaTNLd3ZrQy9jOU1G?=
 =?utf-8?B?TDBEdms5ZmIyc0hpWGJxS1N2bDJMNkpKMkVpUTEySWxFVGJWQlFtamNDSEtS?=
 =?utf-8?B?Sy9SYW9kWlA3OVdjZXhLU0lHRmxPeFRmbGE5RHkvTUlUSGc1Z0pmcm5LNTRR?=
 =?utf-8?B?S2ZLMHUzRHR0Ylord1BGQzUwbTFXMmQyRmt6MzJwVWl3Tkl1WkxrQ2lxMmUz?=
 =?utf-8?B?a0Z3M0hTRlRoMkhMN3lZN1l4VXpkKzhid0t5ZEZtV2ppcjYxMkwvcVdVSWRR?=
 =?utf-8?B?MzdlajVDRlV1VFdJTytlT2JBSWNzSTV4ZmRYZUVQWGY0Z3pUalVOUkdoOXdN?=
 =?utf-8?B?MkxsVE1nRmtZNWN5UWdEVi9wbENZb0tFbHJFVVhBMEZZa1pNN0R0VmFkZEo5?=
 =?utf-8?B?WUZpZ3VCKzNwVE9XMHRsZkRiL3VSQkJ4M3h6U1NOOTZ2WmlLTGt4Nkg4RXk2?=
 =?utf-8?B?K0EzY0NmUkpneGUwZXpJQ3JLNWdwZzdIek01ZUIyZTBkcGZqSE8va3pMNlVv?=
 =?utf-8?B?MmF3dWoxL3BMK3hNaVJocFEreE1Tc3h1YkVCMmMrN2FmdVhNd2NSbm5BQ2ZG?=
 =?utf-8?B?WDdSbXR2NEZTdVM4ZnNnaGg5cnpTS29vMFg3RklYNk1RWVlOelExNlJDYVRs?=
 =?utf-8?B?UVMyMDVlTWZBYllpS3VQWnhMMDFRdmxJWTFGUjZsUTA1MHJkbzA0WEJraWlu?=
 =?utf-8?B?V3o0QzJTam9oK0xIQ3g1b056bDBEU2U1NkZLbEdTaXdiU0hUbjBZVEJzMUdM?=
 =?utf-8?B?ZzRXQTQyZ09CbHpWb3d3VWkyQUs2U1IzdlRaak9uZU9UVjlyWVB5bFEvVFJY?=
 =?utf-8?B?TjVWbjJOOFhEbm9kMTVsVzFuUWlWblpITFhKWGVDelNOMW5wK0FuL05kWTRv?=
 =?utf-8?B?dnZZNjd3ZFRSVFM0alpsOTBScWNVYjRlNEoyNTdoaHZLYVozc0I5dElBYmVq?=
 =?utf-8?B?a05jcStHc1NYRVlDM3RiMVR3czVyM0NvbVpDVDkxTjl5S21WdHVnaTllNlJL?=
 =?utf-8?B?RHQ2c3dhTUl3MW1MbGtYTkZkM1NyRkVnUnc4VlV0bm9ud2N0QUxEb2JwMzVs?=
 =?utf-8?B?MTRsRlBSd0RGUHF2S1JYa2lPRVV4NXVZVi95ckphdjQyTGlPc2p6NXJOWmNG?=
 =?utf-8?B?dlZBd3MvMmxnSi9qWGRZa08vem5KQWN1a2FTbFU1b2kxS0N6QzArbFFYWDZj?=
 =?utf-8?B?Y1NaclUwbHE0cGNURnYxUFNLSVJOV25MTUFoZnQvSldBWHpyUE90ZmhvVEx6?=
 =?utf-8?B?d2k3SDVWQU01ZGpsZXg1V1BzUkZHdVpXVEIzd250d0RQV0tTb3pFRnQvbndD?=
 =?utf-8?B?eE5FcWpSbDBhdDN6MEpWc3F4MVRGcXJkYzBZRUpmckJPZTVWeVZwbVllVldS?=
 =?utf-8?B?c1dGKytUeElvQjU1L2JubktIZUJ6Vi9TenB3aGI0eGxIUTc2OUdNRGJsdG9R?=
 =?utf-8?B?bFRNYkFEODBJeUhEYk1xUURCWjhtK3BNWWtrdWZIQkJIWWQ5Q29RT1dNbHZV?=
 =?utf-8?B?M1I0dXV3QnNFbmFzc1BtWGVoTTZIMWgva2RjVHRxM3IzblZGQTFFcC9TelRW?=
 =?utf-8?B?RUdTc2NEcU1kZDdwcldhSlZWMm9ncnlJaTZWSWdoRDVBQkZHdUd2encrdGNL?=
 =?utf-8?B?K0EyZEs4eE5LVlgvSDF3R0RTRnAzL25nNWtxZXhJOFB1cUpOOGxMTGt2WG1U?=
 =?utf-8?B?ZytPVi95SjVBN2UyQmRoRXNjUUdzdS81VmVSSFd2NUFvMWlQRzJYc1ZtZ2dw?=
 =?utf-8?B?SWkwT1laTEhkS0xNQjlkenlwaTFRNGIvQXhSUXQyVjdjNW55eFpPdEhUUlB0?=
 =?utf-8?Q?We8cytMhkrDN7tj0=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 476f24d7-6ff2-4417-2e3d-08de5cc1243f
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB8179.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jan 2026 09:56:14.2633 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ssGDdiF5Td6L5Ip52vwZVAo5dtWUdbuTuTHkAiW4cjv6O1uYdV0k+qJrSdMvvG97qociniPy7zd8QnkcZ7CljU7wFwf5/tZqTrQufWmQF+k=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6526
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



On 1/24/2026 3:11 AM, Patchwork wrote:
> == Series Details ==
> 
> Series: series starting with [i-g-t,v3,1/1] tests/xe_eudebug_online: Extract workload start helpers
> URL   : https://patchwork.freedesktop.org/series/160557/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from XEIGT_8716_FULL -> XEIGTPW_14413_FULL
> ====================================================
> 
> Summary
> -------
> 
>    **FAILURE**
> 
>    Serious unknown changes coming with XEIGTPW_14413_FULL absolutely need to be
>    verified manually.
>    
>    If you think the reported changes have nothing to do with the changes
>    introduced in XEIGTPW_14413_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
>    to document this new failure mode, which will reduce false positives in CI.
> 
>    
> 
> Participating hosts (2 -> 2)
> ------------------------------
> 
>    No changes in participating hosts
> 
> Possible new issues
> -------------------
> 
>    Here are the unknown changes that may have been introduced in XEIGTPW_14413_FULL:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>    * igt@kms_atomic_transition@plane-all-transition-nonblocking:
>      - shard-bmg:          [PASS][1] -> [INCOMPLETE][2] +2 other tests incomplete
>     [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8716/shard-bmg-4/igt@kms_atomic_transition@plane-all-transition-nonblocking.html
>     [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14413/shard-bmg-3/igt@kms_atomic_transition@plane-all-transition-nonblocking.html
> 
>    * igt@kms_fbcon_fbt@psr-suspend:
>      - shard-lnl:          [PASS][3] -> [ABORT][4]
>     [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8716/shard-lnl-7/igt@kms_fbcon_fbt@psr-suspend.html
>     [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14413/shard-lnl-5/igt@kms_fbcon_fbt@psr-suspend.html
> 
>    * igt@kms_pm_rpm@system-suspend-idle:
>      - shard-lnl:          [PASS][5] -> [SKIP][6]
>     [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8716/shard-lnl-4/igt@kms_pm_rpm@system-suspend-idle.html
>     [6]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14413/shard-lnl-5/igt@kms_pm_rpm@system-suspend-idle.html
> 
>    
> #### Warnings ####
> 
>    * igt@xe_exec_multi_queue@max-queues-preempt-mode-fault-close-fd:
>      - shard-bmg:          [SKIP][7] ([Intel XE#6874]) -> [ABORT][8]
>     [7]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8716/shard-bmg-1/igt@xe_exec_multi_queue@max-queues-preempt-mode-fault-close-fd.html
>     [8]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14413/shard-bmg-9/igt@xe_exec_multi_queue@max-queues-preempt-mode-fault-close-fd.html
> 
Hi, those errors are not related to my changes.

Best regards,
Piotr Rudnicki

>    
> Known issues
> ------------
> 
>    Here are the changes found in XEIGTPW_14413_FULL that come from known issues:
> 
> ### IGT changes ###
> 
> #### Issues hit ####
> 
>    * igt@intel_hwmon@hwmon-read:
>      - shard-lnl:          NOTRUN -> [SKIP][9] ([Intel XE#1125])
>     [9]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14413/shard-lnl-4/igt@intel_hwmon@hwmon-read.html
> 
>    * igt@kms_big_fb@linear-64bpp-rotate-270:
>      - shard-bmg:          NOTRUN -> [SKIP][10] ([Intel XE#2327])
>     [10]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14413/shard-bmg-9/igt@kms_big_fb@linear-64bpp-rotate-270.html
>      - shard-lnl:          NOTRUN -> [SKIP][11] ([Intel XE#1407])
>     [11]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14413/shard-lnl-5/igt@kms_big_fb@linear-64bpp-rotate-270.html
> 
>    * igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-0-hflip:
>      - shard-lnl:          NOTRUN -> [SKIP][12] ([Intel XE#7059])
>     [12]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14413/shard-lnl-3/igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-0-hflip.html
> 
>    * igt@kms_big_fb@y-tiled-16bpp-rotate-270:
>      - shard-bmg:          NOTRUN -> [SKIP][13] ([Intel XE#1124]) +2 other tests skip
>     [13]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14413/shard-bmg-2/igt@kms_big_fb@y-tiled-16bpp-rotate-270.html
> 
>    * igt@kms_big_fb@y-tiled-addfb-size-overflow:
>      - shard-bmg:          NOTRUN -> [SKIP][14] ([Intel XE#610])
>     [14]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14413/shard-bmg-8/igt@kms_big_fb@y-tiled-addfb-size-overflow.html
> 
>    * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:
>      - shard-lnl:          NOTRUN -> [SKIP][15] ([Intel XE#1124]) +5 other tests skip
>     [15]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14413/shard-lnl-4/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html
> 
>    * igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p:
>      - shard-lnl:          NOTRUN -> [SKIP][16] ([Intel XE#2191])
>     [16]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14413/shard-lnl-1/igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p.html
> 
>    * igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-rc-ccs:
>      - shard-lnl:          NOTRUN -> [SKIP][17] ([Intel XE#2887]) +4 other tests skip
>     [17]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14413/shard-lnl-4/igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-rc-ccs.html
> 
>    * igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-mc-ccs:
>      - shard-bmg:          NOTRUN -> [SKIP][18] ([Intel XE#3432])
>     [18]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14413/shard-bmg-4/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-mc-ccs.html
> 
>    * igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc:
>      - shard-lnl:          NOTRUN -> [SKIP][19] ([Intel XE#3432])
>     [19]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14413/shard-lnl-8/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc.html
> 
>    * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs:
>      - shard-bmg:          NOTRUN -> [SKIP][20] ([Intel XE#2887]) +5 other tests skip
>     [20]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14413/shard-bmg-4/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs.html
> 
>    * igt@kms_chamelium_audio@dp-audio:
>      - shard-lnl:          NOTRUN -> [SKIP][21] ([Intel XE#373])
>     [21]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14413/shard-lnl-5/igt@kms_chamelium_audio@dp-audio.html
> 
>    * igt@kms_chamelium_color@ctm-max:
>      - shard-lnl:          NOTRUN -> [SKIP][22] ([Intel XE#306]) +1 other test skip
>     [22]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14413/shard-lnl-8/igt@kms_chamelium_color@ctm-max.html
> 
>    * igt@kms_chamelium_color@degamma:
>      - shard-bmg:          NOTRUN -> [SKIP][23] ([Intel XE#2325])
>     [23]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14413/shard-bmg-8/igt@kms_chamelium_color@degamma.html
> 
>    * igt@kms_chamelium_hpd@dp-hpd-after-suspend:
>      - shard-bmg:          NOTRUN -> [SKIP][24] ([Intel XE#2252]) +4 other tests skip
>     [24]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14413/shard-bmg-9/igt@kms_chamelium_hpd@dp-hpd-after-suspend.html
> 
>    * igt@kms_color_pipeline@plane-lut1d-post-ctm3x4:
>      - shard-lnl:          NOTRUN -> [FAIL][25] ([Intel XE#6968]) +3 other tests fail
>     [25]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14413/shard-lnl-7/igt@kms_color_pipeline@plane-lut1d-post-ctm3x4.html
> 
>    * igt@kms_content_protection@dp-mst-type-1:
>      - shard-lnl:          NOTRUN -> [SKIP][26] ([Intel XE#307] / [Intel XE#6974])
>     [26]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14413/shard-lnl-1/igt@kms_content_protection@dp-mst-type-1.html
>      - shard-bmg:          NOTRUN -> [SKIP][27] ([Intel XE#2390] / [Intel XE#6974])
>     [27]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14413/shard-bmg-10/igt@kms_content_protection@dp-mst-type-1.html
> 
>    * igt@kms_content_protection@mei-interface:
>      - shard-lnl:          NOTRUN -> [SKIP][28] ([Intel XE#1468])
>     [28]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14413/shard-lnl-8/igt@kms_content_protection@mei-interface.html
>      - shard-bmg:          NOTRUN -> [SKIP][29] ([Intel XE#2341])
>     [29]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14413/shard-bmg-2/igt@kms_content_protection@mei-interface.html
> 
>    * igt@kms_cursor_crc@cursor-onscreen-512x512:
>      - shard-lnl:          NOTRUN -> [SKIP][30] ([Intel XE#2321])
>     [30]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14413/shard-lnl-7/igt@kms_cursor_crc@cursor-onscreen-512x512.html
> 
>    * igt@kms_cursor_crc@cursor-random-256x85:
>      - shard-lnl:          NOTRUN -> [SKIP][31] ([Intel XE#1424])
>     [31]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14413/shard-lnl-2/igt@kms_cursor_crc@cursor-random-256x85.html
> 
>    * igt@kms_cursor_crc@cursor-sliding-512x170:
>      - shard-bmg:          NOTRUN -> [SKIP][32] ([Intel XE#2321])
>     [32]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14413/shard-bmg-2/igt@kms_cursor_crc@cursor-sliding-512x170.html
> 
>    * igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy:
>      - shard-lnl:          NOTRUN -> [SKIP][33] ([Intel XE#309]) +1 other test skip
>     [33]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14413/shard-lnl-2/igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy.html
> 
>    * igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size:
>      - shard-bmg:          [PASS][34] -> [DMESG-WARN][35] ([Intel XE#5354])
>     [34]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8716/shard-bmg-7/igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size.html
>     [35]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14413/shard-bmg-7/igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size.html
> 
>    * igt@kms_cursor_legacy@flip-vs-cursor-legacy:
>      - shard-bmg:          [PASS][36] -> [FAIL][37] ([Intel XE#5299])
>     [36]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8716/shard-bmg-4/igt@kms_cursor_legacy@flip-vs-cursor-legacy.html
>     [37]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14413/shard-bmg-7/igt@kms_cursor_legacy@flip-vs-cursor-legacy.html
> 
>    * igt@kms_dp_linktrain_fallback@dsc-fallback:
>      - shard-bmg:          NOTRUN -> [SKIP][38] ([Intel XE#4331])
>     [38]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14413/shard-bmg-8/igt@kms_dp_linktrain_fallback@dsc-fallback.html
> 
>    * igt@kms_dsc@dsc-fractional-bpp-with-bpc:
>      - shard-lnl:          NOTRUN -> [SKIP][39] ([Intel XE#2244])
>     [39]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14413/shard-lnl-8/igt@kms_dsc@dsc-fractional-bpp-with-bpc.html
> 
>    * igt@kms_dsc@dsc-with-output-formats:
>      - shard-bmg:          NOTRUN -> [SKIP][40] ([Intel XE#2244]) +1 other test skip
>     [40]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14413/shard-bmg-8/igt@kms_dsc@dsc-with-output-formats.html
> 
>    * igt@kms_fbcon_fbt@fbc-suspend:
>      - shard-bmg:          NOTRUN -> [SKIP][41] ([Intel XE#4156])
>     [41]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14413/shard-bmg-10/igt@kms_fbcon_fbt@fbc-suspend.html
> 
>    * igt@kms_flip@2x-absolute-wf_vblank-interruptible:
>      - shard-lnl:          NOTRUN -> [SKIP][42] ([Intel XE#1421]) +1 other test skip
>     [42]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14413/shard-lnl-1/igt@kms_flip@2x-absolute-wf_vblank-interruptible.html
> 
>    * igt@kms_flip@flip-vs-expired-vblank-interruptible:
>      - shard-lnl:          [PASS][43] -> [FAIL][44] ([Intel XE#301] / [Intel XE#3149]) +1 other test fail
>     [43]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8716/shard-lnl-8/igt@kms_flip@flip-vs-expired-vblank-interruptible.html
>     [44]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14413/shard-lnl-4/igt@kms_flip@flip-vs-expired-vblank-interruptible.html
> 
>    * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-downscaling:
>      - shard-lnl:          NOTRUN -> [SKIP][45] ([Intel XE#1397] / [Intel XE#1745])
>     [45]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14413/shard-lnl-5/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-downscaling.html
> 
>    * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-downscaling@pipe-a-default-mode:
>      - shard-lnl:          NOTRUN -> [SKIP][46] ([Intel XE#1397])
>     [46]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14413/shard-lnl-5/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-downscaling@pipe-a-default-mode.html
> 
>    * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling:
>      - shard-lnl:          NOTRUN -> [SKIP][47] ([Intel XE#1401] / [Intel XE#1745]) +1 other test skip
>     [47]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14413/shard-lnl-4/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling.html
>      - shard-bmg:          NOTRUN -> [SKIP][48] ([Intel XE#2293] / [Intel XE#2380])
>     [48]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14413/shard-bmg-7/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling.html
> 
>    * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling@pipe-a-default-mode:
>      - shard-lnl:          NOTRUN -> [SKIP][49] ([Intel XE#1401]) +1 other test skip
>     [49]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14413/shard-lnl-4/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling@pipe-a-default-mode.html
> 
>    * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling@pipe-a-valid-mode:
>      - shard-bmg:          NOTRUN -> [SKIP][50] ([Intel XE#2293])
>     [50]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14413/shard-bmg-7/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling@pipe-a-valid-mode.html
> 
>    * igt@kms_force_connector_basic@prune-stale-modes:
>      - shard-lnl:          NOTRUN -> [SKIP][51] ([Intel XE#352])
>     [51]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14413/shard-lnl-3/igt@kms_force_connector_basic@prune-stale-modes.html
> 
>    * igt@kms_frontbuffer_tracking@drrs-1p-offscreen-pri-shrfb-draw-mmap-wc:
>      - shard-lnl:          NOTRUN -> [SKIP][52] ([Intel XE#6312])
>     [52]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14413/shard-lnl-1/igt@kms_frontbuffer_tracking@drrs-1p-offscreen-pri-shrfb-draw-mmap-wc.html
> 
>    * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-draw-render:
>      - shard-bmg:          NOTRUN -> [SKIP][53] ([Intel XE#2311]) +10 other tests skip
>     [53]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14413/shard-bmg-10/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-draw-render.html
> 
>    * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-blt:
>      - shard-lnl:          NOTRUN -> [SKIP][54] ([Intel XE#656]) +17 other tests skip
>     [54]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14413/shard-lnl-4/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-blt.html
> 
>    * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-blt:
>      - shard-bmg:          NOTRUN -> [SKIP][55] ([Intel XE#4141]) +6 other tests skip
>     [55]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14413/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-blt.html
> 
>    * igt@kms_frontbuffer_tracking@fbc-argb161616f-draw-blt:
>      - shard-bmg:          NOTRUN -> [SKIP][56] ([Intel XE#7061]) +2 other tests skip
>     [56]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14413/shard-bmg-8/igt@kms_frontbuffer_tracking@fbc-argb161616f-draw-blt.html
> 
>    * igt@kms_frontbuffer_tracking@fbc-tiling-y:
>      - shard-bmg:          NOTRUN -> [SKIP][57] ([Intel XE#2352])
>     [57]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14413/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-tiling-y.html
> 
>    * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-blt:
>      - shard-lnl:          NOTRUN -> [SKIP][58] ([Intel XE#651]) +6 other tests skip
>     [58]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14413/shard-lnl-3/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-blt.html
> 
>    * igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-render:
>      - shard-bmg:          NOTRUN -> [SKIP][59] ([Intel XE#2313]) +13 other tests skip
>     [59]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14413/shard-bmg-8/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-render.html
> 
>    * igt@kms_frontbuffer_tracking@psr-abgr161616f-draw-blt:
>      - shard-lnl:          NOTRUN -> [SKIP][60] ([Intel XE#7061]) +4 other tests skip
>     [60]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14413/shard-lnl-2/igt@kms_frontbuffer_tracking@psr-abgr161616f-draw-blt.html
> 
>    * igt@kms_joiner@basic-max-non-joiner:
>      - shard-bmg:          NOTRUN -> [SKIP][61] ([Intel XE#4298])
>     [61]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14413/shard-bmg-2/igt@kms_joiner@basic-max-non-joiner.html
> 
>    * igt@kms_joiner@invalid-modeset-big-joiner:
>      - shard-lnl:          NOTRUN -> [SKIP][62] ([Intel XE#6901])
>     [62]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14413/shard-lnl-2/igt@kms_joiner@invalid-modeset-big-joiner.html
> 
>    * igt@kms_plane_multiple@2x-tiling-y:
>      - shard-lnl:          NOTRUN -> [SKIP][63] ([Intel XE#4596])
>     [63]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14413/shard-lnl-7/igt@kms_plane_multiple@2x-tiling-y.html
> 
>    * igt@kms_pm_backlight@basic-brightness:
>      - shard-bmg:          NOTRUN -> [SKIP][64] ([Intel XE#870])
>     [64]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14413/shard-bmg-7/igt@kms_pm_backlight@basic-brightness.html
> 
>    * igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-exceed-fully-sf:
>      - shard-bmg:          NOTRUN -> [SKIP][65] ([Intel XE#1406] / [Intel XE#1489]) +2 other tests skip
>     [65]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14413/shard-bmg-8/igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-exceed-fully-sf.html
> 
>    * igt@kms_psr2_sf@fbc-pr-plane-move-sf-dmg-area:
>      - shard-lnl:          NOTRUN -> [SKIP][66] ([Intel XE#1406] / [Intel XE#2893])
>     [66]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14413/shard-lnl-1/igt@kms_psr2_sf@fbc-pr-plane-move-sf-dmg-area.html
> 
>    * igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-continuous-sf:
>      - shard-lnl:          NOTRUN -> [SKIP][67] ([Intel XE#1406] / [Intel XE#2893] / [Intel XE#4608])
>     [67]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14413/shard-lnl-1/igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-continuous-sf.html
> 
>    * igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-continuous-sf@pipe-b-edp-1:
>      - shard-lnl:          NOTRUN -> [SKIP][68] ([Intel XE#1406] / [Intel XE#4608]) +1 other test skip
>     [68]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14413/shard-lnl-1/igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-continuous-sf@pipe-b-edp-1.html
> 
>    * igt@kms_psr@pr-cursor-plane-move:
>      - shard-lnl:          NOTRUN -> [SKIP][69] ([Intel XE#1406])
>     [69]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14413/shard-lnl-7/igt@kms_psr@pr-cursor-plane-move.html
>      - shard-bmg:          NOTRUN -> [SKIP][70] ([Intel XE#1406] / [Intel XE#2234] / [Intel XE#2850]) +3 other tests skip
>     [70]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14413/shard-bmg-2/igt@kms_psr@pr-cursor-plane-move.html
> 
>    * igt@kms_rotation_crc@primary-rotation-90:
>      - shard-lnl:          NOTRUN -> [SKIP][71] ([Intel XE#3414] / [Intel XE#3904])
>     [71]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14413/shard-lnl-5/igt@kms_rotation_crc@primary-rotation-90.html
>      - shard-bmg:          NOTRUN -> [SKIP][72] ([Intel XE#3414] / [Intel XE#3904])
>     [72]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14413/shard-bmg-9/igt@kms_rotation_crc@primary-rotation-90.html
> 
>    * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0:
>      - shard-lnl:          NOTRUN -> [SKIP][73] ([Intel XE#1127])
>     [73]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14413/shard-lnl-2/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html
>      - shard-bmg:          NOTRUN -> [SKIP][74] ([Intel XE#2330])
>     [74]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14413/shard-bmg-8/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html
> 
>    * igt@kms_setmode@basic-clone-single-crtc:
>      - shard-bmg:          NOTRUN -> [SKIP][75] ([Intel XE#1435])
>     [75]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14413/shard-bmg-4/igt@kms_setmode@basic-clone-single-crtc.html
> 
>    * igt@kms_setmode@basic@pipe-b-edp-1:
>      - shard-lnl:          [PASS][76] -> [FAIL][77] ([Intel XE#6361]) +2 other tests fail
>     [76]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8716/shard-lnl-1/igt@kms_setmode@basic@pipe-b-edp-1.html
>     [77]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14413/shard-lnl-1/igt@kms_setmode@basic@pipe-b-edp-1.html
> 
>    * igt@kms_setmode@clone-exclusive-crtc:
>      - shard-lnl:          NOTRUN -> [SKIP][78] ([Intel XE#1435])
>     [78]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14413/shard-lnl-5/igt@kms_setmode@clone-exclusive-crtc.html
> 
>    * igt@kms_sharpness_filter@filter-tap:
>      - shard-bmg:          NOTRUN -> [SKIP][79] ([Intel XE#6503])
>     [79]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14413/shard-bmg-4/igt@kms_sharpness_filter@filter-tap.html
> 
>    * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
>      - shard-bmg:          NOTRUN -> [SKIP][80] ([Intel XE#2426])
>     [80]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14413/shard-bmg-9/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
> 
>    * igt@kms_tv_load_detect@load-detect:
>      - shard-lnl:          NOTRUN -> [SKIP][81] ([Intel XE#330])
>     [81]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14413/shard-lnl-3/igt@kms_tv_load_detect@load-detect.html
>      - shard-bmg:          NOTRUN -> [SKIP][82] ([Intel XE#2450])
>     [82]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14413/shard-bmg-1/igt@kms_tv_load_detect@load-detect.html
> 
>    * igt@kms_vrr@cmrr:
>      - shard-bmg:          NOTRUN -> [SKIP][83] ([Intel XE#2168])
>     [83]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14413/shard-bmg-2/igt@kms_vrr@cmrr.html
> 
>    * igt@kms_vrr@cmrr@pipe-a-edp-1:
>      - shard-lnl:          NOTRUN -> [FAIL][84] ([Intel XE#4459]) +1 other test fail
>     [84]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14413/shard-lnl-7/igt@kms_vrr@cmrr@pipe-a-edp-1.html
> 
>    * igt@xe_create@multigpu-create-massive-size:
>      - shard-lnl:          NOTRUN -> [SKIP][85] ([Intel XE#944])
>     [85]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14413/shard-lnl-3/igt@xe_create@multigpu-create-massive-size.html
> 
>    * igt@xe_eudebug@basic-client:
>      - shard-lnl:          NOTRUN -> [SKIP][86] ([Intel XE#4837]) +2 other tests skip
>     [86]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14413/shard-lnl-4/igt@xe_eudebug@basic-client.html
> 
>    * igt@xe_eudebug@basic-read-event:
>      - shard-bmg:          NOTRUN -> [SKIP][87] ([Intel XE#4837]) +3 other tests skip
>     [87]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14413/shard-bmg-2/igt@xe_eudebug@basic-read-event.html
> 
>    * igt@xe_eudebug_online@writes-caching-sram-bb-vram-target-sram:
>      - shard-lnl:          NOTRUN -> [SKIP][88] ([Intel XE#4837] / [Intel XE#6665]) +1 other test skip
>     [88]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14413/shard-lnl-5/igt@xe_eudebug_online@writes-caching-sram-bb-vram-target-sram.html
> 
>    * igt@xe_eudebug_online@writes-caching-vram-bb-vram-target-sram:
>      - shard-bmg:          NOTRUN -> [SKIP][89] ([Intel XE#4837] / [Intel XE#6665]) +3 other tests skip
>     [89]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14413/shard-bmg-4/igt@xe_eudebug_online@writes-caching-vram-bb-vram-target-sram.html
> 
>    * igt@xe_evict@evict-small-cm:
>      - shard-lnl:          NOTRUN -> [SKIP][90] ([Intel XE#688])
>     [90]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14413/shard-lnl-3/igt@xe_evict@evict-small-cm.html
> 
>    * igt@xe_evict@evict-small-multi-queue-priority-cm:
>      - shard-bmg:          NOTRUN -> [SKIP][91] ([Intel XE#7140])
>     [91]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14413/shard-bmg-8/igt@xe_evict@evict-small-multi-queue-priority-cm.html
> 
>    * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-rebind:
>      - shard-bmg:          NOTRUN -> [SKIP][92] ([Intel XE#2322]) +4 other tests skip
>     [92]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14413/shard-bmg-10/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-rebind.html
> 
>    * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr:
>      - shard-lnl:          NOTRUN -> [SKIP][93] ([Intel XE#1392]) +4 other tests skip
>     [93]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14413/shard-lnl-7/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr.html
> 
>    * igt@xe_exec_basic@no-exec-userptr-invalidate:
>      - shard-lnl:          [PASS][94] -> [DMESG-WARN][95] ([Intel XE#4537] / [Intel XE#7063]) +1 other test dmesg-warn
>     [94]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8716/shard-lnl-3/igt@xe_exec_basic@no-exec-userptr-invalidate.html
>     [95]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14413/shard-lnl-8/igt@xe_exec_basic@no-exec-userptr-invalidate.html
> 
>    * igt@xe_exec_fault_mode@once-multi-queue-userptr-invalidate-race-prefetch:
>      - shard-bmg:          NOTRUN -> [SKIP][96] ([Intel XE#7136]) +3 other tests skip
>     [96]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14413/shard-bmg-7/igt@xe_exec_fault_mode@once-multi-queue-userptr-invalidate-race-prefetch.html
> 
>    * igt@xe_exec_fault_mode@twice-multi-queue-invalid-fault:
>      - shard-lnl:          NOTRUN -> [SKIP][97] ([Intel XE#7136]) +6 other tests skip
>     [97]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14413/shard-lnl-8/igt@xe_exec_fault_mode@twice-multi-queue-invalid-fault.html
> 
>    * igt@xe_exec_multi_queue@many-queues-preempt-mode-fault-userptr-invalidate:
>      - shard-lnl:          NOTRUN -> [SKIP][98] ([Intel XE#6874]) +8 other tests skip
>     [98]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14413/shard-lnl-8/igt@xe_exec_multi_queue@many-queues-preempt-mode-fault-userptr-invalidate.html
> 
>    * igt@xe_exec_multi_queue@max-queues-preempt-mode-basic-smem:
>      - shard-bmg:          NOTRUN -> [SKIP][99] ([Intel XE#6874]) +13 other tests skip
>     [99]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14413/shard-bmg-10/igt@xe_exec_multi_queue@max-queues-preempt-mode-basic-smem.html
> 
>    * igt@xe_exec_system_allocator@many-64k-mmap-free-huge:
>      - shard-lnl:          NOTRUN -> [SKIP][100] ([Intel XE#5007]) +1 other test skip
>     [100]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14413/shard-lnl-5/igt@xe_exec_system_allocator@many-64k-mmap-free-huge.html
> 
>    * igt@xe_exec_system_allocator@many-64k-mmap-new-huge-nomemset:
>      - shard-bmg:          NOTRUN -> [SKIP][101] ([Intel XE#5007])
>     [101]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14413/shard-bmg-7/igt@xe_exec_system_allocator@many-64k-mmap-new-huge-nomemset.html
> 
>    * igt@xe_exec_system_allocator@many-large-execqueues-mmap-huge-nomemset:
>      - shard-lnl:          NOTRUN -> [SKIP][102] ([Intel XE#4943]) +8 other tests skip
>     [102]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14413/shard-lnl-2/igt@xe_exec_system_allocator@many-large-execqueues-mmap-huge-nomemset.html
> 
>    * igt@xe_exec_system_allocator@many-stride-new-prefetch:
>      - shard-bmg:          NOTRUN -> [INCOMPLETE][103] ([Intel XE#7098])
>     [103]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14413/shard-bmg-10/igt@xe_exec_system_allocator@many-stride-new-prefetch.html
> 
>    * igt@xe_exec_system_allocator@threads-many-stride-mmap-new-huge:
>      - shard-bmg:          NOTRUN -> [SKIP][104] ([Intel XE#4943]) +7 other tests skip
>     [104]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14413/shard-bmg-9/igt@xe_exec_system_allocator@threads-many-stride-mmap-new-huge.html
> 
>    * igt@xe_exec_system_allocator@threads-shared-vm-many-stride-mmap-remap-eocheck:
>      - shard-lnl:          [PASS][105] -> [DMESG-WARN][106] ([Intel XE#7063]) +15 other tests dmesg-warn
>     [105]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8716/shard-lnl-4/igt@xe_exec_system_allocator@threads-shared-vm-many-stride-mmap-remap-eocheck.html
>     [106]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14413/shard-lnl-8/igt@xe_exec_system_allocator@threads-shared-vm-many-stride-mmap-remap-eocheck.html
> 
>    * igt@xe_exec_threads@threads-multi-queue-mixed-fd-userptr-invalidate:
>      - shard-lnl:          NOTRUN -> [SKIP][107] ([Intel XE#7138]) +3 other tests skip
>     [107]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14413/shard-lnl-3/igt@xe_exec_threads@threads-multi-queue-mixed-fd-userptr-invalidate.html
>      - shard-bmg:          NOTRUN -> [SKIP][108] ([Intel XE#7138]) +1 other test skip
>     [108]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14413/shard-bmg-4/igt@xe_exec_threads@threads-multi-queue-mixed-fd-userptr-invalidate.html
> 
>    * igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv:
>      - shard-bmg:          NOTRUN -> [ABORT][109] ([Intel XE#5466])
>     [109]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14413/shard-bmg-10/igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv.html
> 
>    * igt@xe_multigpu_svm@mgpu-atomic-op-conflict:
>      - shard-bmg:          NOTRUN -> [SKIP][110] ([Intel XE#6964]) +2 other tests skip
>     [110]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14413/shard-bmg-8/igt@xe_multigpu_svm@mgpu-atomic-op-conflict.html
> 
>    * igt@xe_multigpu_svm@mgpu-migration-prefetch:
>      - shard-lnl:          NOTRUN -> [SKIP][111] ([Intel XE#6964])
>     [111]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14413/shard-lnl-4/igt@xe_multigpu_svm@mgpu-migration-prefetch.html
> 
>    * igt@xe_pm@d3cold-mocs:
>      - shard-bmg:          NOTRUN -> [SKIP][112] ([Intel XE#2284])
>     [112]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14413/shard-bmg-1/igt@xe_pm@d3cold-mocs.html
> 
>    * igt@xe_pm@d3hot-i2c:
>      - shard-bmg:          NOTRUN -> [SKIP][113] ([Intel XE#5742])
>     [113]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14413/shard-bmg-7/igt@xe_pm@d3hot-i2c.html
> 
>    * igt@xe_pm@s3-mocs:
>      - shard-lnl:          NOTRUN -> [SKIP][114] ([Intel XE#584])
>     [114]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14413/shard-lnl-7/igt@xe_pm@s3-mocs.html
> 
>    * igt@xe_pxp@pxp-stale-bo-exec-post-rpm:
>      - shard-bmg:          NOTRUN -> [SKIP][115] ([Intel XE#4733])
>     [115]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14413/shard-bmg-10/igt@xe_pxp@pxp-stale-bo-exec-post-rpm.html
> 
>    * igt@xe_sriov_vram@vf-access-after-resize-up:
>      - shard-lnl:          NOTRUN -> [SKIP][116] ([Intel XE#6376])
>     [116]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14413/shard-lnl-2/igt@xe_sriov_vram@vf-access-after-resize-up.html
> 
>    
> #### Possible fixes ####
> 
>    * igt@intel_hwmon@hwmon-write:
>      - shard-bmg:          [FAIL][117] ([Intel XE#4665]) -> [PASS][118]
>     [117]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8716/shard-bmg-3/igt@intel_hwmon@hwmon-write.html
>     [118]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14413/shard-bmg-1/igt@intel_hwmon@hwmon-write.html
> 
>    * igt@kms_cursor_legacy@flip-vs-cursor-atomic:
>      - shard-bmg:          [FAIL][119] ([Intel XE#6715]) -> [PASS][120]
>     [119]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8716/shard-bmg-2/igt@kms_cursor_legacy@flip-vs-cursor-atomic.html
>     [120]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14413/shard-bmg-4/igt@kms_cursor_legacy@flip-vs-cursor-atomic.html
> 
>    * igt@kms_flip@flip-vs-expired-vblank@b-edp1:
>      - shard-lnl:          [FAIL][121] ([Intel XE#301]) -> [PASS][122] +1 other test pass
>     [121]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8716/shard-lnl-2/igt@kms_flip@flip-vs-expired-vblank@b-edp1.html
>     [122]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14413/shard-lnl-4/igt@kms_flip@flip-vs-expired-vblank@b-edp1.html
> 
>    * igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-onoff:
>      - shard-lnl:          [DMESG-WARN][123] ([Intel XE#7063]) -> [PASS][124] +2 other tests pass
>     [123]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8716/shard-lnl-4/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-onoff.html
>     [124]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14413/shard-lnl-3/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-onoff.html
> 
>    * igt@kms_pm_dc@dc5-dpms:
>      - shard-lnl:          [FAIL][125] ([Intel XE#718]) -> [PASS][126]
>     [125]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8716/shard-lnl-5/igt@kms_pm_dc@dc5-dpms.html
>     [126]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14413/shard-lnl-4/igt@kms_pm_dc@dc5-dpms.html
> 
>    * igt@kms_sharpness_filter@invalid-plane-with-filter@pipe-a-edp-1-invalid-plane-with-filter:
>      - shard-lnl:          [DMESG-WARN][127] ([Intel XE#4537]) -> [PASS][128] +1 other test pass
>     [127]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8716/shard-lnl-3/igt@kms_sharpness_filter@invalid-plane-with-filter@pipe-a-edp-1-invalid-plane-with-filter.html
>     [128]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14413/shard-lnl-4/igt@kms_sharpness_filter@invalid-plane-with-filter@pipe-a-edp-1-invalid-plane-with-filter.html
> 
>    * igt@kms_vrr@seamless-rr-switch-virtual@pipe-a-edp-1:
>      - shard-lnl:          [FAIL][129] ([Intel XE#2142]) -> [PASS][130] +1 other test pass
>     [129]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8716/shard-lnl-4/igt@kms_vrr@seamless-rr-switch-virtual@pipe-a-edp-1.html
>     [130]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14413/shard-lnl-5/igt@kms_vrr@seamless-rr-switch-virtual@pipe-a-edp-1.html
> 
>    * igt@xe_exec_reset@gt-reset-stress:
>      - shard-lnl:          [DMESG-WARN][131] ([Intel XE#7023]) -> [PASS][132]
>     [131]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8716/shard-lnl-4/igt@xe_exec_reset@gt-reset-stress.html
>     [132]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14413/shard-lnl-8/igt@xe_exec_reset@gt-reset-stress.html
> 
>    * igt@xe_exec_system_allocator@threads-many-execqueues-new:
>      - shard-bmg:          [ABORT][133] -> [PASS][134]
>     [133]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8716/shard-bmg-3/igt@xe_exec_system_allocator@threads-many-execqueues-new.html
>     [134]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14413/shard-bmg-1/igt@xe_exec_system_allocator@threads-many-execqueues-new.html
> 
>    * igt@xe_pm@s2idle-d3hot-basic-exec:
>      - shard-lnl:          [ABORT][135] -> [PASS][136]
>     [135]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8716/shard-lnl-4/igt@xe_pm@s2idle-d3hot-basic-exec.html
>     [136]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14413/shard-lnl-7/igt@xe_pm@s2idle-d3hot-basic-exec.html
> 
>    
>    [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
>    [Intel XE#1125]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1125
>    [Intel XE#1127]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127
>    [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
>    [Intel XE#1397]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1397
>    [Intel XE#1401]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401
>    [Intel XE#1406]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
>    [Intel XE#1407]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1407
>    [Intel XE#1421]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421
>    [Intel XE#1424]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424
>    [Intel XE#1435]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435
>    [Intel XE#1468]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1468
>    [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
>    [Intel XE#1745]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745
>    [Intel XE#2142]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2142
>    [Intel XE#2168]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2168
>    [Intel XE#2191]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191
>    [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
>    [Intel XE#2244]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244
>    [Intel XE#2252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252
>    [Intel XE#2284]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284
>    [Intel XE#2293]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293
>    [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
>    [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
>    [Intel XE#2321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321
>    [Intel XE#2322]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322
>    [Intel XE#2325]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325
>    [Intel XE#2327]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327
>    [Intel XE#2330]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2330
>    [Intel XE#2341]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341
>    [Intel XE#2352]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2352
>    [Intel XE#2380]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380
>    [Intel XE#2390]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2390
>    [Intel XE#2426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426
>    [Intel XE#2450]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2450
>    [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
>    [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
>    [Intel XE#2893]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2893
>    [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
>    [Intel XE#306]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/306
>    [Intel XE#307]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/307
>    [Intel XE#309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/309
>    [Intel XE#3149]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149
>    [Intel XE#330]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/330
>    [Intel XE#3414]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414
>    [Intel XE#3432]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432
>    [Intel XE#352]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/352
>    [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
>    [Intel XE#3904]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904
>    [Intel XE#4141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141
>    [Intel XE#4156]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4156
>    [Intel XE#4298]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4298
>    [Intel XE#4331]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4331
>    [Intel XE#4459]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4459
>    [Intel XE#4537]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4537
>    [Intel XE#4596]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4596
>    [Intel XE#4608]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4608
>    [Intel XE#4665]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4665
>    [Intel XE#4733]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733
>    [Intel XE#4837]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837
>    [Intel XE#4943]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4943
>    [Intel XE#5007]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5007
>    [Intel XE#5299]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5299
>    [Intel XE#5354]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5354
>    [Intel XE#5466]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5466
>    [Intel XE#5742]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5742
>    [Intel XE#584]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/584
>    [Intel XE#610]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/610
>    [Intel XE#6312]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6312
>    [Intel XE#6361]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6361
>    [Intel XE#6376]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6376
>    [Intel XE#6503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6503
>    [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
>    [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
>    [Intel XE#6665]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6665
>    [Intel XE#6715]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6715
>    [Intel XE#6874]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6874
>    [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
>    [Intel XE#6901]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6901
>    [Intel XE#6964]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6964
>    [Intel XE#6968]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6968
>    [Intel XE#6974]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6974
>    [Intel XE#7023]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7023
>    [Intel XE#7059]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7059
>    [Intel XE#7061]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061
>    [Intel XE#7063]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7063
>    [Intel XE#7098]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7098
>    [Intel XE#7136]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7136
>    [Intel XE#7138]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7138
>    [Intel XE#7140]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7140
>    [Intel XE#718]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/718
>    [Intel XE#870]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/870
>    [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
> 
> 
> Build changes
> -------------
> 
>    * IGT: IGT_8716 -> IGTPW_14413
> 
>    IGTPW_14413: 14413
>    IGT_8716: 8716
>    xe-4442-ab42b1c3fe4ce1ae5534c51b880d3a97e6bba145: ab42b1c3fe4ce1ae5534c51b880d3a97e6bba145
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14413/index.html
> 

