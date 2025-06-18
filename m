Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24BDCC71157
	for <igt-dev@archiver.kernel.org>; Wed, 18 Jun 2025 11:51:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB13610E801;
	Wed, 18 Jun 2025 11:51:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HceoRok+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5578B10E803
 for <igt-dev@lists.freedesktop.org>; Wed, 18 Jun 2025 11:51:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750247502; x=1781783502;
 h=content-transfer-encoding:date:message-id:cc:subject:
 from:to:references:in-reply-to:mime-version;
 bh=Jr1neE/cKSvLJtP0tY2FxSs1GjuhtSV5G4/fcBMpXis=;
 b=HceoRok+AE9HP/pmGP3DV45mef4S5kObzf0MT15G1K4lR+kSGftR66eM
 39GcGRuu1QTkWTJaLWoG1KfeWWOHy1WIdzlfFeEc9l84gUnBAashJRskX
 WqpVqlBQD3KLHSXTeAHgwzG/wKVFxCQH4mbQhFM7vsH6H9a6qctMrRyG6
 UKP5B3ycsGc/V8Fo30i8Jxnq8yH2MA3kFJBj+E5CiUnlr4N1f/yW8VhGB
 LPghh7niJHmNyTOJBwbktuPWKY6s/milx36Autb94auEFn/qrVXDJ6dLb
 1oSWP3142gPfg0c6Ahn9SSrXIWaGsvC8V1csYS+fTA5MHCXIoT1JTzKjP Q==;
X-CSE-ConnectionGUID: XRm4cx4NREejmYhuWuTxMQ==
X-CSE-MsgGUID: tt/ixMo+Tv6zkBlMWjlEkw==
X-IronPort-AV: E=McAfee;i="6800,10657,11468"; a="52547586"
X-IronPort-AV: E=Sophos;i="6.16,246,1744095600"; d="scan'208";a="52547586"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jun 2025 04:51:42 -0700
X-CSE-ConnectionGUID: SMHQXkz3S0eoRuoEtgzepA==
X-CSE-MsgGUID: 85dkFmIGS2i1LEwcDKu10Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,246,1744095600"; d="scan'208";a="154896456"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jun 2025 04:51:41 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 18 Jun 2025 04:51:41 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Wed, 18 Jun 2025 04:51:41 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (40.107.223.52)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 18 Jun 2025 04:51:38 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VfJ6P+fMK9vgd4d+ld2Z0a4dW5hzPNIwtKlvEFIv+IV1DaUNZu2RoW++hmgbzL+kneLFBCh24fXKND3HwzBU2kn48H6MO9LjmKGLYiKCPu9aqlfhjskZVrpAlRMP0YxCSN66NnCfUTLvEWBWt8hvj8GiIbHY93r7qB9S6aqCcJ9uGdiQu22HgYX4sMc/bxPI8O658lokGOaoQIHqBRTDZeHUpfdoVclHDkV7hhsCnv+CZUVhhxMExlhAy+3kHoBqoODZGK0WHaWjp85BynxC6KiYrvGHT1+dJOEe1StcGs2HAxASb6OTvzQPnVlGFYCcOHwL7jQTqLrEvyYT8xZ1wA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Jr1neE/cKSvLJtP0tY2FxSs1GjuhtSV5G4/fcBMpXis=;
 b=Y/xfzmczzJuBiV/CBBsWqhC0rvqjkeuWzQI4vEgs4s7zqcEDlowAmrHsTk07EPGcpICpcFDTeJUQ8ng+yX+dM8TrGYUlO3AwDHvhL6oMsM+1ZY/oIqkBQe9ooVmoZZ/eOgfvyI0mhYvRE8KhSU8VfdcYjxIAC2jvN/Xzu5QpvuzeYtcTf8DWdpSYRsQKqhh06OpwNby4UCuw3QYsNh1Zv8RaVOkuGeVXHVfmJSt2fsWfdFiJ1rkG1OJRcKSqSWf283Wq+InKwBJqaxy/kjxINgHdnr+eJjDtqB/Dgl/LCBfXcMtkPFs0CW0anpBj+QDUuU0qikPEieg8v1mZMc8YJA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB6909.namprd11.prod.outlook.com (2603:10b6:303:224::12)
 by PH8PR11MB6705.namprd11.prod.outlook.com (2603:10b6:510:1c4::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.29; Wed, 18 Jun
 2025 11:51:23 +0000
Received: from MW4PR11MB6909.namprd11.prod.outlook.com
 ([fe80::28da:9438:a3ef:19c0]) by MW4PR11MB6909.namprd11.prod.outlook.com
 ([fe80::28da:9438:a3ef:19c0%4]) with mapi id 15.20.8857.020; Wed, 18 Jun 2025
 11:51:23 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Date: Wed, 18 Jun 2025 11:51:18 +0000
Message-ID: <DAPMY7MM04R3.OWBQC9Z8G12F@intel.com>
CC: <igt-dev@lists.freedesktop.org>, <kamil.konieczny@linux.intel.com>,
 <andi.shyti@linux.intel.com>, <krzysztof.niemiec@intel.com>
Subject: Re: [PATCH i-g-t] lib/i915: Avoid non-canonical address dereference
 in gem_has_relocations()
From: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
To: Krzysztof Karas <krzysztof.karas@intel.com>
X-Mailer: aerc 0.18.2-107-g4f7f5d40b602
References: <j6ll6li2qmkk3gwamz36s4saf3ehp6qutkxl3cc2sbm2i2ujsq@5xel3p4b5cw6>
 <pljh6w3ikkehzyhdwvey4277vklqffg5dfledtm3hcuoer6hzt@atyhhoyamrjm>
In-Reply-To: <pljh6w3ikkehzyhdwvey4277vklqffg5dfledtm3hcuoer6hzt@atyhhoyamrjm>
X-ClientProxiedBy: DU7P194CA0009.EURP194.PROD.OUTLOOK.COM
 (2603:10a6:10:553::8) To MW4PR11MB6909.namprd11.prod.outlook.com
 (2603:10b6:303:224::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB6909:EE_|PH8PR11MB6705:EE_
X-MS-Office365-Filtering-Correlation-Id: 17d4ed92-1fd3-4e30-8257-08ddae5e7278
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?YnhKOFRSeUFRM243RytqQlZpbHRHcWdIY0E5R1V5M0JZRnEwNWc1eDhua0NJ?=
 =?utf-8?B?M1dQN1oxQlZackVzUkppSStsMndoRm4rQm1rV1Q3dlFlZEtZZkc1MnRZZVh6?=
 =?utf-8?B?RHNlYi94WGtQd0JMTXEzcHFqNDJMK2pQdyt6Y3ZCRCsyZ2VuUk5CZ1ZXaFBN?=
 =?utf-8?B?ZFN4Rm5rcmFDaWE0eE1sTEplYjBjZFVaMlB3ZVJlNUlMVy9sTTFaUzJzK0s2?=
 =?utf-8?B?K1NzUUVXOVBCUi81bmJ2azJrUTVZT055V1RWeHpvQkppMXZIdWVLU3dNU3FE?=
 =?utf-8?B?RTNIZDhhd0Q2L2d0SC84Mjc1aTRHTFViWlJOMDBmRWlxYjRQMjF3bzhZWGxu?=
 =?utf-8?B?YzJLc2YvYm90MWdITXBNQnBsRmtJdVg5Rll0dUNVaGRhc1hEaW1jZGM2MThV?=
 =?utf-8?B?YlJoSVdSd2Q0N3NDc2dyWVg0UDBzZEVmdW12OHNuVkVlaGkweTJsY3h3eUR1?=
 =?utf-8?B?NVJpV3pJYXJXZXlZRW5kUnBJUU5UN2tDRVlQNlNVVW45Q3ZET241QUF0TVoy?=
 =?utf-8?B?YzhLa2xtcEhtaDlSUE9pNlZLNXczS2szdHpKelN2WTJZVXpDWm5nQ3VEQ3Jp?=
 =?utf-8?B?SHN4TG42RmlEOS8yNDgvakh0WnlWMGVsaU9EVVRYNkVHRWxZZzl4STBFcVVZ?=
 =?utf-8?B?VjhvMHBJZmNxT1NXNVErbWhNdXN0ajU1aE12OTFyWDZNR1BJSE5JLzBGa2F3?=
 =?utf-8?B?SHFKaVZ6YW03NWw4dUM2bEwxVFFrakZrQ2g3Y25zRThYNVJSbXVFUW90a1Y5?=
 =?utf-8?B?SS81dUc4dk5nK1pOVVY3SjMvVlFrVW1FaWk1aFY3YUYxV1d1YkM4blpzRWxy?=
 =?utf-8?B?Y0oyQlJUYitqZkR3NlJ5TDRNZmF0SUZUYkU1eWx3MFlqMGJXZWM2YVpUOCtQ?=
 =?utf-8?B?bkplRFkxUlp5K0M2ZnAzM2FEVGxtSURaTGtRajdWYmxWS1ZITG5OelpTb3Fu?=
 =?utf-8?B?bU1EcTN2N0JQcDYwTW5WVHFTMVZrcm81MTJDTi9nSEZzL2ppc2QyWUUrZmov?=
 =?utf-8?B?VTlNdTI0S25CZXQ4T0JVbnFRYkJ6R0p5WVJsbVh4L1lEeHRiQkkra0Z4dXVz?=
 =?utf-8?B?elFqNFlIL2ltMTN1QlgyU2QyTVF0NEtTMzlaUElIK1h6OTdMSjdhN2Evc3Nm?=
 =?utf-8?B?VWFaMEV5ZlREQTkxczdWYWNhem1tSnNZRzNvSnNyMVd4a1F2Q2lpODZ5bGNv?=
 =?utf-8?B?RDJsMmtncXNUNFhPN0RQRWtZMWJKUnBLZysyM3p4WEJWeVR2SHdNaXF4cmIz?=
 =?utf-8?B?OWhIUjNNdkdNUzlrN0d1cWg0OVRaSzB3aDNja1d5VDU3UWlvb3J4MUlaWUZX?=
 =?utf-8?B?RTBjbFcxTldLRWJsL2xwZkh6WHlFdUcyUVRTUlJWem9xUkRoR09ZVnBiSWoz?=
 =?utf-8?B?ZUE1N1NnUjkvRUxObFVGL1Y0SHlqK01oZU5IWVZyT295MVZ6YlQ5dDBmNDQv?=
 =?utf-8?B?c0ovSGtQejYwdFRvK0JWNWlZM3NmQzcwS3IwQTRKTTVMTEtjYXA1cWkwZ3g5?=
 =?utf-8?B?N2k0VW02UUhoU3BYRTV2bmI5K2Q1eUJCT1I1QjBYTkFZS1lCNGd4aTg2aTJK?=
 =?utf-8?B?Rmoxbm9qY3FKbHNvL1Jpb2E3bnFEb2FwRWpmZ1ZVY0Z5T3MvQVJ2a0l3eDVU?=
 =?utf-8?B?eklyNFk2NmtHZktFMFJaUm0vb3NHMG1DUzZ3ZllyS2FvUURWUGQ3OE5laC9v?=
 =?utf-8?B?YmtaOFB4bnVnQlI0V3BqOVpqVDJjTUFkTXF2WnZLNk92dzlHNjc2ZFRBWGlL?=
 =?utf-8?B?ZDlzNCtpMjJVZ1JwOGh4N0dPMGNlTDh0am5mc2I0S29FaFc1T0wzREpSZFZu?=
 =?utf-8?B?ZkdaclRYKzlpclBwa0NFR3MybWozUEYvYTdrOFdnOHV2Skx6OUsxeGhqZFhP?=
 =?utf-8?B?QnlYQmhIUHJlV0N3SmdJSkM2QmtGQjYvVWdCVlUwUGx6dG92c1hNYnIxb1Zu?=
 =?utf-8?Q?8JTNxLEhvPs=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB6909.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MjV4SFdjem1mMU1PTkNYdkx0VWFuRS9GK0pYeHgyaEhHQU1BY3R5WmFYekRT?=
 =?utf-8?B?d2JhL3l0bTEyTEkxYml0V2JzY2p0emlNOUgzUmxWNjBHT3AwYm4rcFh2VzRE?=
 =?utf-8?B?ZFQ4UC9KblpLMytRUEdkdFp4aWVFWFZBZjh3MExOa0VGS1A0SHpodmJ3MzlZ?=
 =?utf-8?B?cjRWLzFhNDV3V3F5YUwyYzRhK1E2czI4Y0p2dWthbHhBTWczYTdkeDVBSDdj?=
 =?utf-8?B?Yy92ZjJCVEFqRms5anEybUNXUktIUkgyb3hEdTI3RzQ4NFlUbTg2TlE5OTNy?=
 =?utf-8?B?UnRQZkd4bUtBbUg3MndsclNlUkJPbzNUZ3pwRm5jQTllanlmYlBuM21sbzdy?=
 =?utf-8?B?V2hCQXdoVDFVK2ZFSGhBQUsySnVBd1NiTkVjSi96Z2xnMnpZR0JMWm9HQUVy?=
 =?utf-8?B?SWVUNFlYUTFyeXhEZUorYUhweno3QUQ2bTJpSVhmeEJQQ1BrU3JrbGdqV0g1?=
 =?utf-8?B?ZDN6YVdWMUViYXJzTlgyQ3prMUswMEJGSmFMRHVjbWRHZlg2ZjUxK2NYOW51?=
 =?utf-8?B?SU44TnRXZ2pZUVNXZVAxTlFseFZlRXg4NzFQMjFKeXpyK01ITTRmUEFxblpx?=
 =?utf-8?B?M21GSEthVklFaVAwVm5XUkZpWCtidDhxb2p6QUtBZStrMmxmSEU4RHVXVFc4?=
 =?utf-8?B?TCtFTytBd3RjcUY3SG5SeWlnazUwSVdTemJPZ0Mway9UdWpuaEMrMXRoS005?=
 =?utf-8?B?aTd2SEFSRnJiR2ZEYWRJbHNRbVFvb2MxQXlLYVNDR1FWMUtpVldTM0c1dXN3?=
 =?utf-8?B?RTJ0SGNjR0FKc0J6QlY5SnZKa3NSazAzdElobkR4WER0d2JaeUtlSjZKRElx?=
 =?utf-8?B?K1FRYlBYRWZQK2xqK2c4MnlTdmR2b3hkdnpsRlF3UmtNeHY5ZlJSZTk4ZDM3?=
 =?utf-8?B?U1ZKL1VyWDAwUXY3dk9CaWFpV2M0MjlOS0xnMWJkL0FhaUlvT3RRaTBvVHVI?=
 =?utf-8?B?Z1dPZkhZaGNESWphdkdNYnZ2eFc1eDkrVmJyYkc2cDZIU2tKcnJKUWhZYThp?=
 =?utf-8?B?M2dqcE9Eck92RG9CdXVPQVJjYkF1SURzQmtRYkw0VnJha3EyQUdQYll2WlZE?=
 =?utf-8?B?amE5aDU2VW5tY0d1ZUxtUWh2YzhtUEh0ci9lUkFIcXdqVVMyaUFKVTNHb1Rr?=
 =?utf-8?B?OU9xSTFjMCtyQk52b1FmODdaUm9tOTVjS0lJRk83V1BqZHM4UVpLSFl5Ujgw?=
 =?utf-8?B?SFJFNEx4cUF2SXZIUVdhMmFySnJOTFEwVWt5aitnQm5wQWpDSkFqWVRmNG1O?=
 =?utf-8?B?TUZUNE85S3p0czZuWGtDNUh6eTZWdE9uOHNubTlldnhnWjd6NVYyakpSRmxz?=
 =?utf-8?B?S1ZmeXJ0TGR2R3NUOEhlT0NBY0VhaXVPV3JBTFdncTliUnF1aGxYN3g0SGZE?=
 =?utf-8?B?dnVpazBhRVZEUW42UkF6L0VXSkptc29nY0V4Yk5oQm52SDJEUkZBNGlvZkg1?=
 =?utf-8?B?OThYcVoybEc2VHdpVkpWVXhjRThXNmVqMlFuSHR6dklObzJOTHNFM1ZaMk9Y?=
 =?utf-8?B?Y0c4dG51Zlllc0pwem5aL05DczZQdEM2eThpVjlacFNMMDZEYzJnZmFUNEFy?=
 =?utf-8?B?TmtvcHZLbVpqYnl6SHAzdEI3WTRuZ1BFUXU3UEl1WUNsaEZNUGc4OUpodFpm?=
 =?utf-8?B?SXQ4OWZ2SlRLZWUvcTNwSXJZNm03ZHRKblpKQzFJaldpNWVJemRVREtxeG84?=
 =?utf-8?B?ZXQxUVY4aW5UZW9RczE4bXhpbERNckxhQ1BJUmE2Yno1a0tmRFNuRWpWQ0Uw?=
 =?utf-8?B?UHZ2eE0vWW40Rzg5MEsyNTY1QW5nSkNOUjlpZkdJWGtuSXBic2l0RkNDUU1E?=
 =?utf-8?B?NUtzM2pkdGt2bzM1WUVBWENhbGlmZ3U4SlNPMnR4NnB5dWlkVFhxdkpFTlBH?=
 =?utf-8?B?Z1FVMnVGNDB1MDJPcWdNbVE5ZGgzOXdWYnpkYnQzZ05pdStEV2RITlFuaTVs?=
 =?utf-8?B?OWU4L010dDFRc1ptNGNCWHZyeGx3d0M4ZmtmeEx1ajJjVGhvK3ZkVTB6TG1k?=
 =?utf-8?B?NUUyQ1pBOTgxZnpJYXFVUHBjNWY1UkRIU0JsMmlhN3lkWDVrQ1lMRTlHMG1G?=
 =?utf-8?B?OUY5VERLa2ExUDNzNTQ0OFlob2ZEQzZUQlRIcGxVa0Zkc2xyL0pIQytrVE41?=
 =?utf-8?B?NEwrYmtnMXhYdEJuOHBkakRBMU9xc3J1aDl0TURZTnkxcDM4NWQ1a3NKb1l4?=
 =?utf-8?B?R3c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 17d4ed92-1fd3-4e30-8257-08ddae5e7278
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB6909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jun 2025 11:51:22.9105 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7wn2fTPrD7slIfnEfG8xxDDeDMziSJXYbHiQsjTX5fDXa/9RHaDmmjv0EPKdzIpHzT+h/lvUWWDOBsKTvXIGyLIlIEiyNPeXXJ23ogfgYmk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6705
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

Hi Krzysztof,=20

On Wed Jun 18, 2025 at 11:39 AM UTC, Krzysztof Karas wrote:
> Hi Sebastian,
>
>> Fix a general protection fault in igt@gem_exec_big@single caused by
>> passing a non-canonical address via relocs_ptr. The test previously
>> used a stack-allocated relocation entry, which resulted in an invalid
>> pointer being passed to the kernel, triggering a crash.
> Did this happen as a result using freed heap allocated data?

The issue was triggered while attempting to access memory.
Just wrong pointer.

>
>>=20
>> This patch replaces the stack-allocated `reloc` with a NULL pointer,
>> ensuring the kernel correctly interprets the absence of relocations and
>> avoids undefined behavior.
>>=20
>> A corresponding kernel patch to sanitize user input for relocs_ptr has
>> been submitted to the i915 mailing list to further harden the interface.
> I noticed that the mentioned patch has been met with some
> pushback from the community. If you believe it is required on
> the i915 side and worth mentioning here, then please move this
> note into the section below "---". Otherwise, please remove
> that part.
a

Sure, gonna do this in v2. =20

--=20
Best regards,
Sebastian

