Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 822DAC87FCB
	for <igt-dev@archiver.kernel.org>; Tue,  5 Aug 2025 12:24:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E80E10E269;
	Tue,  5 Aug 2025 12:24:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dpQwPZX/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 665BA10E269
 for <igt-dev@lists.freedesktop.org>; Tue,  5 Aug 2025 12:24:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1754396645; x=1785932645;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=G/UG0EhHIJwm23YPtM4ty1l0mi8MjRrtYetQqmPr4lE=;
 b=dpQwPZX/YviHwqT4EfhxTawBi2Y8rE+ZntC/gP/bhJDA33PQOTLnmFa5
 AbjMsu1VtHxhv6rIeXXOPyworzPQkNxtzimb3lvGIi9dl2VaSQ7r/B+eM
 meCYZ7mAVjgzaFb60MQdmQs8f90lnig+lLtYdOZxPCC+WbiCpJ69z01UQ
 KndoGTXZKY5loGyl0aKu+nBLBryOkz2fTWuXMEY+ZC3d6Fzo+aTz3HKW4
 Zn/XncvpBBWB4HV4Yc+TND/R4gtrRtA2McG5h4OCjmVt7KR369AAdaQ5q
 JxidyJAC9mZDeuCSObTjUL6PVHnDDW28xdaNm+/XVZe+TEfXHgiib7G7C A==;
X-CSE-ConnectionGUID: /0nBqvPPSEuK1l7S+iNOfQ==
X-CSE-MsgGUID: TfQGoVS/S5yGt6SAAoBegQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11512"; a="74147995"
X-IronPort-AV: E=Sophos;i="6.17,265,1747724400"; d="scan'208";a="74147995"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Aug 2025 05:24:04 -0700
X-CSE-ConnectionGUID: nOwLgFoVSyirHsCGPDQe5w==
X-CSE-MsgGUID: praaWGCjRkuSG+6HpU8MTQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,265,1747724400"; d="scan'208";a="195316439"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Aug 2025 05:24:04 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Tue, 5 Aug 2025 05:24:03 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Tue, 5 Aug 2025 05:24:03 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (40.107.93.71) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Tue, 5 Aug 2025 05:23:59 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oJV1xY6w5qcSC0Rwto17SwhcyHJ23iP/fhp4O8vibGIs8FJmzZe/toPmGRUFrA8/Uxo7MS8oziPYRvkwLQStOHu74MQQq9b5u+hdrAPL1+CElylPIvc76yPlKfI/vTt+ujafEpD2LbXG3ysYOHhcwQPI6amrNk17Fl0uafrMybFMKtgjpIlACgI8KxDBkOUL8yNDIO1YbfUz06DBDz5a9GRJ1UNh7G3EEu10+B1J6/fVV1khsUzD+Cjr26Hb+url8h2lLUExfvrW7JycAXSa+VY1nc6zL6R73r82Ong+bMPCg3AKaBIg7yQRxIots45zybRmaNJF0KpNlXMO4HB/Lw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Q4rdmgYmYtYhFSiIW3A4Z7LrZJWqGGqEFZTyDfwQJDY=;
 b=hOG/UzOlzcbJP73cJlEEey55IQm9T1QlRDJRcaMkxWZQr43YKufJgujn8V8UJBTcJZXObRNsS2YINQfR3T/udBPsxRNd6HyNNiqN9Agt3MgFsShXkAHBfdhE5kU7G+u2FGbi5crva0NUkvDlzAtRYjsuWhHllcB2xNXciPLPVeiwdLyeXvOHndgwVqG/tuBuabYrvlo+qbJnNHCjLwVVpJidw0/QMvk1D3ynaoeJ40tTM1Zp7CpHyjnvhVWEJRJiHg2cMSWC0ReVv41ZLoSw3JstkY1wCvjCVWAjot20L9g/rF/uvsS+5yT0LZ9Pr/kyq3LBPv3KzZttoBOkwNwyQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL1PR11MB5979.namprd11.prod.outlook.com (2603:10b6:208:386::9)
 by PH7PR11MB6008.namprd11.prod.outlook.com (2603:10b6:510:1d0::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8989.20; Tue, 5 Aug
 2025 12:23:30 +0000
Received: from BL1PR11MB5979.namprd11.prod.outlook.com
 ([fe80::b0f6:fbc:94be:2372]) by BL1PR11MB5979.namprd11.prod.outlook.com
 ([fe80::b0f6:fbc:94be:2372%4]) with mapi id 15.20.8989.020; Tue, 5 Aug 2025
 12:23:30 +0000
Message-ID: <b51ce7c6-576d-4493-b20c-ef08daa9c8da@intel.com>
Date: Tue, 5 Aug 2025 17:53:24 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] tests/intel/kms_psr: Do not test frontbuffer rendering on
 cursor plane
To: =?UTF-8?Q?Jouni_H=C3=B6gander?= <jouni.hogander@intel.com>,
 <igt-dev@lists.freedesktop.org>
References: <20250723110319.2012982-1-jouni.hogander@intel.com>
Content-Language: en-US
From: "Sharma, Swati2" <swati2.sharma@intel.com>
In-Reply-To: <20250723110319.2012982-1-jouni.hogander@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA1P287CA0002.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a00:35::22) To BL1PR11MB5979.namprd11.prod.outlook.com
 (2603:10b6:208:386::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR11MB5979:EE_|PH7PR11MB6008:EE_
X-MS-Office365-Filtering-Correlation-Id: c63f6e20-9c3f-43c2-6f24-08ddd41ae33b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZWlWcmZxaGpZeWdHeU9UMklqV3E0MWg5WUJJWGEzcjQvMUN6R2V0cVNmUmg1?=
 =?utf-8?B?MWd6R1R5ZXZBMEhkWm5FdVdERHQ2bE9IeFJoWnd0Tzl5WXd0MTlocjB1b3M5?=
 =?utf-8?B?S1hmYytsV0Z1Q09VWHhwbm1uZ3JRazhVUjZyL2RxUTBmdG9nV05BeFBxYzdk?=
 =?utf-8?B?TEJvMkNLSXJuSkE5cmhidTc5eDF0NXdVUmRSa28wWGJSQ2VjckxYb3VPb1ZK?=
 =?utf-8?B?RnFTYlJuRDA0amFCZS9CTkFqbTZMaVp2RGRuL3V0ZWYwcGU0eE9Reis1SEVp?=
 =?utf-8?B?dmZyYlBnY0c1cW9hSXU4dmE3QnNEOHZ2cWl4UXRJbnlnWUwxMkdiKzZJTEpX?=
 =?utf-8?B?SWt4Q3NtUEFla1NzYy8xRlM0NFBBdzM1QytNWlI3ZnVKZ09YaVhHeXpKc2pY?=
 =?utf-8?B?VHlxM2pmWGxEbnVZOTAxSnVGOXBnbm45cDVmRzJUUnQ2aFBud2xrY1I3K09v?=
 =?utf-8?B?VmRGZFJWaEhZdWJPdGVLVVJBbDBIQXdub2Z2ZHc0UGpoUjA4QlgrbmY5T2hW?=
 =?utf-8?B?K1FJSllGTVE4eXZGeXl3TnA3Uy9vZ3hPSEk1WThLRWtCSVI5NVhpYWlpQ1ZD?=
 =?utf-8?B?NWlOaGJRZXREY3RQRVNKK21ac3M2ejlCWml5dTNjZUJ5MkdhRFlSRlBpTTM3?=
 =?utf-8?B?enZQZDg4cFJ0VDRVeUU5VEQzK3FKNlNaYjc5U3UzR0hlbVY1dEhaNnRmTzJi?=
 =?utf-8?B?bTU5UmhodldrcFVUbTd6TWZvcjZNejRvYUg4K1BkMmRqbFcyTmNiTllyWmNj?=
 =?utf-8?B?WEZlVnlsdkk0eUM4SG1ySTdZYXFwY0xxTlkxaWgzb1lQY3ltOXRsaDBSMmVY?=
 =?utf-8?B?OUpUakRxVkhuZXB2ZkFYWTdkYkRTdjRBSlhkQVdLVEdSclduU3NhSzIxZkgr?=
 =?utf-8?B?ZDdaSnVUb2l4T0R4azdPVUhBcDNrWnFmMytYL1ZLT0wxWEEvZDEzSDUvdTRp?=
 =?utf-8?B?V1FDcThWRlpTalRoT3hLWU51UVdyZDF2aVB4NmRJK2VFQTJlRG5KdVlKbFJF?=
 =?utf-8?B?N3FnRmJ1U0hhcktPWTdDWGE1OUpMK05hZVhBRTNzYXl2VXZaVUVycHdjelp5?=
 =?utf-8?B?b3A4bzBKYXh4N0UyUDhOajFwYlZZTjYrbTdZMWlqN1VDTzJLVGZMT2N3UHlN?=
 =?utf-8?B?czhNZjZKbTdBK2pSdTZuLzZqbUlFNG9ZQk1IV2UzTC93TERORncvSjYyZndI?=
 =?utf-8?B?QjNYY0hRRWg4TUVpS2tTNDBkMEkrMUdEaWp4ckVhamxHclpFLzI5cU9IbnFv?=
 =?utf-8?B?Zi83Y3RFMmlpZTI0UHVVU0M1eVc3a2FlRDFRdDgvVjFPZnlsTGNiemVEbmov?=
 =?utf-8?B?dnZWMlJjbnVqNTF6N2diNVl1ZUlRUmVZU3FyYmwwcFRRUW91UHNaV2Z2RDFR?=
 =?utf-8?B?K1daSUxqZzNTbStGa0VUbnFGVjRjUXlpQmxUay8vTE1ES0ZrZFVZS0UzdjB6?=
 =?utf-8?B?UysxTFFlcXkzc3ptZWhYb0h2eFpVYVo5YlZaVHl4UGhqazZ6a2MyRUpuRll4?=
 =?utf-8?B?akVLVkdoalJpMjBmcVhoZldhQllNand6cmZjdG1DVURiYS80OFhuZEl3RjhJ?=
 =?utf-8?B?NnNsWUlXSkRaRlRseW93dlQzRTNFZkN6MHZIWXVrZzdMN2Y2K0NaR0JmVGR0?=
 =?utf-8?B?NDYrN0lQcVh0SXlFZm5QRXQzM1NXOW5RWWkwK0E3Q3ROY0FJYThpcTd0blBi?=
 =?utf-8?B?aHRsdnlORE01OGNIZTE5V2ZBTm1CYWNtUjJFY0xYZGxLRElFTmhINCtxUGY2?=
 =?utf-8?B?Mmo4OVRtdVZmanJBMzFaUmN0SEpFRFdhVk44cHJrb1NuU1dmdmwweGwzU09P?=
 =?utf-8?B?NUhpMGV4eHkyVWRVV0VVVS9EenFGOEEvS2Nxam9oVlY2Kzh2Q0pUMmhDaENx?=
 =?utf-8?B?M0hTVHN0bHJhTHdwSlo3V1JGb21EaDNHMWFmYTJZY1dZd2hIWWlGb1lwRnpI?=
 =?utf-8?Q?0+bEx0Vwg7k=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR11MB5979.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WlJTMTZBZmo3RlBnemxKNGpRZVEvUkc4TkdiSWdhOWMvZ3lDMTBwbTVQeUhW?=
 =?utf-8?B?TWFUSWdPVkU5L09OU2NuUFlXbEpaaU80UkNlYWlFVG1DV0RoUi9YVXZqYjgr?=
 =?utf-8?B?Z0FWUEZMdnluRmJWT2wwYjBHQW12VVY5b2lwL0szcXROWEFoK1hGb2x3Tzkv?=
 =?utf-8?B?UjBYbWNFalMrY04wUmZGQjBES3Zib3BTQ3hWQk9xWHhHbGY3c3BsajBWYlkx?=
 =?utf-8?B?SHVsd2E1V3VmUFE3N0RnNmM4L2RPWldpWmd0dXpERVZUNklsWmtWTnJtT0R1?=
 =?utf-8?B?VkxReXBUV21xZmMreXB3MnpJVHZBeTI0WWc3bFVTc28wT0JkUFRIdGxveXAx?=
 =?utf-8?B?RnVsbUlQN2pTd083VncySmFSd0tkQnFuZThlajNSSHNkMEFYSW5pNFdtbHQ1?=
 =?utf-8?B?UThWVWpHakc1SWlEWFlOSm8yY2wyUVZERDJUSForUUFCZE1FMTBkZDA2WGFh?=
 =?utf-8?B?RitVUkpFN0p5QWlNcFZkU1h6MVhtVWs1d1NBTjdzdVFEYk1GRkcxa3JGZHhK?=
 =?utf-8?B?amxJdFphUzd3TjBhZVZVb3p5dStEa1hlWkpKZ20vN2U4L1JMbm1vUStnVG9K?=
 =?utf-8?B?VHgwdGxJeU9La1phVlA4M3hFYWtnYk01RTdBelZObHluT1UwYTVXY212ZFpO?=
 =?utf-8?B?MEV5UTkxaWhWamg5Q3BQS2t2ek1nK0pIK25Ob0RWYVMrNWJNUTEreUMyai9t?=
 =?utf-8?B?bDNsQTd1TEZDQ0g4M3NtbFFXbVlac0FkTGVXSUN3OThiR1VRYzZEUFN1VTZu?=
 =?utf-8?B?enlGNVh4NkIwQ1E4RDllazZiQm4rbWZ3elk1a3RuUHRXLy9CTU9mc2wwaEJM?=
 =?utf-8?B?a0dmdHJKNkNKdXNHV0R2R1l0NWFZVU5MNWJHYTY5QUFFWFR4TmlsYWpYdE1L?=
 =?utf-8?B?S1dKRXRxZXJLVTE5YVFmWHdIWDJ2OHUzVzBqbUdnaS9ES015RGVRYUlHamZM?=
 =?utf-8?B?UVpsWUJGVmE0eHlkaW52SnFSNERTQy9zMzVBb2FaaFgralpSSHNzN1M5ODY3?=
 =?utf-8?B?VDQ1c3hzK3kyUUQrWGg1MnhqRWx5VG5ua0NwWU1VdHZMRTJIV1VDZkVqRkpN?=
 =?utf-8?B?WVhNWDY1emk3N21mdmoyZVh0YStjVC9tdHN1a1R0MjNhWWphNWJFeFFLR0x5?=
 =?utf-8?B?ekFTQ0lUd1pNTlM1V3I2RUdWR2NhR20rWW9Fdk9TUFpIYWZJRmx1SURFMHJG?=
 =?utf-8?B?SCt5dDB0R2NySVYzYldIQ1hwVUE3dzVXZlkxQ0dVbzJoeUVObDltdnZsa0xY?=
 =?utf-8?B?SDZuRU1SL1RmTGJoaEVHajFFbE9IT2R3NUVqSWRCKzVFSzF5cG5GVEp6WUkr?=
 =?utf-8?B?dW9GS0J0bWxaNXcxSnFyZ1RtN1Y4ZUVocXppMjFHaHNheEk3MVJlZlowR3dz?=
 =?utf-8?B?d0haOEpFdGNlbUR2OWdxQXB4dUVjZEExejQ4TldJZkRLbElQOUEyS3haSkpq?=
 =?utf-8?B?VUlCbEg2bHphMzJTMi82Q1FOUmltTUFjdVFaYm55c24zTUl4RXBXak5KRXd6?=
 =?utf-8?B?bytrRnZvQkx1MnVkOVBIcStPOG1FeWR5NkJscXR4SzhESEN3TTk0QitkTnJY?=
 =?utf-8?B?WVB5dWVJNGYzdlJHSng1VkRhaTY0aDR6VXMxUEIrY05TYkdzRU8wT3VISlJk?=
 =?utf-8?B?SWREMlpLdlNFTWVwMGNBcUlFL0RqUUl6aENqVUZ1RTRGYU9jSjFjMHRXYWVa?=
 =?utf-8?B?UlRVNmwvOFhBdnRzODV3S3Z0OGJCcDg3T2grR3NjeUpmL2hJRHc0QzRjN2hr?=
 =?utf-8?B?bnBVMmx3eVlMK1NCL1BkMk9sUTlpTXhlMTV2dTNFanBKZmlNb3FYTEV3TTFE?=
 =?utf-8?B?di8yR1htazlvSmYrZnZKMnJmNTlkVXNoVTdLY3JNQjc0aTNPTitVQnBHRG0v?=
 =?utf-8?B?ekJZZlBwTlFJdlRpQStwU0VsbjdjZVd5UFZYM1JEWEdVRTEwNjBNWkJMcG10?=
 =?utf-8?B?VUd3SzJFNUhIbzJxeUpzR056NXBkWlBsNU5VRldUNkJpQWtlWFJQUTJyS2Vx?=
 =?utf-8?B?NlRQZDljM0tzQVZ1dWtyaFRCbFZxWmM0aFlZTy9ST2xVZlBuQXVDam40Rk4x?=
 =?utf-8?B?VUpwVkp5d0grUkI2UWNtM29xUHJlS3liUER5cHh3dmtVbkdtNVRhZGlyWWZP?=
 =?utf-8?B?MzRrei8rYXFBUkJFQWgvUnBwZjdGTEVHbi9ETmMxVjA0L0J5UytTWkt0K24z?=
 =?utf-8?B?Q3c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c63f6e20-9c3f-43c2-6f24-08ddd41ae33b
X-MS-Exchange-CrossTenant-AuthSource: BL1PR11MB5979.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Aug 2025 12:23:30.4837 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 30uOsv2JcvLEMMt5WMphNN47jTwsiPo2WpDhml+IMOL7h6BP3W1QT5PAwKybL41gT+VFsUzXtFKVD4tdNUN6tQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6008
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

On 23-07-2025 04:33 pm, Jouni Högander wrote:
> Cursor doesn't generally support frontbuffer rendering. This test happens
> to work on i915 because i915 has frontbuffer flush call on render
> completion. We do not have that in Xe.
>
> On Xe this mostly happens to work currently because any plane/pipe register
> write is triggering update and that is keeping display and PSR awake. Now
> as we are moving to using trans push mechanism to trigger update this
> doesn't work anymore.
>
> Stop testing cursor frontbuffer rendering in kms_psr if using Xe driver.
Patch LGTM
Reviewed-by: Swati Sharma <swati2.sharma@intel.com>
>
> Signed-off-by: Jouni Högander <jouni.hogander@intel.com>
> ---
>   tests/intel/kms_psr.c | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/tests/intel/kms_psr.c b/tests/intel/kms_psr.c
> index da947feb6..f062d184a 100644
> --- a/tests/intel/kms_psr.c
> +++ b/tests/intel/kms_psr.c
> @@ -893,7 +893,8 @@ igt_main
>   				igt_subtest_with_dynamic_f("%s%scursor-%s", append_fbc_subtest[y],
>   					      append_subtest_name[z], op_str(op)) {
>   					igt_skip_on(is_xe_device(data.drm_fd) &&
> -						    (op == MMAP_CPU || op == MMAP_GTT));
> +						    (op == MMAP_CPU || op == MMAP_GTT ||
> +						     op == BLT || op == RENDER));
>   					for_each_connected_output(&data.display, output) {
>   						if (!psr_sink_support(data.drm_fd, data.debugfs_fd,
>   								      data.op_psr_mode, output))

