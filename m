Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86857C83F1B
	for <igt-dev@archiver.kernel.org>; Wed, 16 Jul 2025 10:43:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3456E10E78C;
	Wed, 16 Jul 2025 10:43:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iVJULDpG";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 382AA10E78C
 for <igt-dev@lists.freedesktop.org>; Wed, 16 Jul 2025 10:43:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1752662608; x=1784198608;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=tEMpEuIvmgkCMyApfAIoKt9E7Nmw3D7VRaX1DWNde80=;
 b=iVJULDpGlm8XAWuhgzlR6nXejMOn6nwSVCwGxVPqzTvmGK4Yz5lhRPJS
 W22PcTznkjzPgd1utxnE9zOQedhDY1M8OmdCPTx5dHltqKRoe5I0CTsnx
 T0RbPHpd4fBA3ffKPhV+CX0YeGut1r3EEP5mUNgu+2Qso/hHyACQ4PWrD
 uNYirkFN8zJmG0xlj/8JzL91GMf64+GHhgyx8rj11jF6XDUxLhyVrxmZW
 gSwLks83A+bD729u/cou85yqDmlhcIstmYdlalTRAL/jAfv6YDebjCdMy
 Iyo+k3//nKtxOt2zE9PkObuN64ycCG7r/Q2fwBlcsftONuwUzjebMQWsP w==;
X-CSE-ConnectionGUID: RFnFi0wXTuGCv+FspZo5pw==
X-CSE-MsgGUID: NnWNLhz7T32xHbChdEERyg==
X-IronPort-AV: E=McAfee;i="6800,10657,11493"; a="54609806"
X-IronPort-AV: E=Sophos;i="6.16,315,1744095600"; d="scan'208";a="54609806"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jul 2025 03:43:27 -0700
X-CSE-ConnectionGUID: UlWM+j3dTwym7WcvfJ4qSg==
X-CSE-MsgGUID: Qq7gHNbVSymzox+x3SufAg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,315,1744095600"; d="scan'208";a="163107032"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jul 2025 03:43:27 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Wed, 16 Jul 2025 03:43:26 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Wed, 16 Jul 2025 03:43:26 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (40.107.220.48)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Wed, 16 Jul 2025 03:43:26 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lKPTTYxEwspX7iOoFbJy5MFc35bFrbcV12aNHDJvz6AxCke6NcBRSFPpkfIatDbHIivdPirFTR2myu8E4ry7Zaj42ypEkA/XFr9iRbZilWCxBQC6m4+dTOCR8eA6BRyipPyU7ux8LjlJftrW5npJXZR+5JhXaCx1RTnhBF9RwEqOo7zapF5tnfU4H8hju4x12HHQNEebpLopmSAOepiyALVa/arPve61edOwhzicnFPUPrEMKHsaiHGPukNn9f9ZWwJtOmURvdObD1uuAYAqGBYhsYHpOhlJZR6yYrKSR7ZSX/t+fQBTxrEuE4FvLnkwj+tL7FWQifbmLh+nmkEO/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tEMpEuIvmgkCMyApfAIoKt9E7Nmw3D7VRaX1DWNde80=;
 b=cP79UphlkxmT0iPtyJZE+D+Z1k7oda+kczCzEhbCyYM9qmAKYcNqnoKHrxX5qWOxY58z0ArwHSuTPUDn4+ZAJQKhkFxEFLf2zVZYVgvsAWkMaPGs/Do+7ab/C3FT/KJkYWwu246auQb3JNCIGex0XP7cXDO6iY5GICAHXDi2d4fas1LzC6e3HD1ulvgF2x4UFveL/WHhNf+MdK4CztgzzQpb55bxu2DYihv59aCQVTZQwjkzgE/3esgSETd5jka994d1oejcOzfrn/Sz1ZDBs9W3N93fbwLIFhNqpMoNFqD4q7+uf5a6keevlKtH0z5joYAC18/14NJuwr2Zvn5I3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB6312.namprd11.prod.outlook.com (2603:10b6:8:a5::11) by
 IA0PR11MB8334.namprd11.prod.outlook.com (2603:10b6:208:483::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8922.33; Wed, 16 Jul
 2025 10:42:53 +0000
Received: from DM4PR11MB6312.namprd11.prod.outlook.com
 ([fe80::faad:f9ae:2b45:e9ba]) by DM4PR11MB6312.namprd11.prod.outlook.com
 ([fe80::faad:f9ae:2b45:e9ba%7]) with mapi id 15.20.8901.024; Wed, 16 Jul 2025
 10:42:52 +0000
From: "B, Jeevan" <jeevan.b@intel.com>
To: "Grzelak, Michal" <michal.grzelak@intel.com>, Kamil Konieczny
 <kamil.konieczny@linux.intel.com>
CC: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, "B S,
 Karthik" <karthik.b.s@intel.com>, "Sharma, Swati2" <swati2.sharma@intel.com>
Subject: RE: [PATCH i-g-t] tests/kms_setmode: Find compatible mode for eDP
 before selecting default mode
Thread-Topic: [PATCH i-g-t] tests/kms_setmode: Find compatible mode for eDP
 before selecting default mode
Thread-Index: AQHb3CSlDbu2CvqRZkqLHMVJnSu24bQGIpEAgCuRvACAAZwDgIABcdGg
Date: Wed, 16 Jul 2025 10:42:52 +0000
Message-ID: <DM4PR11MB6312A4763B4CEEB9E1B9F5059056A@DM4PR11MB6312.namprd11.prod.outlook.com>
References: <20250613054848.3279961-1-jeevan.b@intel.com>
 <SJ0PR11MB507248333ECA5D7E74CE9B118F70A@SJ0PR11MB5072.namprd11.prod.outlook.com>
 <20250714115612.xouhsgkko26zs5fu@kamilkon-DESK.igk.intel.com>
 <SJ0PR11MB50723625F88EF2AE1CDAEC3F8F57A@SJ0PR11MB5072.namprd11.prod.outlook.com>
In-Reply-To: <SJ0PR11MB50723625F88EF2AE1CDAEC3F8F57A@SJ0PR11MB5072.namprd11.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB6312:EE_|IA0PR11MB8334:EE_
x-ms-office365-filtering-correlation-id: c90df1bc-715a-4cf1-6500-08ddc4558453
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?cUoyTDVWYWNZUFV5a0I4TmFNcjRabnBzTlNrZS9RSjlhNHhMODh6ZmtCcTRT?=
 =?utf-8?B?VkdoWXprYWZIRW9uank0WEVRYnpkWmtYVjhpMm9ueHJRKzRxSzVubzhkMjNW?=
 =?utf-8?B?L21DbCtPc0MyU3hNOUxQbkFOR2Y5RzNyclhWTHBiMUdabWlwS0NvcHJTYTdy?=
 =?utf-8?B?V0F1UlAxKzBVU0NxNnZ3YXZMYlF5ODN0SHZuUzNvZE9oR0tsQjZBNDB1QS9s?=
 =?utf-8?B?MFZDQ01pdU5DOTNsMU1Yb3FIZ2dBcVYxNGttdk9nU09qYURrUjFEWmRWdWRP?=
 =?utf-8?B?OStKYmRQSHRVT3pMbjZKekdQblRNM0U5dElwbUFwVmZwdTZ0a0xOdWdWcmxz?=
 =?utf-8?B?L2hnbGs5U2FNL1pDcFFGcXR2QTQyNGR5UWNrR0hzOWlkaGNJdTNuemovUFVZ?=
 =?utf-8?B?NEFya2NoU1NjbWNLTzE5czQzVmIwVm9QcmtXbFlFaW5hZjU1UlBqbEpXOWQ2?=
 =?utf-8?B?Tk1CeFpIYVFueDNtVVkycHF5SnEzODhCRWt4TVNrZ29IQnpMUFRoaW0xa1py?=
 =?utf-8?B?OXUwd25oT1R2NGZlMG1LTDdDdkd6ZlN4Y1F3dzBtbHBWT3A3SWFOa3pmL1F6?=
 =?utf-8?B?b3VHRlhMU1BtbVFSZW41ZDZEeENldndaSXlTSHU0NXlWSk5Ib0xMbnBvSzVU?=
 =?utf-8?B?ZzViK01XcVVQTnNRbDVEbUdzWDhxYklWTjdLc1ozeEpmMmZUSERwSzRHbmZQ?=
 =?utf-8?B?enBHd1FsQzNlWWU5ckVuWElIcEwydVUxMlFmQ0ZSYzQwZU1QVEs5RVFsTGlL?=
 =?utf-8?B?aU5CaFk2V0tlWVR5SnkyWVdXSlp2V1Z3MW9lSUEycmtOc1kvQW9YVExpVmJQ?=
 =?utf-8?B?ZXlEdjJJUTIyUlR0T3VtekJFT0dsY214K3ByWnJJRDd6ZUlFcTRyOXlJSXZU?=
 =?utf-8?B?Q3hRTmxoV2NpYzV5V29lWEMrQmJUNDNzNUVVT2VxSzFjWXZPU2xqTlRRV1pZ?=
 =?utf-8?B?T0JMSVhiMGRVVWE2dWpoanVIamFaMlVZWld6UkI2TzJKOE0wcUV6bXNpbWw4?=
 =?utf-8?B?NHhlRldzSm1zUmc2VXpPWERBYk1iNTVtb1ZuSytYUEVwTW5jZGJwR3NqT2Mr?=
 =?utf-8?B?SGg0YkY2a3pQN2NGYjhudEh6RlRqckNIeVQ2VXN6ajBDY0lpZ1JvRzhZQUMy?=
 =?utf-8?B?eDFERTVVNmNJS0gwZnBTRU9OUGZhelJjWVBOQ2xMN2RBeUoreEh0R3ZJWGs3?=
 =?utf-8?B?UWJ4OVpWOFdVc3gwRE80WURsSFc0VE4rRncwMlRhMkFmNjRBYXNhaU9qY3I4?=
 =?utf-8?B?eWd6M1Bsa2Z6TTlHODZST2YxZE9HV1BBYzRNVlFSYVRPZjQvMTdDT3IxTTNw?=
 =?utf-8?B?TmlYaFpuRFpsSjRvMjROZXdzQ3lZUVRHdXk2UzhQTTNMd0Z1RklUcTRKdUoy?=
 =?utf-8?B?c3RKS0dldGhEc0xZaU5ZOUR2RE5ScjI2UlZjaU5IL2k2WGczeW42Q2kyS3ZD?=
 =?utf-8?B?Z1FHRzVmbkpwQUExaC9IVk9WdFl4bFk4MlN3eS9heFhkaWJoQnBMKzZSRlNW?=
 =?utf-8?B?NU9MWWRrRnZlUEJiaXFzdy85dm5IWWdOYmxkN24ycmRJNlp1TGtEZ05wN0VE?=
 =?utf-8?B?SHYzbUd6bDUxUWhUT3duOG10Wmd6aTJmU1ZxaHUyeUFSWG1Pc1lhS0swTHhJ?=
 =?utf-8?B?SFVJTjNEeGxMUTExVkxTNG1hVUJrS2F0RzM3K3grNlRSRzhQVHJxbzIzL0ZZ?=
 =?utf-8?B?VmJzUnplRzh5QTZIOW8zOHV6aE0zTWFvcmVsbXVRRjBzbC93VlRnMUF2WkNN?=
 =?utf-8?B?aURvSTZLRTVMZjdBZHRLWTJKZ2o1SHlNTVFsemNmOTdyVFBoWEd3M29rSmw5?=
 =?utf-8?B?WDRUUGdtUGhIMWFqbkpXN1h1dEZyN3BYaE9pWTF5U2dweVpOSlVFRnlROVhF?=
 =?utf-8?B?Q241dVQ1WUc2Z3pYYzdOdHd4eHorcTF3SU9KRSsyR0NwUDVET0lYZ3l4K2pY?=
 =?utf-8?B?WmwxYnkyMWk1ckVYRlZyMU9odXZrY3l2U3oreWVIMlgyZlFMNVlwTUJhQjlK?=
 =?utf-8?B?dU1vQ0tSTEd3PT0=?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB6312.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ZWlNUUYrRkJqQ1pLeUZ6bnF6dVVoMGpvMFpWb05BUlVPUnV1Q1ViSWFHelVz?=
 =?utf-8?B?d1V2VlNMaGJ2R1pXOTVkS1gxYUhkYVJLZmtVMjNqQ1JHRHJQRWdYajNPZVNl?=
 =?utf-8?B?eWtiY0sxWjMxOFRFV2dsekNDSDhjNHNKYkY1bGlsd3JWV3c0U2VRbkR5LzFr?=
 =?utf-8?B?eEltZmZFTUhIeWw0RVJSWUZHbWhBbkV3a0V2ZmlpWXhmYk5BeGhVNjVJd1JU?=
 =?utf-8?B?endubEpXMTdLbVJtbDJJNVY4ZG9ManhaWTEvcWF2SkFOVCthZXhaNS9ybTRv?=
 =?utf-8?B?SFhWRnBoRzFtMzcyZ1VwZmw3V0FkQ2ZvT3p5RGxISUdBc1lxV0REU3NnKzlS?=
 =?utf-8?B?bXVTcm5nMVJENzExK2RuYzlCQ0Z2SVExOHRURmZldDczQXBGWTFRZ0ZFUCs2?=
 =?utf-8?B?Q3BiZzV5SFprRE1QWHJLeThFOFVEVjg4WmJjbmZvTEN1YldVVDFDZ2FMdkl2?=
 =?utf-8?B?NzR4d1Y5bHFPb25aREt4STErbXRKR1plZzhWWjZ5dy9VMDQwamR1dkx0OWRs?=
 =?utf-8?B?bnpKUlo3bzlzTjdVR1BuQ0NZRWdBUkFmZE5NRTlmVDdheWpNMHRKL0ZzTjhl?=
 =?utf-8?B?cHNhSzY4ZmxSVWMrUkFSTFBRczZUNE1KS2Zhd2h1eXpwaENpR1JjUTF4RFQ3?=
 =?utf-8?B?cUZ0ZUhydmJweTkrNjc5QjFYVFA2ZVBNQ002UWUyaENRMkpEVmE0RkxwUUt2?=
 =?utf-8?B?dFJ5YTQyWlJkcWd5WHRFRmNXeGk2S3h5eGN5S1dQL0ZKakd1RWdtcnhPaW9k?=
 =?utf-8?B?SFJYZHZoN1EwV3ZKaDU0d0EvMDNLNUhISExVMmlmSjVJYXQrS2NaZmx0d1BS?=
 =?utf-8?B?Z0tYNkNIVXJRYUl1eEs3S29XeGdWbWhsL0VFU3llQ3lUN3I1T3JLQTNWOXVx?=
 =?utf-8?B?NXI4V1I5dWFYU2FRM0ZzbXR3MmtvUkpmU0tDMlFMWGNzYm5iUTNBYm5SVFM1?=
 =?utf-8?B?dm1Oby8rRkdTcEtXTXBtUmRQdkF5bTlGYlhCSFBEV2dwejVLYkdmVlZ0ZDV5?=
 =?utf-8?B?RXdTYXp3WW1iR0YxS2JsZnQ4ck54RnpqcXZGakZOZmlJelhRajlTNWZ6SU9y?=
 =?utf-8?B?MDFURG9NUGxwbERiYi9BVnNPOUQ0dENmZjVETmpncVEzVzVsOC9UOFJwQk8r?=
 =?utf-8?B?S1MxT1dmMy9XMUo5K1dIWkdtclpUSURYUGxrdkRpaldsT3ZLRUpqZUZ6RHVZ?=
 =?utf-8?B?Mm5kTU9YTXpvV0pzNDlMcmlIbzJnVm41enZsT0VscnYyK29yRTl0SGVTOHFM?=
 =?utf-8?B?TEFKVHVJS3ZGSVZiS1hVSFBLU3JOVHpzUTRPMzM3UjB5VnRiNEs0SXF6eUxi?=
 =?utf-8?B?U3BuUDUwMVhNUFM2N05YK0krQVRBOUdXRUxYNHRaSlNIMWtnWW5XOTJHUFRE?=
 =?utf-8?B?bmdYRldneUx5YnQwTndhZXk0YWVIbW9UN1U4V1l2MkU3WXFPUVpEZGFoYjlO?=
 =?utf-8?B?ZW55Zi9rTlZVT2Z4ZWgxQWVTS3p2S29EVGpVTUFIRnQ1WGRKdmdmVVN2ajVl?=
 =?utf-8?B?VXZOQzlrcENhK1ZVNTVnR0JlNGV4ZHhuK2RWNG5XTFNTdXZNWkF0NUFjWWlx?=
 =?utf-8?B?UGxSQXFjKzRWcktvYTJOaEtxMmpRY3dSR0ZDNFJpOWN3bHEzRzRCNVRIdS9O?=
 =?utf-8?B?S0YvdnlmOFRZbVRHcTllRXZrMnhTTEFveFBxcW9iQ1dYSFBNL052cC9kN1Bk?=
 =?utf-8?B?U2JDZVYvcWdaR0p1Q0R5a01qb3k1Nk5ETG1DejNmRk1sdHo3WnI2WGdyYms1?=
 =?utf-8?B?NHhOVEZKUGg5OEpnRWc2eUorT3d3dHkvTCtDQTMzMHhSbGF3UTJpV3VPbXc1?=
 =?utf-8?B?bkg4OTAyWG1UaUV3RHh4NFg1aDgrWFM0dlBBL3ZGZ0NtWGdyNFVZNXBmeFUr?=
 =?utf-8?B?VlhZc2pGQ2tCazBKVUJyT3M5K1AvQ0N4ZytOQWppeVFRbG9DdVF3QllTOU5k?=
 =?utf-8?B?dGFWSEVjSUovT2Mra2RYUDZXeGVCdXdDU1BzcWszMUZycFlMK3FGZWNtY2RL?=
 =?utf-8?B?UXRBQXBOVkVmTm5BenVkNnFRT1grU2xCelVqQnIxdmEzYU9sVWhkQjc2Uyth?=
 =?utf-8?B?bUl3UnlUcis0dm9lVXhEcHVKM2FaSGhla1l0WGhKRUtHZTBOVitUb2p1R1E4?=
 =?utf-8?Q?gXQM=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6312.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c90df1bc-715a-4cf1-6500-08ddc4558453
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Jul 2025 10:42:52.7714 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: jrWDmU2LxN8xPekEurmO+MUDunJ88dAZX7H4gEMmps9qTrvT0KYbdvE3Kh4a1e3asRj14iOhKT5Eow1xSHnsFw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB8334
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

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBHcnplbGFrLCBNaWNoYWwgPG1p
Y2hhbC5ncnplbGFrQGludGVsLmNvbT4NCj4gU2VudDogVHVlc2RheSwgSnVseSAxNSwgMjAyNSA2
OjAxIFBNDQo+IFRvOiBLYW1pbCBLb25pZWN6bnkgPGthbWlsLmtvbmllY3pueUBsaW51eC5pbnRl
bC5jb20+OyBCLCBKZWV2YW4NCj4gPGplZXZhbi5iQGludGVsLmNvbT4NCj4gQ2M6IEIsIEplZXZh
biA8amVldmFuLmJAaW50ZWwuY29tPjsgaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmc7IEIg
UywgS2FydGhpaw0KPiA8a2FydGhpay5iLnNAaW50ZWwuY29tPjsgU2hhcm1hLCBTd2F0aTIgPHN3
YXRpMi5zaGFybWFAaW50ZWwuY29tPg0KPiBTdWJqZWN0OiBSRTogW1BBVENIIGktZy10XSB0ZXN0
cy9rbXNfc2V0bW9kZTogRmluZCBjb21wYXRpYmxlIG1vZGUgZm9yIGVEUA0KPiBiZWZvcmUgc2Vs
ZWN0aW5nIGRlZmF1bHQgbW9kZQ0KPiANCj4gSGkgS2FtaWwsDQo+IA0KPiA+IEZyb206IEthbWls
IEtvbmllY3pueSA8a2FtaWwua29uaWVjem55QGxpbnV4LmludGVsLmNvbT4NCj4gPiBTZW50OiBN
b25kYXksIEp1bHkgMTQsIDIwMjUgMTo1NiBQTQ0KPiA+IFRvOiBHcnplbGFrLCBNaWNoYWwgPG1p
Y2hhbC5ncnplbGFrQGludGVsLmNvbT4NCj4gPiBDYzogQiwgSmVldmFuIDxqZWV2YW4uYkBpbnRl
bC5jb20+OyBpZ3QtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZzsgQg0KPiA+IFMsIEthcnRoaWsg
PGthcnRoaWsuYi5zQGludGVsLmNvbT47IFNoYXJtYSwgU3dhdGkyDQo+ID4gPHN3YXRpMi5zaGFy
bWFAaW50ZWwuY29tPg0KPiA+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggaS1nLXRdIHRlc3RzL2ttc19z
ZXRtb2RlOiBGaW5kIGNvbXBhdGlibGUgbW9kZSBmb3INCj4gPiBlRFAgYmVmb3JlIHNlbGVjdGlu
ZyBkZWZhdWx0IG1vZGUNCj4gPg0KPiA+IEhpIEdyemVsYWssLA0KPiA+IE9uIDIwMjUtMDYtMTYg
YXQgMTg6MzU6MjYgKzAwMDAsIEdyemVsYWssIE1pY2hhbCB3cm90ZToNCj4gPiA+IEhpIEplZXZh
biwNCj4gPiA+DQo+ID4gPiA+RnJvbTogaWd0LWRldiA8aWd0LWRldi1ib3VuY2VzQGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZz4gT24gQmVoYWxmIE9mDQo+ID4gPiA+SmVldmFuIEINCj4gPiA+ID5TZW50
OiBGcmlkYXksIEp1bmUgMTMsIDIwMjUgNzo0OSBBTQ0KPiA+ID4gPlRvOiBpZ3QtZGV2QGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZw0KPiA+ID4gPkNjOiBCLCBKZWV2YW4gPGplZXZhbi5iQGludGVsLmNv
bT4NCj4gPiA+ID5TdWJqZWN0OiBbUEFUQ0ggaS1nLXRdIHRlc3RzL2ttc19zZXRtb2RlOiBGaW5k
IGNvbXBhdGlibGUgbW9kZSBmb3INCj4gPiA+ID5lRFAgYmVmb3JlIHNlbGVjdGluZyBkZWZhdWx0
IG1vZGUNCj4gPiA+ID4NCj4gPiA+ID5UaGlzIGNoYW5nZSBmaW5kcyBhIGNvbW1vbiBtb2RlIGZv
ciBlRFAgYmVmb3JlIGZhbGxpbmcgYmFjayB0byBkZWZhdWx0DQo+IG1vZGUuDQo+ID4gPiA+SXQg
YXZvaWRzIHVubmVjZXNzYXJ5IGZhaWx1cmVzIGJ5IG5vdCBzZWxlY3RpbmcgYW4gdW5zdXBwb3J0
ZWQgbW9kZSBmb3IgZURQLg0KPiA+ID4gPg0KPiA+ID4gPlNpZ25lZC1vZmYtYnk6IEplZXZhbiBC
IDxqZWV2YW4uYkBpbnRlbC5jb20+DQo+ID4gPiA+LS0tDQo+ID4gPiA+IHRlc3RzL2ttc19zZXRt
b2RlLmMgfCAxNSArKysrKysrKysrKysrKysNCj4gPiA+ID4gMSBmaWxlIGNoYW5nZWQsIDE1IGlu
c2VydGlvbnMoKykNCj4gPiA+ID4NCj4gPiA+ID5kaWZmIC0tZ2l0IGEvdGVzdHMva21zX3NldG1v
ZGUuYyBiL3Rlc3RzL2ttc19zZXRtb2RlLmMgaW5kZXgNCj4gPiA+ID40ODRjM2E5NWYuLjZlN2U1
OTQyYSAxMDA2NDQNCj4gPiA+ID4tLS0gYS90ZXN0cy9rbXNfc2V0bW9kZS5jDQo+ID4gPiA+Kysr
IGIvdGVzdHMva21zX3NldG1vZGUuYw0KPiA+ID4gPkBAIC0yNTIsNiArMjUyLDIxIEBAIHN0YXRp
YyB2b2lkIGdldF9tb2RlX2Zvcl9jcnRjKHN0cnVjdCBjcnRjX2NvbmZpZw0KPiAqY3J0YywNCj4g
PiA+ID4gCQkJZ290byBmb3VuZDsNCj4gPiA+ID4gCX0NCj4gPiA+ID4NCj4gPiA+ID4rCS8qDQo+
ID4gPiA+KwkgKiBJZiBlRFAgaXMgcHJlc2VudCwgdHJ5IGl0cyBtb2RlcyB0byBmaW5kIGEgY29t
cGF0aWJsZSBvbmUuDQo+ID4gPiA+KwkgKi8NCj4gPiA+ID4rCWZvciAoaW50IGMgPSAwOyBjIDwg
Y3J0Yy0+Y29ubmVjdG9yX2NvdW50OyBjKyspIHsNCj4gPiA+ID4rCQlkcm1Nb2RlQ29ubmVjdG9y
ICpjb25uID0gY3J0Yy0+Y2NvbmZzW2NdLmNvbm5lY3RvcjsNCj4gPiA+ID4rCQlpZiAoY29ubi0+
Y29ubmVjdG9yX3R5cGUgPT0gRFJNX01PREVfQ09OTkVDVE9SX2VEUCkgew0KPiA+ID4gPisJCQlm
b3IgKGkgPSAwOyBpIDwgY29ubi0+Y291bnRfbW9kZXM7IGkrKykgew0KPiA+ID4gPisJCQkJbW9k
ZSA9ICZjb25uLT5tb2Rlc1tpXTsNCj4gPiA+ID4rCQkJCWlmIChjcnRjX3N1cHBvcnRzX21vZGUo
Y3J0YywgbW9kZSkpDQo+ID4gPiA+KwkJCQkJZ290byBmb3VuZDsNCj4gPiA+ID4rCQkJfQ0KPiA+
ID4gPisJCWJyZWFrOw0KPiA+DQo+ID4gVWdoLCBzb3JyeSBmb3Igbm90IHJlYWRpbmcgeW91ciBj
b2RlIGNsb3NlIGVub3VnaCwgb25lIG5pdCBoZXJlLg0KPiA+IFdoeSAnYnJlYWsnID8gQ291bGQg
aXQgaGF2ZSBhbnkgbW9yZSBlRFAgY29ubmVjdG9ycz8NCj4gDQo+IEluIG15IG9waW5pb24sIHdl
IHNob3VsZCBhc3N1bWUgdGhhdCB3ZSBhcmUgZGVhbGluZyB3aXRoIG11bHRpcGxlIGVEUA0KPiBj
b25uZWN0b3JzIGFuZCB0ZXN0IGFnYWluc3QgdGhhdC4gQnV0IHRvIGJlIHN1cmUsIGxldCdzIGFz
ayBKZWV2YW4gZm9yIGlucHV0LCBhcyBoZSBpcw0KPiB0aGUgYXV0aG9yIG9mIHRoZSBwYXRjaC4N
Cj4gDQo+IEJlc3QgcmVnYXJkcywNCj4gTWljaGHFgg0KSWYgd2UgY2hlY2sgaG93IHRoZSBtb2Rl
cyBhcmUgc2VsZWN0ZWQgaW4gc2V0dXBfY3J0Y3MsIA0KSW4gY2xvbmUgbW9kZSB3ZSBzZWxlY3Qg
MiBjb25uZWN0b3JzIGZvciBlYWNoIGNvbWJpbmF0aW9uIDotIA0KDQoxLiBGaXJzdCB0cnkgdG8g
c2VsZWN0IGEgZGVmYXVsdCBtb2RlIHRoYXQgaXMgc3VwcG9ydGVkIGJ5IGFsbCBjb25uZWN0b3Jz
LiANCjIuIFRoZW4ganVzdCBmYWxsIGJhY2sgdG8gZmluZCBhbnkgdGhhdCBpcyBzdXBwb3J0ZWQg
YnkgYWxsIGNvbm5lY3RvcnMuDQozLiBJZiBub25lIGlzIGZvdW5kIHRoZW4ganVzdCBwaWNrIHRo
ZSBkZWZhdWx0IG1vZGUgZnJvbSBhbGwgY29ubmVjdG9ycyB3aXRoIHRoZSBzbWFsbGVzdCBjbG9j
aywgaG9wZSB0aGUgb3RoZXIgY29ubmVjdG9ycyBjYW4gc3VwcG9ydCBpdCBieSBzY2FsaW5nIGV0
Yy4NCg0KU28gd2l0aCB0aGlzIGxvZ2ljIHdlIHVzZWQgdG8gZ2V0IEludmFsaWQgQXJndW1lbnQu
IDIyIGVycm9yIGZvciB0aGUgSFJSIHBhbmVsIG9uIGVEUC4gDQpUaGlzIGlzIGhlbHAgdG8gc29y
dCBtb2RlcyBmb3Igc3VjaCBjYXNlIGFuZCBhdm9pZCBpbnZhbGlkIGNvbW1pdC4gDQoNClRoYW5r
cyANCkplZXZhbiBCIA0KPiANCj4gPiA+ID4rCQl9DQo+ID4gPiA+Kwl9DQo+ID4gPiA+Kw0KPiA+
ID4gPiAJLyoNCj4gPiA+ID4gCSAqIElmIG5vbmUgaXMgZm91bmQgdGhlbiBqdXN0IHBpY2sgdGhl
IGRlZmF1bHQgbW9kZSBmcm9tIGFsbCBjb25uZWN0b3JzDQo+ID4gPiA+IAkgKiB3aXRoIHRoZSBz
bWFsbGVzdCBjbG9jaywgaG9wZSB0aGUgb3RoZXIgY29ubmVjdG9ycyBjYW4gc3VwcG9ydA0KPiA+
ID4gPml0IGJ5DQo+ID4gPiA+LS0NCj4gPiA+ID4yLjI1LjENCj4gPiA+DQo+ID4gPiBUaGlzIHBh
dGNoIGxvb2tzIGdvb2QgdG8gbWUuDQo+ID4gPiBSZXZpZXdlZC1ieTogTWljaGHFgiBHcnplbGFr
IDxtaWNoYWwuZ3J6ZWxha0BpbnRlbC5jb20+DQo+ID4gPg0KPiA+ID4gQmVzdCByZWdhcmRzLA0K
PiA+ID4gTWljaGHFgg0K
