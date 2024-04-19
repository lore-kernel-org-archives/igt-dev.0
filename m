Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77FF2C4345F
	for <igt-dev@archiver.kernel.org>; Fri, 19 Apr 2024 10:26:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 083A910F5FC;
	Fri, 19 Apr 2024 10:26:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gV1Stqs4";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A0B6110F5FC
 for <igt-dev@lists.freedesktop.org>; Fri, 19 Apr 2024 10:26:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713522399; x=1745058399;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=XcKeBRYOqXHnx6DTWT9zVwZiAUo9iVykWuIgdFtnAHk=;
 b=gV1Stqs4mYhv76xtePIesHuPakxJ1hJTSX85+DhmjAFxlQDUrVz3AWVu
 ZzfG8HYWWRip7qu7EYx+XdCxgeRsvnrX7dFH+y1TbF5ZdEJDoMKFybGsO
 vbOL9dvnUYzNjWLpvnbsyMXVKpRzpx0dJO7M4n+0rMZxXv0xsbRHayJ5h
 AP1ZKXx5wpcB4zaHlIT7vlgCUk+2bNIUhkTykVvmmsTrIPOap4YEi4D0f
 AZl3IO+DZFRfIJZU8TGYum/b8VIi5OwhuBgpTMZ/R/mz7R/WZZjj+7H4f
 sNiQvoORfws9dwV8KM/woLleBDsXdWsN2djgSBBiPyW3nnNUIJXJPW2Qe g==;
X-CSE-ConnectionGUID: QIKfhsL7Q4u9/jeSAkEXZA==
X-CSE-MsgGUID: uGimMUAOTTyiIOiTjFSLbQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11047"; a="12898668"
X-IronPort-AV: E=Sophos;i="6.07,213,1708416000"; d="scan'208";a="12898668"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Apr 2024 03:26:38 -0700
X-CSE-ConnectionGUID: BphECm7xSEu8lI19F1gakw==
X-CSE-MsgGUID: FKf0+SeBSkm8CNCn3+8MQg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,213,1708416000"; d="scan'208";a="23791297"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa007.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 19 Apr 2024 03:26:38 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 19 Apr 2024 03:26:37 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Fri, 19 Apr 2024 03:26:37 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.169)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Fri, 19 Apr 2024 03:26:36 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dE7C51aZ2e01x/B9IyUvIE9ql0nZrfBOqZnKjn+rRueHoK/6MEzMZFIoQD+UwwzT6rYNhvzah5dP5fAVLkgLghW/fMnAN+S55/C8u+uLy+HSMfGLy3Xn3ouDOWb/maEPpAuC7tUO0DqPGPTysysKIPKKImcKMFHLuJddo3lesgi4habez1TVNLiHFijTygMdogxc7142t9gXExg7KqiTT7/t4jOIwqR6QHuyFDv7vBWNME+3vEa512zdg+lPG4cxrryC0LF/CZ8dRkif5MT7CLwYWT9pBpgpHVQZWyk8z3ugW80+mE27ONZ6OHWKPkIPOCWUHNetN4jJDtKdjrI7vg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rKNgwPnJMqgUVUa516q33zkOKWss+am/SE/FdXPLbpA=;
 b=jIoX6HxQsRmsF7X2pmhxp2LEDkn0xaZP08d5iWJioWvrECtLcVv5K7N1dns6ictC5ldHIpKoX2iUCM9IlnNkFvMLkkQ2D0C6mB0O1LWy/NujOUn9xrmsOnVMLbNCrEE/bKB9h0d2+TQMDD5XP/mp4+bLdRPmqqc2fSdaKXYo2nOLY2X0LtEEwThhEnh1d+7fkZKy74tQOAhTq4pDstc/roLF3iQhp1dbr4L6xUAGHjGjA21bW4dOyq/DAv9D0T2qkrx/1Pz8RQWC+g3r6uXBF8KX4bP2iFaeX8+1Gn1+irZyYjeWT/KLKcMKIFyDCh6M/xFgzpqoAY56RrOcWM+KZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM8PR11MB5719.namprd11.prod.outlook.com (2603:10b6:8:10::6) by
 PH7PR11MB6930.namprd11.prod.outlook.com (2603:10b6:510:205::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7430.46; Fri, 19 Apr
 2024 10:26:34 +0000
Received: from DM8PR11MB5719.namprd11.prod.outlook.com
 ([fe80::f58b:e2d4:835d:d592]) by DM8PR11MB5719.namprd11.prod.outlook.com
 ([fe80::f58b:e2d4:835d:d592%4]) with mapi id 15.20.7472.037; Fri, 19 Apr 2024
 10:26:34 +0000
Message-ID: <34c9cf2e-ac0c-42bc-8b18-b6ec1728a908@intel.com>
Date: Fri, 19 Apr 2024 15:56:12 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 4/7] lib/igt_kms: add support for forcing bigjoiner
 on particular connector
To: Kunal Joshi <kunal1.joshi@intel.com>, <igt-dev@lists.freedesktop.org>
CC: =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>, "Ankit
 Nautiyal" <ankit.k.nautiyal@intel.com>
References: <20240419064001.2401850-1-kunal1.joshi@intel.com>
 <20240419064001.2401850-5-kunal1.joshi@intel.com>
Content-Language: en-US
From: "Modem, Bhanuprakash" <bhanuprakash.modem@intel.com>
In-Reply-To: <20240419064001.2401850-5-kunal1.joshi@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN3PR01CA0099.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:9b::19) To DM8PR11MB5719.namprd11.prod.outlook.com
 (2603:10b6:8:10::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM8PR11MB5719:EE_|PH7PR11MB6930:EE_
X-MS-Office365-Filtering-Correlation-Id: 3d5e762d-ef80-4771-ab35-08dc605b2fba
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bHhPOVZTam9LY2RWVEtzYUt3ekNHU2FzQ0FCT1pBMEgwdUxXSWNoTmJJdjR0?=
 =?utf-8?B?a2cvL0I1UW5LL2V6NmxEMnF6TUFsUHhwMkEzL3pwdEd6YW5KQU1vVHcrY0hn?=
 =?utf-8?B?YnJVcDBhYTB3cjFOS0hhOXZaaElQWDhVZUpGK3VPYVBnNXhWQkRvQ1oyTUo5?=
 =?utf-8?B?OWV6YXoxU2c0eng4RFNIVXhCTVlQVmJzMWYyNDN4cjl4azRQS05DZ0p0cENK?=
 =?utf-8?B?UlhJN0pBeXpKZHhISkdMcW9zUVdxaHIzWitkK0UwWGVybnlUNHBCOXlZSjFL?=
 =?utf-8?B?amp5bEUzN3BlekV3ZkRmOUNLdmJYM1EyWDFHeU8wemFzMCtRZG53Q3JQL1dl?=
 =?utf-8?B?eU1reUowNW9QR0JKVnZPOSt6WEs3dWs4T2RlU2FVVy85dzVkdE9lWHdqdHJX?=
 =?utf-8?B?M2JlUUFZMmNDNTBHMUpoZEFrUlNyN3l5VXlTTHcyMFd5Z3QzSi9YUDB4S0sz?=
 =?utf-8?B?SGFLS3pFWGdEOS9Cb09VbVMzQTZ6ZTVnQjhCb1pvbHBRUEZMdGx6N2VWbi9m?=
 =?utf-8?B?bzcwSFVEVDdTcVg1NGtaTDUzNVFCd0grVHlWZ0ZyT3VES3gySUhHRXJyQ3My?=
 =?utf-8?B?c2RlK1pUK0MxOGhXYXRhL1UzZ2tvU0Fld1lkMTlRbjQ4a2NiNDRpSVNKRmNO?=
 =?utf-8?B?NGt6dHNuUURSL0RnTldFSmYxTDA1dlhPN2tQZi9Od3I2MmozNGJDZk1Zak1P?=
 =?utf-8?B?ZFN5TG16UmtZVXBmQWppWE5KODhjSUtXanRUbDF5QjZ0dmxhaUJjTW5yc2Zj?=
 =?utf-8?B?QnFvbE9SejhzRnRpcWtucG9yZ01xSGZ3U1R6T052NVU3N043cXRlOXBpUG1Y?=
 =?utf-8?B?Y3FjSSt3ZkxFamNrQTVlM3Z3bnpUQzZCRTQ4cmlaSjAwNmd1Z2hJb1ViWGVN?=
 =?utf-8?B?WVI3MkFHWllKY3hYM2FjRHZURUtWOVlXSGVzVXVzQ0crcjhmL0lmNUszZXhm?=
 =?utf-8?B?SndTZUEzWUtROGkwa0hSand5YUc0c1dYTnp5emJjV0E3aWJ4ZGRVeWxETWVy?=
 =?utf-8?B?UDZFNDJLRDYxMjY5SjdxZ3hzU21HM29ucCt3bHN5YmwyVFZBOC83UldIZ1Q5?=
 =?utf-8?B?TDVEWnNrNEZHMFdmYm1MM3ZBSTFqK00rSFlZVlhURTdKWDkwczNGNEtNdG1H?=
 =?utf-8?B?b3JCY3dFNHVaTEJ4MUZMVjR0UG55T3J3dTY1WncvQXhobmVvaW5kUXZ0REpU?=
 =?utf-8?B?RkwxTkR5KzFhdU9vcnl6L3pzQ3FqdXA3ZXRSTnhjZzJLdzlFcURqbXhvdzlG?=
 =?utf-8?B?UXJFeVN0RnZIMkJIZGxpUGx0bS9QRGFJMXFJQmtlQ1JjQVpKMWhzemhuYlo1?=
 =?utf-8?B?N3E3SHp3T0M4Nlp5QW94S2xaOFhURVA2WFRrUTluS2t3VzgvRHUwQVJUMnlj?=
 =?utf-8?B?aTg1M0l5U2g5SDdTdS9TekNqemRUT0p3SEJCbG16U2VkUkZYQm9sUUlPbit0?=
 =?utf-8?B?SGhwMjNRejc1VjF1a3FQaUJtRzZBSUJtMm5xck0xbTN3RmJ1KytnaGtybnpO?=
 =?utf-8?B?MVplMWx2eXF4dXQ3SENTTnZCV09IMTQrWDc4L1RyWVNNWGMrZWt2OVphZ2dv?=
 =?utf-8?B?K2JiZ29jQzhUNktTK3JMMlpadWR5N1A5NGZqSHJMMjVFclNaMzZGVEpoSGxa?=
 =?utf-8?B?SlZoTUUxbUFVODcxNTN4QThHSUE4alFXYk1QdmhwblhnVkVScVhVYk90ck9R?=
 =?utf-8?B?Rm5SN3N5KzRzT2JCSXlZUjlINmFiMDk5QUdxUU1QcVFCaHpqV25obVZ3PT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5719.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(376005)(366007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SEtyaFFuTTFmbklqQVdJajAyK2pYWmRIZktmd202N2p5dGpxWnNXVThtM1JP?=
 =?utf-8?B?Q3lqcEJhNTdzVlRwTGltMUVaNWhKdFV3YWpwOHVwRm1QQ3hlVDVRaGJBcTE3?=
 =?utf-8?B?VkF5bkZYRXE2dEpsZHBRelJXOXpudkUrdjkyVGVKZVU4UHhLaTFOZndFNFdV?=
 =?utf-8?B?c2s1bG5JVHV1SzFJNFNmOHZEWEVjVmpLNFgwREYyTVRzWlhqL0UxWmFNVklT?=
 =?utf-8?B?NURraVEwUkowQjRydlBqMzZBU010ckh2QktsMnNsVERRYkNRT2JJQkpWWjV1?=
 =?utf-8?B?K3RsbjJiTGdsQkpRcGFhQnJkUUk1amdjUmsvL3NUZFk0Q1RQbHNDWjVWbFhZ?=
 =?utf-8?B?QU9KcUlwQkFFVDdndFBNQjNTMldkc1E0bjB4QmtGTDVLZUVXbnFMTG02bkxm?=
 =?utf-8?B?L0QvUnZBTG9IVFhCZ1NuTURHWGtzdjJhSkZJaDAvMFBXSDU0ZlJpNlpzdS9G?=
 =?utf-8?B?V08wMDJ3eFMyR2hTY0NUR2xCYU8xaTZabWNCUnZYd3JFRFgwb2QyY1NKRElF?=
 =?utf-8?B?Z1U2V3VFdkpCWHM0Z1pxMTRNcC9nYUdmL2ZuUzcvMjEyVGJXOVg4RGVBSUJi?=
 =?utf-8?B?MGdGdlBwdXpmeUVNMmNzZEEvU1lsblBsK09FZTVPS2xWUEFoVVhCZHNmT0xI?=
 =?utf-8?B?bmFncVEzWVdpWE03QlR5eTZacW1mUWUyVnJ5dXcxQm5lZDNzbUhJQ2w2Q0Jr?=
 =?utf-8?B?Rk0yU2dvRlJMOCthTGJ6bU5DTkVWK3NVZkxGSzZxa1hSNTNvNzIweFlxUkI3?=
 =?utf-8?B?L3h5QWdVSFUwb2FlakF5THhUenkxdUhSM3hwcGRVd0JVdTM3dVowdmptRnRR?=
 =?utf-8?B?aEFWa1hVR09hdS9MUWk2K2NJOTJFSmVhOXVGNjJ4RUpkakFPdi9XUkE4aUJ0?=
 =?utf-8?B?bkM5WWIwUjhVc28yNXhSK1NsdmkvejNsZ1hrRmpwU1c5TGNURlljZWYzbEpU?=
 =?utf-8?B?REdjeC9PY0EwanhYNHMxU3ozSlBQMmxQZFBTMzBpbjU3Q0p5Z3B1dHZoNjZG?=
 =?utf-8?B?NFFkU1U3NUxyY0FBSzMxanF1SHdmcVNsNlUyMUtHWE5WQTFmdkozL0VQNloz?=
 =?utf-8?B?aTRQNitmMW45QytOOEhqZXkzZVA4QkFJSkMzVkVVWlEwVFhuUEpnNUtUb3lY?=
 =?utf-8?B?ZFJzVjBCT1lvalNPNWZSd2t4clFpRmpZOG9jTzZydGpTeWxBTmtiRTNMSlI5?=
 =?utf-8?B?SFNxWlBCMlFSWENXM0U4R0ZUNXhWbDFLakFuWFYyNzlwWkh2ODNWY2NKK2VY?=
 =?utf-8?B?Zk50anlrVU5xMEdzN0FNSHcwby80SlB6dW1iTW5pOWQxdCt4MVRBOHhXR2hs?=
 =?utf-8?B?UmIrVnJoQXViVGgyeTVYQ2F5MDdGL0Jua1g5VTNYSGNOTFRjQnd0VTBpQ2VF?=
 =?utf-8?B?TnNRTXRPU0IrUjZQM3pNRGNCYmtqWTZETkFjTEgxVldCY2RUVzF3VWIrLzFI?=
 =?utf-8?B?bzlxekdZSDdFemY2R3ZaS2dWL2xGV1ozdUNIMzRlaWRGVXJQME14T2p2cmQ0?=
 =?utf-8?B?NnFXVWlKeEp0WW5JNVozelBYZGV5dGw1WHhsM21PNDhLREFNSjQ0enlnOVZZ?=
 =?utf-8?B?SzlUVWZ2c2s4NFl6WnZ5OVVjZWY2R1NBbHg5TzhLSkowMlY4RkdiNUMzdm1V?=
 =?utf-8?B?TmZ3ZkMvZXVoTjJEamhCZGFmTTA1NnNQM3BHVi9pRHhtU2R6dVp2bEZ4S2w0?=
 =?utf-8?B?Zm9hSFhDWm5mT2RweTBHZitldGZMRkdyRUFCb1VkTEcxT0Nydm10cGM0cDVj?=
 =?utf-8?B?Nzhja3JrZnNnei8rR1FyLzFZK3l6dElkSzkzTE42aS9XUGkzMUY1WWlaWmtP?=
 =?utf-8?B?Q0JRZmg1K3BSR1RNVUtwYXpIaVl0LytFVXhiODJ4ME1qcGNyVkdCbDBNVVJX?=
 =?utf-8?B?QnVMcDYwemZ3c3BGeUZ1Nk43eWluNCtqazFJK0twbVQ4RDBESkphZHpwajhz?=
 =?utf-8?B?SlNzM2huY1VDK2c3d2Fqdk5nb05uRXovSlJHMHZJMkF6Snlvb3BTUVpuZGdt?=
 =?utf-8?B?NlV0Ym0rRUt3TGs2bklJV3Q0dG9CMGxzejNpMzlhSzM2SDQzVzBqK01VNmkz?=
 =?utf-8?B?Z3VvYk9IUEM3VmRKdFp2QjNXM3Z1aGtSUWgwQWUvOHg4d3gzYTc4SE9neWh2?=
 =?utf-8?B?VkVtcWxLZEtnQkZGMlVzK0FPbXNoRWx5R2tseGNBQ3R6aVFVSUF3Z1BROGs2?=
 =?utf-8?B?blE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3d5e762d-ef80-4771-ab35-08dc605b2fba
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5719.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Apr 2024 10:26:34.2169 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UNGvyusdEhSAUt/zXVxycKTb7HPfZFtLRI8wrrT4Fk8k/VzJOoKJQN/FLpy6XFyb2QutqOBVdhXiXUYoKZaK/+vH/d1Cfka+vWK8koN7YSc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6930
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


On 19-04-2024 12:09 pm, Kunal Joshi wrote:
> add kmstest_force_connector_bigjoiner function which
> force bigjoiner on provided connector as well as resets on exit.
> 
> v2: remove redundant function (Bhanu)
> 
> Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
> Cc: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
> Cc: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
> Signed-off-by: Kunal Joshi <kunal1.joshi@intel.com>
> ---
>   lib/igt_kms.c | 69 +++++++++++++++++++++++++++++++++++++++++++++++++++
>   lib/igt_kms.h |  1 +
>   2 files changed, 70 insertions(+)
> 
> diff --git a/lib/igt_kms.c b/lib/igt_kms.c
> index 378c97f88..324b0527f 100644
> --- a/lib/igt_kms.c
> +++ b/lib/igt_kms.c
> @@ -1607,6 +1607,32 @@ static bool connector_attr_set_sysfs(int drm_fd,
>   	return true;
>   }
>   
> +static bool connector_attr_set_debugfs(int drm_fd,

How connector_attr_set_debugfs() is different than 
connector_attr_set_sysfs()?

> +				       drmModeConnector *connector,
> +				       const char *attr, const char *value,
> +				       const char *reset_value)
> +{
> +	char name[80];
> +	int idx, dir;
> +
> +	snprintf(name, sizeof(name), "%s-%d",
> +		 kmstest_connector_type_str(connector->connector_type),
> +		 connector->connector_type_id);
> +
> +	dir = igt_debugfs_connector_dir(drm_fd, name, O_DIRECTORY);
> +	if (dir < 0)
> +		return false;
> +
> +	if (!connector_attr_set(idx, connector, dir,
--------------------------------^
Passing uninitialized idx?

> +				igt_sysfs_set, attr,
> +				value, reset_value))
> +		return false;
> +
> +	igt_info("Connector %s/%s is now %s\n", name, attr, value);
> +
> +	return true;
> +}
> +
>   static void dump_connector_attrs(void)
>   {
>   	char name[80];
> @@ -1690,6 +1716,49 @@ bool kmstest_force_connector(int drm_fd, drmModeConnector *connector,
>   	return true;
>   }
>   
> +static bool force_connector_bigjoiner(int drm_fd,
> +				      drmModeConnector *connector,
> +				      const char *value)
> +{
> +	return connector_attr_set_debugfs(drm_fd, connector,
> +					  "i915_bigjoiner_force_enable",
> +					  value, "0");
> +}
> +
> +/**
> + * kmstest_force_connector_bigjoiner:
> + * @fd: drm file descriptor
> + * @connector: connector
> + *
> + * Enable force bigjoiner state on the specified connector
> + * and install exit handler for resetting
> + *
> + * Returns: True on success
> + */
> +bool kmstest_force_connector_bigjoiner(int drm_fd, drmModeConnector *connector)
> +{
> +	const char *value = "1";
> +	drmModeConnector *temp;
> +
> +	if (!is_intel_device(drm_fd))
> +		return false;
> +
> +	if (!force_connector_bigjoiner(drm_fd, connector, value))
> +		return false;
> +
> +	dump_connector_attrs();
> +	igt_install_exit_handler(reset_connectors_at_exit);
---------------------------------^
This will reset all connectors, Instead of resetting all connectors I'm 
expecting to reset a particular one. Maybe we can take this as a 
separate activity.

- Bhanu

> +
> +	/*
> +	 * To allow callers to always use GetConnectorCurrent we need to force a
> +	 * redetection here.
> +	 */
> +	temp = drmModeGetConnector(drm_fd, connector->connector_id);
> +	drmModeFreeConnector(temp);
> +
> +	return true;
> +}
> +
>   /**
>    * kmstest_force_edid:
>    * @drm_fd: drm file descriptor
> diff --git a/lib/igt_kms.h b/lib/igt_kms.h
> index 6d13e5851..0abf450c1 100644
> --- a/lib/igt_kms.h
> +++ b/lib/igt_kms.h
> @@ -262,6 +262,7 @@ struct edid;
>   
>   bool kmstest_force_connector(int fd, drmModeConnector *connector,
>   			     enum kmstest_force_connector_state state);
> +bool kmstest_force_connector_bigjoiner(int drm_fd, drmModeConnector *connector);
>   void kmstest_force_edid(int drm_fd, drmModeConnector *connector,
>   			const struct edid *edid);
>   
