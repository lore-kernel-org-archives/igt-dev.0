Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8EAEC2A062
	for <igt-dev@archiver.kernel.org>; Mon,  5 Jan 2026 08:15:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C6F810E088;
	Mon,  5 Jan 2026 08:15:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KHxn6jkl";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3067310E088
 for <igt-dev@lists.freedesktop.org>; Mon,  5 Jan 2026 08:15:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1767600906; x=1799136906;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=9ekJP5Ls1nt3D349nW63EMAUtelCFctufKNQptHrCRw=;
 b=KHxn6jklFw1xkzANfsNpfV+MVRoblq39qcTUAmCRODQPIDCrsOXfHorR
 Vnkw+BLORkzG405+TSRwkT0DtJXmdnz5CJjDTn4FvuaKodKwEm3oByPUM
 s4OBGe1r6gCUc2FKGOYF8b/9grAVwTACH7F2pzP/syO9t57aeBEczW8Sf
 ezqOxivf+zOj7rb19pXTuHo8n73jWpR+sFyY5y5TLdBhDMSyewfe4/KhA
 vrFzHJZrYSMbYbF9hCAcJArVcwgBvhepnG/AgdQP0hbQJEUO/eHqpi3bP
 93TuUCSMi6l4ceKuEgZ2QAXkbjFp/nSFcLLO7lCrmDqeNvkpP6AYLGnCn Q==;
X-CSE-ConnectionGUID: q7TeyTvPTtqrJ0y3Gq2Rjw==
X-CSE-MsgGUID: JwDbFInJSneMUVyQWtMJ+g==
X-IronPort-AV: E=McAfee;i="6800,10657,11661"; a="69016415"
X-IronPort-AV: E=Sophos;i="6.21,203,1763452800"; d="scan'208";a="69016415"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jan 2026 00:15:05 -0800
X-CSE-ConnectionGUID: s3UwN51qTgG8kU1UXTPT2w==
X-CSE-MsgGUID: 9kKtgth9S6+4KFiG4uVFsw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,203,1763452800"; d="scan'208";a="203307093"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jan 2026 00:15:03 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 5 Jan 2026 00:15:03 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Mon, 5 Jan 2026 00:15:03 -0800
Received: from SJ2PR03CU001.outbound.protection.outlook.com (52.101.43.28) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 5 Jan 2026 00:15:03 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PyQgLwT+Otb7lRB8B9IPLsKPD9KaLucOdibmvbZlhHWAXExs0mi5DZZMVluwDo5fbyNGqRV3qcyqWc46+SSf9xntosSKMXmMihlc9STdYlqic44msN/B6OXZxpLIre89OUfweEjlq55oNxwmEDz7RD72AH37UoBXOG3SleJFNGhk8MG1A4FjsjAZmF4khoJ0W/VNyrWxMEZ9Qv1UfRKZ4uIKGnntzATF2iJc8MwLALmmcMPeyGghLqjvQ3XW88REmYlM3ciqakbwjqU8S7MGJFY67UX7pru3BOYvf9Mrn2p0Q/V3Q1g27XqetJkBeup1KR5X/Hw1S5kGVAhNCVkx8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6/O34wFrd41hho48AnZYTUG1VyJdPrbEk6uGdjfzrc4=;
 b=PmyLFN2gp99IFLbA41uXGgduEPpH19WYwHqci6bP7So+K7KDhVFbpxhq/BRple9kVyDcEntH5tfAqZXjmffDhv1tYzJGNYSYw4GQZzfJ22ZK3kzZ3fVcLxLWFrICBWIHnFi5b+3Egp1nN+gotmXWfyu7jHaFeDyd9zpb2BFyneabQ1zHq7b2i/sODJKnTUg0G+KygRmE5YC0VUdNM75QitBFvkRHmx5xvEJVXtODbKXbjIx9UTcwj0I09L6L5MQdkHSzV5c/UFNEIKZ1sgBe8jEBX28QCFmftzC3DpBnLqHWm/bPyc/3sx0ZGhtr4hs7dHxW7gvsvKLCCyOls+0OrA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN0PR11MB5694.namprd11.prod.outlook.com (2603:10b6:408:167::10)
 by CY8PR11MB6962.namprd11.prod.outlook.com (2603:10b6:930:59::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9478.4; Mon, 5 Jan
 2026 08:15:01 +0000
Received: from BN0PR11MB5694.namprd11.prod.outlook.com
 ([fe80::cf04:8739:e8a6:ac3a]) by BN0PR11MB5694.namprd11.prod.outlook.com
 ([fe80::cf04:8739:e8a6:ac3a%7]) with mapi id 15.20.9478.004; Mon, 5 Jan 2026
 08:15:01 +0000
Message-ID: <a9f71d1e-ecbb-43e1-acb7-09f33e1d0196@intel.com>
Date: Mon, 5 Jan 2026 13:44:52 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t] intel-ci: Update LNL/BMG display blocklist
To: Jeevan B <jeevan.b@intel.com>, <igt-dev@lists.freedesktop.org>
CC: <kunal1.joshi@intel.com>
References: <20260105080801.27307-1-jeevan.b@intel.com>
Content-Language: en-US
From: Karthik B S <karthik.b.s@intel.com>
In-Reply-To: <20260105080801.27307-1-jeevan.b@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5PR01CA0003.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:174::13) To BN0PR11MB5694.namprd11.prod.outlook.com
 (2603:10b6:408:167::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN0PR11MB5694:EE_|CY8PR11MB6962:EE_
X-MS-Office365-Filtering-Correlation-Id: dc96bf4c-4dd7-43c0-4ebf-08de4c328548
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0; ARA:13230040|376014|1800799024|366016|42112799006;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?YjN5RUUxcWVoajkzdWhFVmtCQUFGQWc4aVJDY2xoZjViamtYbk1oNDJvUUV4?=
 =?utf-8?B?bG40SFdxUllCZjJpUC9QZzgyYTBnd2c2RnRKS25hQWhBVnZWcWl5L0FwcDF3?=
 =?utf-8?B?Sjh0TDF6R2Q0anZaMWVJQm1lZmJmSkFuVHdWYWxyYkwzRXVBbVFZZmJCVC9o?=
 =?utf-8?B?andhOE1OdzlDMU1wR3J0UmN3MDlFOURUZGJURU9WQVRTUTBDc2c2d0JKVWZs?=
 =?utf-8?B?QTRndGs5NHRFZUx1cWIvOG1ZR1hneFRUcHR4SVh4WnBMZmQ3U0p4Tk1xQzND?=
 =?utf-8?B?cVFVT3B4NUNOYnhYR0tkT2FoVzJueTFLdFJ6bUIvY3pscEVSS2VIOW9aZk5s?=
 =?utf-8?B?blVTUDFFQnFwZ0UycW9kMXQ3MlB4VjdRMEswV1NMbmUyTzZxalRyVmpCVnNl?=
 =?utf-8?B?YU5DZjkvZHBwbjB2eGFTMm5DaVFGNzhxc1VzczIyeTZ1MUI1Rjk4ZkRZbW4x?=
 =?utf-8?B?SFhVSmREQlVHTDlYUWVGRjhxSGg5bEFmbHpuSVRaRWk4aW5keVdZOXQ2RTM1?=
 =?utf-8?B?QWkwY2tXd2tMOUg2Q1l6UW9JNjgrbFBlV3BkWTZHYmNTcG5pT1JFUW9qSUhR?=
 =?utf-8?B?RnFYTjkrVGxuV3ZkNDAwMytYYWJaR1RrNkprT0FhdjNmczNNZXFrMlI2K1dH?=
 =?utf-8?B?RFV1ejJNUlFrclFvT0dqNUtyNTNiVjFXcCt3RndQOGxIaUpvU1FvNGxxV1Na?=
 =?utf-8?B?R1V2L2EzcWR5NVFyWGcxdjY4ZGV0bHIrcjhQV2xhZnJ1ZGxyQUsrU2tlcXh5?=
 =?utf-8?B?dS83WDYyOG9HempITGYrQnQwSXBtbmNkNWZzeThrSnVYVVZ4RjJpZXYzSHVS?=
 =?utf-8?B?S3kwMDNNcTdWdFJTQ2xobmZtOHZoM3hYUnNzMWQyN0NMa3NLV0l6aGUyS1dw?=
 =?utf-8?B?c1ZHTFJyQWVuNlpoU2hVVC9oQkVtc0RZSm5vOTZmeXFMTWV3SWV6OHNHZW1i?=
 =?utf-8?B?OE5aWG1nVTdEeVoxb3doWjhlU0R2QUFFcEYvcTF3Q1RDTkhjTFFQeENBSVcz?=
 =?utf-8?B?UGowTGZ3cVc5UWFFcnF1cEVadjlwWG0venMxNUs5ZDQ3dy9VT0FibDlONFdz?=
 =?utf-8?B?Tkd4NlhkRDI5QWFJdXZidENQcHliVGxDalRTQVlrVGQ4TlRrblhHbUJKNnAy?=
 =?utf-8?B?UG1Rd3BVc0RaTWZVMlFXS3JKbHFRZGtWTFQvWE5OcjdhOHZuM2JhYjlCTW01?=
 =?utf-8?B?YmN4NXIrNFk1MWNHM0YxU2dzaVdQVnhYYmYyZGluamJ0MjQ3YmRsNCtuVkh4?=
 =?utf-8?B?Sk5kR2VvZEZvZEZYZzkwNjZKZUk3UkNwL01PaDl6OXdYdTEzL21lbjE2cmZs?=
 =?utf-8?B?b3B0SVFoR2VyUjI3TXNiSzdadE02dnBtYXkya3hDdDVodDl2T2ZQZGp6MG9z?=
 =?utf-8?B?SnhOM2szdTlpTzRIaTFJanJEUzFSY2RxWUJGcEVKS2dlT2ErOEN6UG1rckUr?=
 =?utf-8?B?U1FWYURkUEFPdzg3S1NhbEtmUGRIT1hqSUlxRklzbFZLQXViYzZrWkVIdUtU?=
 =?utf-8?B?Wm0rYVlvZVgwOTJUblg2bVluU1o0SzUrQnh1cjllbGdxSWQ0ZkJjdmJGUHJV?=
 =?utf-8?B?blFqV28yM2l2YmMvZHFMUHIvVnAvckk2eUxMVnZWdWd0SHZhZ21HdDZ5NTVX?=
 =?utf-8?B?M2daaXdkd2VtaHMxbnhQMGorZ2JIV3dRRU54VDRQUkh1L21VUDViWmZmNzR4?=
 =?utf-8?B?Y1ZmeThwT0xFSDlNc0hxWCs2Nlh1Sm5WQWkwR29LTVIrM2ZJQXhEUVRmMWhW?=
 =?utf-8?B?U3pURkpocjlKaUdWNXlBR3IwYkR5aXRGcy9TVG5NT1lHUzh6bTI0V09JdmxT?=
 =?utf-8?B?QzNtL2VxL1ZSaU80Zm9WdHFHeWNQTEpDVkJRYUduNkU0eU5rWmFuVkJORU9N?=
 =?utf-8?B?RXlZeWJkam0rMlZjdkV6ZEhWK3JYVldwL2ZiYVQzMVIwQTNjUERtQnlnMG9G?=
 =?utf-8?Q?9xCm7Spibi8l/cEWKKJkcOrPRTHePfuA?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN0PR11MB5694.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(42112799006); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cHF2Yy9VM0xXbG15Z2s2SGExS2RoQUxwWUdleHBGSFlxYkNsamI5M1pJbzBF?=
 =?utf-8?B?ZFlCckk0eEprQzNHK3FjeWVHN2FNK205bE1jcWdXVlJMN3RqcFFWQVVaVi9r?=
 =?utf-8?B?WmNsbUZDOWV4UktHUTVPRlhBalZ3SVdPODdIbjZBR0MrTUdXeEtNTVZJRDly?=
 =?utf-8?B?STZqazU2WVVYa05jRjVGQitqOWlyK3JoNTh0SHR2SWlVeVo4NnF5UFV0eVNT?=
 =?utf-8?B?TnJYb2Z3ZGZBOU5lbkUxK1c3VXJwc1M4SVl5djIxZUVmRHk0RXRUZTZIbHYv?=
 =?utf-8?B?b3g2dEhjNVo2TnoycGliL3ljUEJIUEs3ZXlZWmVMZ3VET1BTR0VXZkY0M0ty?=
 =?utf-8?B?aTBVbldFODVYTGp1UWNtZWliZmJqNlQxVXFPWE1KZk5haVhzNjhNUHZ3V05E?=
 =?utf-8?B?NFREQ2xBSCttQWdMQVZzdE1vRjBUYnoya2YvOThYNlcwazNEWW9mTlV4Wm1t?=
 =?utf-8?B?a0tPNGhaVU9HU05TQW5UcXZSNFRyaktwTlJ0NWc3cjNTa2lnRlhiTE9CSlJS?=
 =?utf-8?B?RWlrRzBKT2MvbCtTYWRUZUhya0ZaQkt0QWRweFBuZEQwWjg2YzNZa0lVZ1h0?=
 =?utf-8?B?K3lRd2U0WVB1L1A1cnREWWlISmxySXBOUEl6bHAyM1R5emVFaEt6TVEwNVJ4?=
 =?utf-8?B?UTIxTU5LY29XMEVFZERONHYrMmlscHFqL29KUmZjVEsrSzVqS0U5cFhNd0FF?=
 =?utf-8?B?WnYwamUwYXlKVUVQNVIyUlVEcmxhVTdMOHJ4enkyKzdpSEFJdUMreVpTNWtl?=
 =?utf-8?B?T1lkT1dQNG1lVldLb0srUU53RUYycGJFN2grdDk4TFlVeGV5SXJINkwwUlpR?=
 =?utf-8?B?a2FyYUpCUndTL2lUaHFPdHJCYVFiVmNzMlNDakNUU0pMZU5vcEMwL1JEWDNQ?=
 =?utf-8?B?VGRqejUvRDlhVG1DRXoxRGVrMlZjQ0ZXaFVXQi8zVG5JeWtsbExzOWYzWmJM?=
 =?utf-8?B?TmUzWC9wL1JRQkIxN2Y2L1lNMXJtQStzRGxyNVYxR0hIUU4xdXhOejFIMUU1?=
 =?utf-8?B?Y2NudUczdEFBcEhDT1I4Vnh4VTZmamVITzIrdW5jTFh1VkwxZ044YXRLUGhO?=
 =?utf-8?B?ZVluTHFpVytLbm1BYVFqSkM1ZHNuc0xaS0NXcFpLRzh2Nk5QcXRoL0hFOXBB?=
 =?utf-8?B?Y0c5eXd4alkyd0szZk1yUE5aNzY1T1QvSXl2OU5LWkNRU0F0SHFKcmhyVGx2?=
 =?utf-8?B?NlBGTXkxaFk5eVQ4NzVkWitYYnZMUDN4NWVGSHN0bzRDQVYvc2hWNEpnUXpo?=
 =?utf-8?B?OXF3ZVRwdVFYeTBhTFh5bHF5ZGNkcWphTnZMcmozVStOa2lIN0JmL01Vc1ZI?=
 =?utf-8?B?TFJQcTRvQjF4dkhyL2VSWm9QQzBCR3Vub3JSMUJwb21heURQT2RYRjJ3ZkRY?=
 =?utf-8?B?K2N6RXVNdUVrWUI1T0JsYXNlcjlTb3h5UkZkZTJCLzVEV3hCVUxmMVBLSnl6?=
 =?utf-8?B?WGIvRmUvcXF5eWVvdUZmdmhhTzlNMlh4SW9uM2UvckZJZWpGMll3d0tnZ2tz?=
 =?utf-8?B?TlRBcjNkZ3hsc2ZIbVEzQ0FFNFkwaXU2Qk54RFMvWUNXWkFLSkVIQ2VmeWhi?=
 =?utf-8?B?SGdoQzZFZFRsajkxTlFHMmh2aDErK05vcS9Jb3VUWXZSbHFOSDdnNzRQMTgx?=
 =?utf-8?B?Z0RweWhMYmZBZFJkdEgwa1AzK2hTSEI1MldMN2hELzg4blZRbk5XU011UDdv?=
 =?utf-8?B?enM1bWtqWHRuZjl1VFdMNTM5UnIvTk9FNVdOL0dmRjhyWThBc1plOG9ZQ0gx?=
 =?utf-8?B?M3B0ZUJxa1QrajRkTlpwSFp0QVlpdW9ISWlKT21hWHkzMlU3SVRlWkxmQktP?=
 =?utf-8?B?RVZYNXJQT3laQjBzVEJ6V2hMNkp3TkNidjFXRHk5TmZ1S2VkSDZGTTZ6ZVpU?=
 =?utf-8?B?SWk0R0I4bDhwdEp3YXdOa1RsOEdqTTRBRWMwRkZHekw4VDlJVDVvT2E5M1dy?=
 =?utf-8?B?MGsvVGFaL25TTWVqZ3NNMnJIeGFHRnZlVmxGWG8yZ21GR0hjcEtEdVlXWk93?=
 =?utf-8?B?d2I1bk1EVDdJczhncVpNNVNiTDhkdlZYeUJ2OWs5S05DVnlsMDFBSC9ySXBW?=
 =?utf-8?B?V3k5NTdIV1gwcG5DMVh3V0l4M01IUDZsZDZzcWtHbWx4SDZNMFR4a1ZRY0o0?=
 =?utf-8?B?aHRaT0Z6bWY5K25jN3R6VVFaNnhDblloWXU2bnFrYU43dUo0dVRGYllOV2t6?=
 =?utf-8?B?aytyZmc1bStOUEdVMHg4YWVFRDdpUWpnZkdFVHVvZ3p1b2RkTk1ZUklodk0v?=
 =?utf-8?B?KzRzK1g4cTVGVmlEb1dzTXBiUnRSSSs1VTRGMk5IT2NjVDdybFJFc1BYL2kr?=
 =?utf-8?B?a0lVaDdlKzFYR1UvZnNiY3VkbElwcnFKalhxU3pIekJ0SnlQYUY0dz09?=
X-MS-Exchange-CrossTenant-Network-Message-Id: dc96bf4c-4dd7-43c0-4ebf-08de4c328548
X-MS-Exchange-CrossTenant-AuthSource: BN0PR11MB5694.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jan 2026 08:15:01.3337 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cTwJ6TiMlVRnD4mXHt74gkP2vOwwPymlgheBA4sgpLqI3bxVbljUh+yXE6A8ckcCWd3jOK15YgUQg37TeH0phg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB6962
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

Hi Jeevan,

On 1/5/2026 1:38 PM, Jeevan B wrote:
> Update y/yf tile kms_pipe_stress subtests to blocklist.
Nit: Update -> Add.
>
> Signed-off-by: Jeevan B <jeevan.b@intel.com>
> ---
>   tests/intel-ci/xe.bmg.display.blocklist.txt | 3 ++-
>   tests/intel-ci/xe.lnl.display.blocklist.txt | 2 ++
>   2 files changed, 4 insertions(+), 1 deletion(-)
>
> diff --git a/tests/intel-ci/xe.bmg.display.blocklist.txt b/tests/intel-ci/xe.bmg.display.blocklist.txt
> index d6af8e2b4..01084db1c 100644
> --- a/tests/intel-ci/xe.bmg.display.blocklist.txt
> +++ b/tests/intel-ci/xe.bmg.display.blocklist.txt
> @@ -10,7 +10,8 @@ igt@kms_(plane_lowres|frontbuffer_tracking|plane_multiple)@.*tiling-y.*
>   igt@kms_flip_scaled_crc@.*(yf|y)tile.*
>   igt@kms_async_flips@invalid-async-flip
>   igt@kms_addfb_basic@addfb25-y-tiled-small-legacy
> -igt@kms_pipe_stress@.*ytiled$
> +igt@kms_pipe_stress@.*ytiled
> +igt@kms_pipe_stress@.*yftiled

May be we could add it in one line like the other ones above. But I'm 
okay if you want to keep it like this as well.

Either case,

Reviewed-by: Karthik B S <karthik.b.s@intel.com>

>   #########################################
>   # Valid skip :- 90/270 rotation is not supported
>   ##########################################
> diff --git a/tests/intel-ci/xe.lnl.display.blocklist.txt b/tests/intel-ci/xe.lnl.display.blocklist.txt
> index cd1e6d19c..4d20f4d06 100644
> --- a/tests/intel-ci/xe.lnl.display.blocklist.txt
> +++ b/tests/intel-ci/xe.lnl.display.blocklist.txt
> @@ -10,6 +10,8 @@ igt@kms_(plane_lowres|frontbuffer_tracking|plane_multiple)@.*tiling-y.*
>   igt@kms_flip_scaled_crc@.*(yf|y)tile.*
>   igt@kms_async_flips@invalid-async-flip
>   igt@kms_addfb_basic@addfb25-y-tiled-small-legacy
> +igt@kms_pipe_stress@.*ytiled
> +igt@kms_pipe_stress@.*yftiled
>   #########################################
>   # Valid skip :- 90/270 rotations are not supported
>   ##########################################
