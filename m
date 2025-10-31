Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84DFFCCF9F0
	for <igt-dev@archiver.kernel.org>; Fri, 31 Oct 2025 02:52:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 05F1A10E188;
	Fri, 31 Oct 2025 02:52:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LmCEokQj";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ABA4A10E188
 for <igt-dev@lists.freedesktop.org>; Fri, 31 Oct 2025 02:52:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761879128; x=1793415128;
 h=content-transfer-encoding:in-reply-to:references:subject:
 from:to:date:message-id:mime-version;
 bh=HrXhK/siRRdyrCpj0d1atcKRs6vvNPMOVMFFtzed1Ig=;
 b=LmCEokQjuDXR7nZYWSxvWnUOC0tzyfixWPa3Zk1QDPXZY46KBsG6MqaH
 m5Iq4prFqFDfUx+eg8SUNwqWuLwRWmCu2bqjKXhj5LTf0UcTYTsTVfHA4
 0R5mlxBfqIdl0Eh0wpNe3xfvkKBafykJhB5KkO9lSZ/Mqgo5c121f1ICW
 ruaULUvBQoPYNWI+EGo0mbWVQfnW4IVQ4iA8U7CCvmBmic1dYX6iYKc2x
 XkeG0fFgSlszFCdXAfFOQo4lKJb8sV3Gfyba7u4zfzhoZJSL4PAbLCIm8
 3Mx7EKSAfBFgvm+nS6mRnCLllRDHBUI+5wU34XROjuASzX+YkxrJmtqxI g==;
X-CSE-ConnectionGUID: hzRHG1OCT4yIa/XQJOqA2A==
X-CSE-MsgGUID: oDN9N5EHTra77YfMDTcE1w==
X-IronPort-AV: E=McAfee;i="6800,10657,11598"; a="75382750"
X-IronPort-AV: E=Sophos;i="6.19,268,1754982000"; d="scan'208";a="75382750"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Oct 2025 19:52:08 -0700
X-CSE-ConnectionGUID: WiROBrCVQmi1+orVfh3WkQ==
X-CSE-MsgGUID: vc3DPLnFT5GRvQoOX1P8EQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,268,1754982000"; d="scan'208";a="185778947"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Oct 2025 19:52:08 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 30 Oct 2025 19:52:07 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Thu, 30 Oct 2025 19:52:07 -0700
Received: from PH8PR06CU001.outbound.protection.outlook.com (40.107.209.37) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 30 Oct 2025 19:52:07 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XhqDxssOGE2zMlhpF4MFXyszZ3Jrim7pJrwqSlphgKGBXK0o7HK3vzx2DlVtdRqXt9AMzk4A23NiLUnL7ZE5oY1+nQankbuI57RZZ1LL4vT+pr1DK2ckK98Wc0aoO3aQxz5yaWA6yrrDLQ2cte3GEmYRjnbJzISsfu5i94HIUgl4hmkswY3qE8lJJ0tvjEzeBie26HfUWYIgk1o9I0rmOpPUrA7qeW99V8RSA1TaYCWaSGFoseetIIgosoIcSulIpxAxcFSWRPLdtAxGcX2IaMJcWEgjD5Cs34Ec7h7iVKpu0P8P82QH7wVUWwTbrfzImiBCMt5A+zxfJwofhMKB1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Hnlip1Saf+7hKSJo0yeW3Io13YLGI2by2YlKbhAoynY=;
 b=thsHTB3XNl8tci2ynmNI9mAcyYs6tZ2GgjoY1IO5QQ90wyrK2gA3FB28wf/V+Y1WXq1JejbNbzf10P6BVYJYW3G4X2f6pWXd/S74FfI7fFZMeRkzOGpGPU0fnXb2nCGql4b40S2DL+oZwpp4iGSHbo0Mv6M808HzSb7cUnfE14Vz7hptBLd4sUXLgh5dKveKSlMRSlPqP52EnmLC5/+3/ZdDBDYkYxVCJPn8vIfPtvuFjkOgdN3Bze0XDQ9iZxT712OP9Csn7z6YojTOl8eT52+YOwReh1wZGzHpvy9Ok7EDVtSx9wKk67TOQpbwymt4Y7Hapqk20PkcmucmZhCkDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8287.namprd11.prod.outlook.com (2603:10b6:510:1c7::14)
 by SA1PR11MB8320.namprd11.prod.outlook.com (2603:10b6:806:37c::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.14; Fri, 31 Oct
 2025 02:52:05 +0000
Received: from PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::7e8b:2e5:8ce4:2350]) by PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::7e8b:2e5:8ce4:2350%7]) with mapi id 15.20.9275.013; Fri, 31 Oct 2025
 02:52:05 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <5a23aefb-a9a5-4143-839a-18cbb95d9098@linux.intel.com>
References: <20251030191558.206251-1-ngai-mint.kwan@linux.intel.com>
 <176185283180.3303.10612741209970133886@intel.com>
 <d33f4816-d441-4fc5-a1dc-8f636b8858e9@linux.intel.com>
 <5a23aefb-a9a5-4143-839a-18cbb95d9098@linux.intel.com>
Subject: Re: [PATCH i-g-t v2] tests/kms_atomic_transition: Fix dynamic subtest
From: Gustavo Sousa <gustavo.sousa@intel.com>
To: Ngai-Mint Kwan <ngai-mint.kwan@linux.intel.com>,
 <igt-dev@lists.freedesktop.org>
Date: Thu, 30 Oct 2025 23:52:01 -0300
Message-ID: <176187912169.3303.6001455874424417370@intel.com>
User-Agent: alot/0.12.dev22+g972188619
X-ClientProxiedBy: BYAPR08CA0019.namprd08.prod.outlook.com
 (2603:10b6:a03:100::32) To PH8PR11MB8287.namprd11.prod.outlook.com
 (2603:10b6:510:1c7::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8287:EE_|SA1PR11MB8320:EE_
X-MS-Office365-Filtering-Correlation-Id: c7311352-b5ac-4f5d-5c5d-08de1828799f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?OHlKNUVVd0VGOS9tYmRoekFvZG9ITDBMSXgyTmI5QzRqdHBZSkg4Nlhja0lh?=
 =?utf-8?B?RVMvKzNhUkJhdHdBYndtYXoyRlJvRlBPa3dKMHh3azdJOEFielRmTElkZEQ0?=
 =?utf-8?B?d0lvak9kazc3NmNRMVV6SkZMSEoxV3crbENlN1IvbklYeHVQUTZtaG9tWjNl?=
 =?utf-8?B?MDMvQXJjZmNUd2hla0U5WEVCcmh1a0piYVpwbGdIc1pFUGkwRk5WSHg0MHpR?=
 =?utf-8?B?ejRIcnh6c25nMGdUb3RoRVVMR1JRUy9CdE9DUUJmb25MUmpaTFRxSkVqZlVq?=
 =?utf-8?B?amtqeC9QclAvS1IwZGMvYTRJd2phQmUza3VwbSt4OGZCc01TQ2tBR3h4WHp2?=
 =?utf-8?B?MENRbC9RajZyMlRoNVJYTW1aRFVoWS96QlFtamdkQ01tL1E1dENEN2FPekVq?=
 =?utf-8?B?c1lTUEtsR1FKa3ZvZmlGUCs0QWlvTUVLelVEY2RkQ3RaUzhjNFRUMERXbGg3?=
 =?utf-8?B?Z3IxbUpUcnRkZHc4ejg3TVQxZGdIZTQ5eFRZOENMVXNMUUpYVGJJd1V2SkJF?=
 =?utf-8?B?MkRjT0ZLT1Vzb3dFeVBSRjNuc1Q4WUx1WElZM1FiL2NNL2t4RjVXZW56YmdV?=
 =?utf-8?B?LzNwSU1td2JCMElzWjFuWXg0WEVNc0N6a1J3TnV5cUZKOWUzMy9CYms4VDdX?=
 =?utf-8?B?bU9BZjVTeHFuZ21nbU1zeWEwZUw1bU11eDdUcVFUenB1NjBROVpjWmtCaEZM?=
 =?utf-8?B?clBwTTZTSHBNc0NGTkdLZkNmbCsrNkJCRWJrSHdCRWdBNnV0L2xzNDZ2SzE1?=
 =?utf-8?B?T0RxVUFKM1NhSTBmcStNdlk2cHhXWHhwNFoxd3ZJMXNWdVY1aXVDS1MyVytG?=
 =?utf-8?B?ZkZpZUg4NDh6YW1QNFFMOWlzY0hiREJERFNZdURjSGJ3aFZVMG0wd25SZ1V5?=
 =?utf-8?B?ckRYaEFJMkZyeXVxQk93VC9pOHVTS3F4RjlKanNsNy9WYmdLUjl2Nlp2YTNs?=
 =?utf-8?B?VjBYejlKcWlvZkVNM0Z6dWM5RDJMMjBIdGJPL09pZi96NWNOd1BFUEdmbENN?=
 =?utf-8?B?MFNmNVRMYVZTOU00WFdwSTltYUlnZnczb1lNcnZqOFVUQmVia3JZYXpKVjNJ?=
 =?utf-8?B?cWpNd1dSVElteDgzZ3F6VUdFVEJsSzBudDJsSWxjZnAyR1JZUmVScCtZNTVO?=
 =?utf-8?B?clQ1dUpHTFJPZGRvbzJJd09nNGlhL1BVSER3OWFMMi92NndnZGMxMFE2aFdJ?=
 =?utf-8?B?SkY4K2lRd1NTMklNMXdQVEZxVlAwOFRZdnZ0bjNvb2tzbGl4U01mNDVGd2lN?=
 =?utf-8?B?a0tyN3pZbXFWWVVsalYweldXWUVzb0ZZSGZ6U2pOZkRNc1pJd3A0LzljTkVm?=
 =?utf-8?B?SmM3QnpPNTZzTElYSUEzZ0tHRWxCQldzL1JzR3RGTFZSUFcxRzZiWG9aR0tn?=
 =?utf-8?B?d1RRZjlkUXRIVElXTHFWMC9DbmJJRXE3S2NDV3Rkam5NbXdhWE9wckpjbWJq?=
 =?utf-8?B?UVVUeXJtWXVERWg5WDEyVzhCVmVwQXJNbWVUZVkxT0dhQlZDL3Y2aVBMR2gz?=
 =?utf-8?B?ckIvcERMVjBmVWFHQ0g5MzBvREdCb3kwdzE2dzlTWFpCbUxSd0g1RUdxWlEv?=
 =?utf-8?B?M2diUHRGQ2V0K2FiUDhPbFJkVnRZN0RvQlNpbkZ3cUlNSDdUL1g0MTVnUGw3?=
 =?utf-8?B?UzZwenpjaVNHVGk4R3owaWQ2NlZHWEI5cmtDa1k0Qjl1Y1RQcjA0MVJXZUc4?=
 =?utf-8?B?NG1iS2lrZlhkemRwV25iRkxnZUNlcmxUNUpyZGF5OXdPS1QzRUtRbHozM2Zv?=
 =?utf-8?B?RmxJekVKbkRndGQxZHNXMVEwOGQ4eWxlQjRsTzlpOXI1VE1zT3l2R0JOY0x4?=
 =?utf-8?B?RkdKOHBWZWRlWWpEQ0puQmlVbWhiYkR6aFdIYXhLa2FibjZ2ZmdwMU5GQm1I?=
 =?utf-8?B?U2JlZzE1K3hlMHJwbzZNWG9QbzhTbGd0aElqOG03bVhQaFhRdEhkdEIxZEE2?=
 =?utf-8?Q?mdYAClusQWURVlmJ/zelg1lewX0ntHUB?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB8287.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZHlWTXVVdk5zREJXNjZ5T3M0SFpxYnMrZ0FUZUxWNDg2L2lrR25FdzJBWDBi?=
 =?utf-8?B?TURLRWZxT2U2aStVZng0Q1RFSUZKVFcrV0ZLRzI3VlJ1TGRZMWx5ZFMvOXBD?=
 =?utf-8?B?VkJaUmZwT0RHWUZualNRYzZCMk1vZGdNWFdxQTB3NlM1UTZQUlltZGppbVY0?=
 =?utf-8?B?VUpBcFNQSlkxTGhOS3hLM2RQUW05OURCSUlhcEZURXNySHRsUlliOTVPanB1?=
 =?utf-8?B?QWxuZWQzSFR1S2NXaVA0UkNqQXBZOTUwT3VSSGdvTjZKeUk3RW1hd01BaVBN?=
 =?utf-8?B?bXhvU2JXYkVJeVAzWjlJWUd3OUNvZGFuL2dMRWxsaFhJemRsbTduYjc3N0My?=
 =?utf-8?B?ME9yYjQvcTF2TmFDM1dPZ2Q5NjhvNHFoNUxKdVUxbGdJUlpmT2Rvb3VpYk9J?=
 =?utf-8?B?Ui9WdXhDL3M3R2htTDhTS01tMzJRcFZIOU4xMUJBN3RzbTN0S2g5MiswNThC?=
 =?utf-8?B?dzBqTDVrMmtHeWZUT01nZElBYWR6RGZEQ2FNNXpGV2lXZVZsUFVyUjBBTTZZ?=
 =?utf-8?B?YUU2eS92REJ4ZjlON0cwTTkxK2NjNjlPWlh6MnJLV2RnZW10MCt6Tk02TnA0?=
 =?utf-8?B?UUVyNm43VW14NWdpcVFaMjNLY3hwRlZiOWt0U3NJUm16LzViazhUcVo2RmVV?=
 =?utf-8?B?YTR0TGtvZzF6R0F6TCs5T0dnUGhEeGxMNzhaSmlyY1lNSUo5N3ZFdTE0ejlU?=
 =?utf-8?B?elA5RjMzOEJIUXZWMHdhUHRuNVg5VDZVYmllOHlUVjVuYVczQ0FITVZ5WjND?=
 =?utf-8?B?bGdLc3hNajYzekZFSHVHbWxjRVpuN3JtcExGVE5vSVlEVUZlamxGbGRaSHB1?=
 =?utf-8?B?WVJaN2R5aFY2VFVOR0t5d3h3VWp0bnVFaXhnVlh0QmZzcGxOTDd1YUhWVUxp?=
 =?utf-8?B?QVdhSzFtUVY3Tzd6WHNxTFgrazlJVE92S3ZEcmxjcUFUQUVibElObW5PbEYx?=
 =?utf-8?B?UU1xZFlZbzdzNWRkb0Y4THJKSkYzdGwzdXJ0aHJiQVZZbytVVHk0bUtHVUFJ?=
 =?utf-8?B?b1lvNlZ1ZU1WSmN0dnc5eFlLRnNLVDBGMkdtY1JyMnMzZzBvdm1zUEpDYjVW?=
 =?utf-8?B?d2ZwajRPZXRNbzRETXVKalovWkpieDhEZHd3QVJDN3VBOUtsdmNOUS9vbWI5?=
 =?utf-8?B?elN5cmJQb0dOeGhuWkgwZW51T1MxZWdLcitYMWpiRzBvc0VMQURmaVBBQm10?=
 =?utf-8?B?eTMwY2JEZTU3Z1h0Q1BWMjJpRCtsN05Sc1RTZkNxRUxGY20rN1ZTd2xFa2lL?=
 =?utf-8?B?aEw2bXRKNExHdHYvVGxMVnBEOURFblBjemI3aVNWbCtDZ2s0L0l4TWo4dVE1?=
 =?utf-8?B?RitrUGRaNUtRMWRNZHBqekozV29lV3hqbVhFQWk1aUpUWnpwSUJHNXE0R1dn?=
 =?utf-8?B?eHppeTY4ZW1ROC9Qd0p5NENEQ2hjakZpbkNuL1RTRU9hbWNZbVlseWkrMUdV?=
 =?utf-8?B?UUtPdkxTMTVMMlFMS09Wd0ZBV08xRzNuM2sweC9FU25PLzNFd2NkZy91T2FV?=
 =?utf-8?B?cXZPUnhmUlltK2J3Y0lIYjVYM0tPUzJEM3h6S1lESnY3UktDS3lBMmxNMEtP?=
 =?utf-8?B?OUNRaWpTWDU2VTFFb3ZBMUlRa1dWY1lEUHZreTRiOUMxNTlyaHhlcFJkdjJk?=
 =?utf-8?B?VG9rL3lTU1l1NlhHT2hMekgwWFZuKzZaTlhjeVR2YkovcksvM1Z3SGZoKytL?=
 =?utf-8?B?MW1NcG1zWUx1QUZHRkNtUW9Kb0RidGEza2IwMGhYaHAvYkdmZFBlTkVKNXdr?=
 =?utf-8?B?TVVCdzQxQm80MHI0RUlkWWJmVHp1MUhUMnhaUW1KaU93eFZpTGZWRjdUM0Fr?=
 =?utf-8?B?V3dlWEtOUGw3b3VXdGorVEdyaldJSlg2TzVDQmkzMlVnMi9pV0t6ZWVUdDRu?=
 =?utf-8?B?RnJYTWJOWVNrN2FxLzBDQ1pDanE5NzJTSnBSSzUxREl4UzdBUnlNWUNuM1lu?=
 =?utf-8?B?REdQMEZlRTN6NmpxSTRGUk56eGQ3VnkvRzBxZlAwNlZrd0JoaDJseHJ5dGlZ?=
 =?utf-8?B?eGpHY0ppd2NBemFFV3UxZTJLZlREQS9zdzV5RGdHL1JvMm0rUWFDM2t2VU4z?=
 =?utf-8?B?SkgwOUZJMWMyK2NXVVliZ0JMNlovYnhmRXo3V1RJSXlodVI5NzJVYUVjVXpT?=
 =?utf-8?B?NHB6QmVxakJMT0xpTlpEZHppdk9pSzBYUkZCZ1lHWVJlaVJxeFpqcTFVYmxx?=
 =?utf-8?B?cmc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c7311352-b5ac-4f5d-5c5d-08de1828799f
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8287.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Oct 2025 02:52:05.6688 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bFylIY5KYkuqoIxHK8PCn48IKGwEq+32jmltL1t91VRIFZIZxnnsEFLMu37II0r+UUzlQxvhbXHsa1Z7Wv6AfA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB8320
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

Quoting Ngai-Mint Kwan (2025-10-30 17:02:10-03:00)
>
>On 2025-10-30 13:00, Ngai-Mint Kwan wrote:
>> Hi Gustavo,
>>
>> On 2025-10-30 12:33, Gustavo Sousa wrote:
>>> Quoting Ngai-Mint Kwan (2025-10-30 16:15:50-03:00)
>>>> Fix Segmentation Fault when calling igt_pipe_crc_free() due to=20
>>>> double-freeing a
>>>> dangling pointer.
>>>>
>>>> This occurs when a system connected to multiple displays executes a=20
>>>> test with
>>>> "1x-outputs" dynamic subtest.
>>>>
>>>> Example:
>>>> kms_atomic_transition --run-subtest modeset-transition=20
>>>> --dynamic-subtest 1x-outputs
>>>>
>>>> v2:
>>>> - Move test cleanup inside run_modeset_tests().
>>>>
>>>> Signed-off-by: Ngai-Mint Kwan <ngai-mint.kwan@linux.intel.com>
>>>> ---
>>>> tests/kms_atomic_transition.c | 25 +++++++++++++------------
>>>> 1 file changed, 13 insertions(+), 12 deletions(-)
>>>>
>>>> diff --git a/tests/kms_atomic_transition.c=20
>>>> b/tests/kms_atomic_transition.c
>>>> index e1387bd89..419afe4dd 100644
>>>> --- a/tests/kms_atomic_transition.c
>>>> +++ b/tests/kms_atomic_transition.c
>>>> @@ -899,6 +899,7 @@ static void run_modeset_tests(data_t *data, int=20
>>>> howmany, bool nonblocking, bool
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 unsigned iter_max;
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 igt_output_t *output;
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 uint16_t width =3D 0,=
 height =3D 0;
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 enum pipe pipe_enum;
>>> Nit: I would have just gone with 'enum pipe pipe', which seems to be=20
>>> the most
>>> common way of doing it (according to
>>>
>>> =C2=A0=C2=A0=C2=A0=C2=A0 git grep -oh 'enum pipe \w\+' | sort | uniq -c=
 | sort -g
>>>
>>> ).
>>>
>>> The change itself looks logically right, so:
>>>
>>> Reviewed-by: Gustavo Sousa <gustavo.sousa@intel.com>
>> That would have been my first choice too!
>> Unfortunately, the following warning appears on compile:
>>
>> ../tests/kms_atomic_transition.c: In function =E2=80=98run_modeset_tests=
=E2=80=99:
>> ../tests/kms_atomic_transition.c:921:29: warning: declaration of=20
>> =E2=80=98pipe=E2=80=99 shadows a previous local [-Wshadow]
>> =C2=A0 921 |=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0igt_pipe_t *pipe =3D &data->display.pipes[i];
>> =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0^~~~
>> ../tests/kms_atomic_transition.c:902:19: note: shadowed declaration is=20
>> here
>> =C2=A0 902 |=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0enum pipe pipe;
>> =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0^~~~
>>
>> This is why I settled with "enum_pipe", but I am open to other=20
>> suggestions.
>Correction: "pipe_enum"

Yep.  I did not see that.  Thanks.

I think we can go ahead with the patch as is.

--
Gustavo Sousa

>
>Kwan
>>
>> Kwan
>>>
>>>> retry:
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 unset_output_pipe(&da=
ta->display);
>>>> @@ -1033,6 +1034,18 @@ retry:
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 }
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
>>>> +
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* Cleanup */
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 unset_output_pipe(&data->d=
isplay);
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 igt_display_commit2(&data-=
>display, COMMIT_ATOMIC);
>>>> +
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (is_intel_device(data->=
drm_fd)) {
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 for_each_pipe(&data->display, pipe_enum)
>>>> + igt_pipe_crc_free(data->pipe_crcs[pipe_enum]);
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
>>>> +
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 igt_remove_fb(data->drm_fd=
, &data->fbs[0]);
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 igt_remove_fb(data->drm_fd=
, &data->fbs[1]);
>>>> }
>>>>
>>>> static void run_modeset_transition(data_t *data, int=20
>>>> requested_outputs, bool nonblocking, bool fencing)
>>>> @@ -1067,18 +1080,6 @@ static void run_modeset_transition(data_t=20
>>>> *data, int requested_outputs, bool non
>>>>
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 igt_dynamic_f("%ix-ou=
tputs", requested_outputs)
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 run_modeset_tests(data, requested_outputs,=20
>>>> nonblocking, fencing);
>>>> -
>>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* Cleanup */
>>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 unset_output_pipe(&data->d=
isplay);
>>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 igt_display_commit2(&data-=
>display, COMMIT_ATOMIC);
>>>> -
>>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (is_intel_device(data->=
drm_fd)) {
>>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 for_each_pipe(&data->display, pipe)
>>>> - igt_pipe_crc_free(data->pipe_crcs[pipe]);
>>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
>>>> -
>>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 igt_remove_fb(data->drm_fd=
, &data->fbs[0]);
>>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 igt_remove_fb(data->drm_fd=
, &data->fbs[1]);
>>>> }
>>>>
>>>> static bool pipe_output_combo_valid(igt_display_t *display,
>>>> --=20
>>>> 2.43.0
>>>>
>>
>
