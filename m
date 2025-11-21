Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68ABACFA477
	for <igt-dev@archiver.kernel.org>; Fri, 21 Nov 2025 06:22:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 02B9C10E03C;
	Fri, 21 Nov 2025 06:22:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fH9z+zaH";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3CD7810E03C
 for <igt-dev@lists.freedesktop.org>; Fri, 21 Nov 2025 06:22:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763706143; x=1795242143;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=rEcJ3G0sYCfM8/LL7MaK4GhBzAjC/Wwm0uEqqwNm+d8=;
 b=fH9z+zaHkVALNEMVyXNme3CByLAL5XAqgJDImsavWFirIsz/NGDiOnZD
 4Pv1nUd+VyCcEdeZPKR7Kky1IkJXqR2y53+CyVI2+qFKp/JmlF1c0Negi
 Suq+QsDjVZsKwRRDKVgWjlHa4MXgr+BlLeQK3n8DQ/YKu/2QGuzrI0O2B
 +hwg8crw5V/+Zz3Rjak1DC4SN+4sNw3LcCij8U1wT1NWnZHND6/mSxWWw
 cjQAnBMol5gAOC545ceVanTHH5L+ovDB5CM/9zMK4C8/tC8xvAxq8lqMN
 nRGHEQZdzG22cOH1cqgy3L3QnecgCNgfIzwmbOr4DpJeHP4QvsafWbQzO Q==;
X-CSE-ConnectionGUID: Itg7nt9ITFmHKNJ993i3Iw==
X-CSE-MsgGUID: E69jJqs6SqiF7SD0RsGSZQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11619"; a="88444201"
X-IronPort-AV: E=Sophos;i="6.20,215,1758610800"; d="scan'208";a="88444201"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2025 22:22:22 -0800
X-CSE-ConnectionGUID: PLaskv6jRdamypK5gY+6RQ==
X-CSE-MsgGUID: 4i1BQ1ppTgu40YsFOZxCQg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,215,1758610800"; d="scan'208";a="191855243"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2025 22:22:21 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 20 Nov 2025 22:22:20 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Thu, 20 Nov 2025 22:22:20 -0800
Received: from MW6PR02CU001.outbound.protection.outlook.com (52.101.48.59) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 20 Nov 2025 22:22:19 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GB0JClVEleFwRZ0TJMZvFncI56hk/TVn75qFKJlSV472ktfNfWVgmJZxnQzNuppcUpiUbh8RELGM8tv8eFvvNEDJttgkDl0KmYkRg1eKqRLskM+ass+cy68rzKO92Pw/+GMnlqkR6QPGJO5jbGiNlEVf0n0XxVtFBTCp6ufVZdXv2l345Ws3FPtDkX0Ev5q/dOeZ87IP9JGzYxvYSzMmMFitFWcJ052EzQRFnYLiBYU2oGcAiSelm3Sce4UFy9Ls/GJDTvkHzfjfgzBbBHqAEfgKeoX0wQS9HY6WJsTAL701RymZzQ9c87TWJi/v14esIocKow9G09rj+YELFsNLkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EEtMcuU5UV1nSzodzrwqH4O4G7sXJxj9P5HBNqkDiuI=;
 b=XZHhp6pF93hDtFwWuoODvsQTsFAoCBqGMCqy+FcCLSud4gldV67djVKAGD0EryJqW4sgTFKu4wvCaPFxkdO5qXRoPVfJ3HGF7mmyMyhzv0pnCk7XeeqyM0bP8NN7bFpeYhgvW5Mrzl35g2d0sErRd1SsKbqEhNeCvj/EJWabHPvBm1FCWfg+vdZqMnxgNU3PrlfsMfH529WdOmOrNbBOq1QWgthFsyK9WHQ+VGpHtI4VLKVxS7FV6P+BWSgjeZOpDnAv65laL/OWQKYckDhKUvFaVxJOG7pNYSe515bWQouuuT0jbUhc9xecHGmjHiRsaNYO8Ti6mZpzfB4TKwKBgQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5341.namprd11.prod.outlook.com (2603:10b6:5:390::22)
 by SJ2PR11MB7648.namprd11.prod.outlook.com (2603:10b6:a03:4d3::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.10; Fri, 21 Nov
 2025 06:22:12 +0000
Received: from DM4PR11MB5341.namprd11.prod.outlook.com
 ([fe80::397:7566:d626:e839]) by DM4PR11MB5341.namprd11.prod.outlook.com
 ([fe80::397:7566:d626:e839%7]) with mapi id 15.20.9298.010; Fri, 21 Nov 2025
 06:22:12 +0000
Message-ID: <2aa65a2b-bd37-4881-9e0f-e9bce00966d3@intel.com>
Date: Fri, 21 Nov 2025 11:52:06 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 1/5] tests/intel/kms_dsc: Store valid DSC outputs
To: Swati Sharma <swati2.sharma@intel.com>, <igt-dev@lists.freedesktop.org>
CC: <imre.deak@intel.com>
References: <20250521072836.1400749-1-swati2.sharma@intel.com>
 <20250521072836.1400749-2-swati2.sharma@intel.com>
Content-Language: en-US
From: "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>
In-Reply-To: <20250521072836.1400749-2-swati2.sharma@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5PR01CA0082.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1ad::8) To DM4PR11MB5341.namprd11.prod.outlook.com
 (2603:10b6:5:390::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5341:EE_|SJ2PR11MB7648:EE_
X-MS-Office365-Filtering-Correlation-Id: 82ed8952-ecb1-477c-44a6-08de28c64ecb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VGVWSFZzT2lkL1Vta3VMS1l3MTN5eFpGNE1MQU1Fd2hpVTdVMjFwbDlMYjE2?=
 =?utf-8?B?MVd6TUNOODZYRGYvNUFFYkFrblJHSElYR284KzN6UDFFUVRxdkYzMHlneE9y?=
 =?utf-8?B?c1JxMmZaUW5FQ3dCSVRVb3V4VGQraERlR0cyLzRWTjE1Z2dNKzBYVlpBRVBh?=
 =?utf-8?B?WUVueGYrVjduSDRHSUhNQ3hJbGZLY3h3K1dRdXA3aTMrSGpjUmo5bkx3RWtT?=
 =?utf-8?B?Z1FIcmFEbkJXenlmSjcrYWxqRzN6VEFYSXRNTmdhTVQyOEdoS0lERUR6eGgw?=
 =?utf-8?B?QzF1aTQ1emd0c0t2SDVmbCtnRk9GTWVkcW9CeURlOGF0OTNNOGt0dGxoZkF6?=
 =?utf-8?B?NTFLTEFHZ1BhS1RJdjJYUmxtcVllY2FMWmdnN1R5aGV5VmRCVVg4WWlxdDg1?=
 =?utf-8?B?VVV4eTJPN0VwVWJQMlZNRmNFKzB5YTVvbGlhQk5iNXp6NC93S3VwZzlRNmJv?=
 =?utf-8?B?NUxqOXZXajFseWlhVDNHSWo2WHRITEJXU0t3eHhpUlZuanlVOXBNd3BYMlo5?=
 =?utf-8?B?V24zUnYxekF2V3JrdTNYN2pYV3JBZHJ4YnhLRk5tUkV2WmV4WFdIb25ucDNt?=
 =?utf-8?B?aERVUXFMOEVLSkJQUTNrZVVvdnlTZ3owMnJBU1ZqeWdTeENoSExWT1BJTFBM?=
 =?utf-8?B?dEhwRHN3N2lNbWFlRkxZTUdocDhIVDhHV203OWZGNFppMXZpWGhKRmVEZUtE?=
 =?utf-8?B?QjFHNWtXMmhFZXFpL3o2QzVvLzFONnp2bENNVVRnbmkwaW9BZkNWOXZTOHMv?=
 =?utf-8?B?VlhTSkYxQnNIMUJSM0tLM3hZL0w1UnNWYVQ1WGxhSU5uY0xDVEcrQStVd1c4?=
 =?utf-8?B?RXR5bnp3aXluYlNhcGRKQzNTc0xmUWx0dktPMjVTOHdPWE94Nis1V2ZPM0pO?=
 =?utf-8?B?Z01OTEtpQjFrdGREMmdoVTBDYlpRajdQNFFFYXN3dDVtNEQrdEZMK205SWRY?=
 =?utf-8?B?ek4vcHNZS3B3N3IrbVd4WHcvWGdIeWFZSzkxamRlSUZPOWt0QWNNU0lORWVX?=
 =?utf-8?B?QUdTVEVSaDhuL3VGZ1JmakEvRGE4SWp0OEZGNWtEdHpPL3FtdkEzdjRVcyt3?=
 =?utf-8?B?aStHVlpIWVZ4R0ZBN1QrRWV3c0p2bFl6a2JKVXBhSDMyTTlRRlM2WFFlTGhP?=
 =?utf-8?B?amV0a2VlRUN4MjFmUzFCRkhzNllOMmZyRms4ZmhwdnVnLyt0aFRPTmVsVHVW?=
 =?utf-8?B?VUcvM3BOMnpZM3ZRcytDRHN4SmNvak5yS2EyZGtxU2t4ekIzN1B3ZldsVFBk?=
 =?utf-8?B?NnNuaHo5emNMa21oeXRpZ21HOERneTBrem15YW5NYldvcThQOWNtOGFqSkp0?=
 =?utf-8?B?U3JUYnUvSDlDaTdwU0JXcDU5YjllSTFLY3pkbjZ3blZ1VFB1S3FBNUJLQzM5?=
 =?utf-8?B?NEVsMWpjRXJldGErWGZGWUFjVHhDZlpQU0dRTEFSOGNFeksvcUY0Mk13V0Ev?=
 =?utf-8?B?dC9zdWJlNHBVRW14RWNFYVpEdGpPZnE5WGNsaER4dU1VT3VUZGFLbk5GQm9T?=
 =?utf-8?B?MFFyb2NUZ0ExcWFvLzZMYU5RRjc3M3ZqbWpyZVJXNVZmeFpOWHZhVlF4VDJF?=
 =?utf-8?B?TjVQaVdEbnZsVm5URjZsU1Q3NkR5ZU55b2tqZzg0SlVDK2cxRG9Ra29tNVVH?=
 =?utf-8?B?R1prSUp0MFUxK1YyYUs2bW1tY3hWUGE1YVphOHp1Z3pqb3ZVREFkOWxaYkM1?=
 =?utf-8?B?R0N6ZDRndFdnQlIycExxMUNRQWxwOTdYTStTdStzdGtKKzFZUlhrTno5ZTZO?=
 =?utf-8?B?dDN2N0dlcCtWRlc2a2RnYkxiNUtDSU9WdTNGSDdKV3JIUmhENmdxUysxN1Zw?=
 =?utf-8?B?VFdZQy9mK1gzZGpMazZxd0dMcGFtOGFhekJGL0FBUXgxWjB5L2xNSnlXSkQy?=
 =?utf-8?B?UzZnOXdoRFpEUUh1MHFTb3k4T3dCaU5yakRVMWRiV3YxN25ac29QT0dqMkFr?=
 =?utf-8?Q?aQYeNHQ7YzV5yAhbbhIiHKoPnqWSFxir?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5341.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cmdvalJKVEk5ZmlUSVFrakxPcWdWT3VMbkFlc3BpVGFsVlhZRllBUG4xSWlB?=
 =?utf-8?B?OFJORVp6cnAyY2k1dVZzUXRXaXFOUzFUSDZxaWk3ZG5GNEpwaFhZQ3lNS0dq?=
 =?utf-8?B?Q1g3ZzdNWXBTYXhITElSaG5YRXpLL04wdWpydXh6QVpkd01zMDlMd3lKM1ho?=
 =?utf-8?B?MC9iY2tGVW5sRTZFVS9WRW1PU1d0NkJleEkvNlJWcjIxVzV3dTB3TmhpKytO?=
 =?utf-8?B?ZFNLTWJLN3J6bW8ySjBIcG5zeStyMStzK1dTY3N2aENKM2xMbXZWYXh5Yldx?=
 =?utf-8?B?R2F1UlJQVnFSeml4NERJUlZiSTBmTVUwS28zRG5LaVpMWXk4ZzMrQlZrTzA5?=
 =?utf-8?B?UDlvWFRCcWEwcEVlbGhoOUh6citsREo5QVM1TlZjZWI5cEZhUnRFcVhWNFd5?=
 =?utf-8?B?ajluS05rNGNxTisrUmg3dWtGTWtvc3F6TVRWL2FYRjRwQUNYTTBTQ21QUlNZ?=
 =?utf-8?B?M0k2d2p6S24wRysvQmhNdjdZaC8wNEo2OUdiSEs0bHNCODA3aC9mY1VrMTc4?=
 =?utf-8?B?MC9VNzNDMGVLUkd5Rm5IZmdzTFdkWUxWVjZ2S3paNmhveG1ZOHRSdVhlNXdD?=
 =?utf-8?B?c2lnRy9lVnEyakphZndzQU5vSEZFWWxLbjRrTW1wQkM0VDBvTndYcVRMNnEw?=
 =?utf-8?B?aVpvQ2FvOWh6Ty9rQkNjZHZsMjAraHloOWRNRnRYOTlNemUyME5HM2FzNGNT?=
 =?utf-8?B?MEtuYlFBd1doaUQzREd5UWdVc3JYN04yZWRaVCtHMVlLb255S2dBOEtVKzlO?=
 =?utf-8?B?eTNvRi9HNlJiVDZOTTNHaFQxWnZaSlJMK2FGSzBKaXY2NkNJd0t3c0cvRG9t?=
 =?utf-8?B?c0E2eEJnMk9CUkI1Y1V2ZExOWEdpMjR2NEw1T3EvaGN2OHg2WjBFQTc1cmJW?=
 =?utf-8?B?My8rZ09EcmlUTWN2Yk9VRUhhQ05nRWZYVmlDSmFiVmE1d2g0dkQxcFo0Wlk4?=
 =?utf-8?B?UXZqeE1MNWhsVDdmSExzTnlzWUNtbU5tVDI1eGlZYnlzSHducW82M0ZqL2Zh?=
 =?utf-8?B?V0pCM1EzUVdBajdvN3ZzL3Vhek1oZ0VMR1p0ZkIwMDV4bWlWYXVtY3dEcmZT?=
 =?utf-8?B?T3dlek9kUkVKQUcrUEF4RW56K1V5ZUtQSUtIejdFakI2M3NhZ1RuWUlIN3R3?=
 =?utf-8?B?VXlCTVR6cTgydFdPdjNabGZTS0VOVEFsWUNwcmJTTjY2NXJxcEVhOVFiZWtN?=
 =?utf-8?B?ejE4N2pVcTBON09UTlE2elBJOWtrbHFoUzMvOVBiQWtWMkhsamZ2eHdCY0I3?=
 =?utf-8?B?TWNFY3hmdUZpVjVRekpkWFNCTDdYbStJODhSSWZFV2NhZEZBN1RSRXM0b0R0?=
 =?utf-8?B?US8vVHZYaUdXaGVPSEFJZWtlN05WWGp0cHFRbGhWZEl3WTgxdFZMdm9rS0Zp?=
 =?utf-8?B?UXJEOG9nVlo3a09iYjg2TkQrczhCUm5udjhRTTFSZEdETFJTNGN3bDBkMHgw?=
 =?utf-8?B?WWlHeXFFVjBLaUdDMFJWZ0JNRjkyc3Rqa1RQM0ZOUWwwYWpSdUZQN2lLdE1B?=
 =?utf-8?B?R2FaRlZkNFJyRmh0M0tRWTAzM1FGYW5Gdnc5Tnp5T0s4ZUtxN0tVN0Z0ekll?=
 =?utf-8?B?VG41N1QzQVJlczdYVE5PRVNQSmZoejcrWjVzUGN3WHNTdTJleVdXUi9KVDZ0?=
 =?utf-8?B?THkyK0d3bExoQ05WYmdSRnVnQi9yaWRLY0hTaDVxUHZOT21qekxXeGtWa2hq?=
 =?utf-8?B?UTNjc0lOc3ltWC9sMzVpM1Jnekx6SmF5VFpidEFMcmdUWWoxV1dVZ241QmQ1?=
 =?utf-8?B?dlkzSHMzK0ZFdUFmbnhzUTh4ZWZiNlplNGlLdjhCNFZPVm5CT3gyWnZiQzZ5?=
 =?utf-8?B?Tjd4c1Q1bjM5ejJPVDNqeDhQWU91a1J0TEdDaUNwWnZhbWxBZWY5OUJJK3Ja?=
 =?utf-8?B?eTJkUEdTNkdiUUdXUjBqV0Y4NGpLRm4yK2xxS01QTjBzZXFsRUF6cUJpRjFG?=
 =?utf-8?B?aUNwbHRvZlNiWVpJampiMjJTdlpIRUhJMTNzVllNQUpYdEhzSTF6TmJXZnRV?=
 =?utf-8?B?ZW1JaHRkZWJIWW9rbTFob1NvZEg5Z2VEemJldFNtdWNraEh6cmRBaWt5OUVP?=
 =?utf-8?B?eWZDRStjcFBveTVjWjY3WXV5ZUdXSGRmUVl4a3Y0bzJjZkJWdm5teFFlT2NN?=
 =?utf-8?B?bXpKblIyMTNZZG81bjBkYS9XczFYME9NeDc2T096bGlUMEV0c0xmdzVvSmRp?=
 =?utf-8?B?VUE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 82ed8952-ecb1-477c-44a6-08de28c64ecb
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5341.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Nov 2025 06:22:12.7484 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vpSHT39pSTVFFxPyw+EHHvs9yTnnN+YAc9Ld/tqHIkjh46TY6W6+SAYY7z45L29JARRB47/9C0yU7u8IHZXiPgojOnUFSSl8TZ3tD4ASrqU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB7648
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


On 5/21/2025 12:58 PM, Swati Sharma wrote:
> Instead of repeatedly checking debugfs to determine if a panel
> supports DSC, perform the check once and store valid outputs (those
> that support DSC and meet the required constraints) in an array.
>
> v2: - store pipe as well in array
> v3: - add intel_pipe_output_combo_valid() while computing
>        valid outputs
>
> Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
> ---
>   tests/intel/kms_dsc.c | 41 ++++++++++++++++++++++++++---------------
>   1 file changed, 26 insertions(+), 15 deletions(-)
>
> diff --git a/tests/intel/kms_dsc.c b/tests/intel/kms_dsc.c
> index 7f0745370..5aedd9576 100644
> --- a/tests/intel/kms_dsc.c
> +++ b/tests/intel/kms_dsc.c
> @@ -71,12 +71,15 @@ IGT_TEST_DESCRIPTION("Test to validate display stream compression");
>   
>   typedef struct {
>   	int drm_fd;
> +	int count;
>   	uint32_t devid;
>   	igt_display_t display;
>   	struct igt_fb fb_test_pattern;
>   	enum dsc_output_format output_format;
>   	unsigned int plane_format;
>   	igt_output_t *output;
> +	igt_output_t *valid_output[IGT_MAX_PIPES];
> +	enum pipe output_pipe[IGT_MAX_PIPES];

I think we need a struct which ties output, pipe and count in same context.

Something like:

struct dsc_output_config {

     igt_output_t *output[IGT_MAX_PIPES];

enum pipe output_pipe[IGT_MAX_PIPES];

int output_count;

} dsc_config;


Regards,

Ankit


>   	int input_bpc;
>   	int disp_ver;
>   	enum pipe pipe;
> @@ -248,32 +251,21 @@ static void test_dsc(data_t *data, uint32_t test_type, int bpc,
>   		     unsigned int plane_format,
>   		     enum dsc_output_format output_format)
>   {
> -	igt_display_t *display = &data->display;
> -	igt_output_t *output;
> -	enum pipe pipe;
>   	char name[3][LEN] = {
>   				{0},
>   				{0},
>   				{0},
>   			    };
>   
> +	igt_require_f(data->count > 0, "No dsc output found that meets all constraints\n");
>   	igt_require(check_gen11_bpc_constraint(data->drm_fd, data->input_bpc));
>   
> -	for_each_pipe_with_valid_output(display, pipe, output) {
> +	for (int i = 0; i < data->count; i++) {
>   		data->output_format = output_format;
>   		data->plane_format = plane_format;
>   		data->input_bpc = bpc;
> -		data->output = output;
> -		data->pipe = pipe;
> -
> -		if (!is_dsc_supported_by_sink(data->drm_fd, data->output) ||
> -		    !check_gen11_dp_constraint(data->drm_fd, data->output, data->pipe))
> -			continue;
> -
> -		if (igt_get_output_max_bpc(data->drm_fd, output->name) < MIN_DSC_BPC) {
> -			igt_info("Output %s doesn't support min %d-bpc\n", igt_output_name(data->output), MIN_DSC_BPC);
> -			continue;
> -		}
> +		data->output = data->valid_output[i];
> +		data->pipe = data->output_pipe[i];
>   
>   		if ((test_type & TEST_DSC_OUTPUT_FORMAT) &&
>   		    (!is_dsc_output_format_supported(data->drm_fd, data->disp_ver,
> @@ -323,15 +315,34 @@ data_t data = {};
>   
>   igt_main_args("l", NULL, help_str, opt_handler, &data)
>   {
> +	igt_output_t *output;
> +	enum pipe pipe;
> +
>   	igt_fixture {
>   		data.drm_fd = drm_open_driver_master(DRIVER_INTEL | DRIVER_XE);
>   		data.devid = intel_get_drm_devid(data.drm_fd);
>   		data.disp_ver = intel_display_ver(data.devid);
> +		data.count = 0;
>   		kmstest_set_vt_graphics_mode();
>   		igt_install_exit_handler(kms_dsc_exit_handler);
>   		igt_display_require(&data.display, data.drm_fd);
>   		igt_display_require_output(&data.display);
>   		igt_require(is_dsc_supported_by_source(data.drm_fd));
> +
> +		for_each_pipe_with_valid_output(&data.display, pipe, output) {
> +			igt_display_reset(&data.display);
> +
> +			igt_output_set_pipe(output, pipe);
> +			if (!intel_pipe_output_combo_valid(&data.display))
> +				continue;
> +
> +			if (is_dsc_supported_by_sink(data.drm_fd, output) &&
> +			    check_gen11_dp_constraint(data.drm_fd, output, pipe) &&
> +			    igt_get_output_max_bpc(data.drm_fd, output->name) > MIN_DSC_BPC) {
> +					data.output_pipe[data.count] = pipe;
> +					data.valid_output[data.count++] = output;
> +			}
> +		}
>   	}
>   
>   	igt_describe("Tests basic display stream compression functionality if supported "
