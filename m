Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6121E606A321
	for <igt-dev@archiver.kernel.org>; Fri, 30 Oct 2026 12:05:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=m2xw7eCD
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 11FFB1127AA;
	Fri, 30 Oct 2026 12:05:52 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 118EA1127AA
 for <igt-dev@lists.freedesktop.org>; Fri, 30 Oct 2026 12:04:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793361895; x=1824897895;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=5PZX9dHVzQfqC/XhnMQHG1kwwlq2HkVCajtTqUgiHn4=;
 b=m2xw7eCD827TG4AE6RiGn2IxLf5fjuUJKnKjEYt/ttHFR8YRK4NRtqQE
 HqQuHhBWxuKcslE9BrL5hxy1yJJZY8QfxgpuP1J20vskT6WB2qK4MfHFX
 2kQHMEpLLHA25M6nodg3Pf5Okd0m0MB5v5uADFtNgDEchFmASygGNGvpY
 oVauKhwBMyk70x6Im8fxIv7DTTPl/anNz/yd0lz5n+4ZRA7Tv9GuGic+S
 bGuFbRz9woYxqVPLgL71Z7obbUj0yTiBAqQ6PxHzaxJFOgbRv00D8oXh5
 sX3E7AGiQqlDxYqnFRdA+Jv9CinQCs9OjKEj4bXyHSuR9IjUHomx5IPMd g==;
X-CSE-ConnectionGUID: plMPhIUZSgaimVjAC8xGBg==
X-CSE-MsgGUID: FsN+lLkdTxeqqVZ4JmyaMA==
X-IronPort-AV: E=McAfee;i="6800,10657,11950"; a="2150108"
X-IronPort-AV: E=Sophos;i="6.27,186,1787036400"; 
   d="scan'208";a="2150108"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Oct 2026 05:04:54 -0700
X-CSE-ConnectionGUID: Po8Mo7KoQeaIOotOjQT9WA==
X-CSE-MsgGUID: ZRkYGS9dTbmMYmKsNxS2eA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,186,1787036400"; 
   d="scan'208";a="5312735"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Oct 2026 05:04:54 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Fri, 30 Oct 2026 05:04:52 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Fri, 30 Oct 2026 05:04:52 -0700
Received: from CH5PR02CU005.outbound.protection.outlook.com (40.107.200.48) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Fri, 30 Oct 2026 05:04:52 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CQ0tEMFQcFQ0tvPYNsufEr49zU/pOcSOW5sM3WKH6NuHaFkEoWmqw6siLjHsLOxlRRDwN0veax3Di9mrwsOO4SRvzMVVMlWAs2CfKxnFTS6XuViQSY55FdNb64xZRY8319uOlC/byLd6/PZbHWZ6CbcOM3peYV92xrZXfIJJBdGfN3a+8BKcy1OP98/fAJEhh+w/uQJEdV9OuvOOOFqyUR6mJUPjuYCRBXDBdy8sPdQ7HWJZ+H0kEg4TRUBZYhYcVmoveDvF1Cx/5wanZLaL65TpnhYAnhZcUKUgNBfuTmZr+IxPWHHvcCyvS//zt6dIX20qf/LSFJHOvqzV733TrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=x8FCGzJlbxBsqBB6NRD01GggkLJ+42a81r0aTA5BZk8=;
 b=ASFtfXfDRrFSTGOl/zh/C0ZaOfYKMsdRy3+rfgHQxPkmNFJZH4fLVopLD2nqLk3eFzG8a7xfmURUnr1IfXko0ISdiKjoRjAs/Gu3qLkyjW03m/oACtKIyU0eNUfLXwmzGzWIL4gCJjYXcm3XRgibM+rfwie2gbaTbj2hwWUVa7soNUo0jZ11gJOUrCNlobFaViL2pDmM3xMyBUBJdn8yOCrsRNCIh93Y9fslHs1QLTex80UOQb4i5HSuJlU2KVJqdy2G5EcuxdLsAqbEhGPCnhay8KDKhS/6BAovxxOmvZecMk0sZXfueSVUKIKDD/LU3k1iNaOUDMvsiZV5NDNK+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS6PR11MB087165.namprd11.prod.outlook.com (2603:10b6:8:4c4::7)
 by DS4PR11MB004556.namprd11.prod.outlook.com (2603:10b6:8:508::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.9; Fri, 30 Oct
 2026 12:04:50 +0000
Received: from DS6PR11MB087165.namprd11.prod.outlook.com
 ([fe80::4223:7b03:1329:265f]) by DS6PR11MB087165.namprd11.prod.outlook.com
 ([fe80::4223:7b03:1329:265f%5]) with mapi id 15.21.0569.008; Fri, 30 Oct 2026
 12:04:50 +0000
Message-ID: <fb9d81d4-dacb-414b-962a-b337994d09de@intel.com>
Date: Fri, 30 Oct 2026 17:34:40 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 08/10] lib/igt_drm_ras_nl: add event notify
 subscription and event wait support
To: Ravi Kishore Koppuravuri <ravi.kishore.koppuravuri@intel.com>,
 <igt-dev@lists.freedesktop.org>
CC: <riana.tauro@intel.com>, <anshuman.gupta@intel.com>,
 <raag.jadav@intel.com>, <mallesh.koujalagi@intel.com>,
 <harish.chegondi@intel.com>, <kamil.konieczny@linux.intel.com>
References: <20261029085955.1232163-1-ravi.kishore.koppuravuri@intel.com>
 <20261029085955.1232163-9-ravi.kishore.koppuravuri@intel.com>
Content-Language: en-US
From: "Purkait, Soham" <soham.purkait@intel.com>
In-Reply-To: <20261029085955.1232163-9-ravi.kishore.koppuravuri@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5P287CA0022.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:179::12) To DS6PR11MB087165.namprd11.prod.outlook.com
 (2603:10b6:8:4c4::7)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS6PR11MB087165:EE_|DS4PR11MB004556:EE_
X-MS-Office365-Filtering-Correlation-Id: 756d6afb-8f0f-40f6-a37d-08df367dffbc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|366016|23010399003|1800799024|18002099003|22082099003|10067099003|11063799006|4143699003|56012099006|261021121427099003|261021123027099003|261021135927099003|261022105027099003|261022075727099003|261026121527099003|261026140227099003|261028144727099003|6133799003|261009223027099003;
X-Microsoft-Antispam-Message-Info: VZgLRr3kd3XbBJU/xv0vBih6oR1CY1lN4QG8ytFw0pK71YBpM60cUaEqhGNP6C2gTLOM0D5WZWVjc5JcQrp8HihsC3/OgpBB0rkv+WT5fU1LHu8tZ2vp2PKLKwDoSwF7vZRlrydSUAeZqcaYL1Ny8yxCdQVJiTuLWGCgrzTlb6x7KDy70sf63gvGeMPMDcQv9zHISOIzcUZEolbrN7XU7CY2tHlbCXnkBbgqmdHaX3zPNyt0USP344QZ2T9mexB7VWL2YxkT+Ip5g3DcV0F7hKpG8gGjzHuM9YWDuBqdhLcUuYbSrUJWciA3SP6HjW1mG19+amn0anB6fwnUXW7HC8aB0btChfLqPkjbrnpq9wGerOWZseW+fiRTIBaAbBLixxkTa3VyBycnAq5TBWemhPfKcsFYyN1mDZrqlq+tRORmggYPw4ZtdgJWcV1/j8706G1RhcdE0npZU61RQzxFdBHyAqnNKphUz6G+q2LqWN4wROU+FvCPoPZzU5GExj6FmS8n3o090wwKnbAd622y+ew6xTnO/HfNQkUXSBpVQcY3I5DfkkA5Uc+Z9j+cO/RtZtoZLJnhAAQN5CqqYoMIXfIeyj4Dm2sdYR730wubAC4sRIgYzhNoeVdsw5jC4DMAdH2D68K9Zf7iFb1z99fvAf5/ELKnrWBkpTwZygpE6MY=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS6PR11MB087165.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(23010399003)(1800799024)(18002099003)(22082099003)(10067099003)(11063799006)(4143699003)(56012099006)(261021121427099003)(261021123027099003)(261021135927099003)(261022105027099003)(261022075727099003)(261026121527099003)(261026140227099003)(261028144727099003)(6133799003)(261009223027099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cm1tQ0ZFL3NmaU1rTDhxcGM0VG5OeHFCcTV6aW9aR0o3QVNtZ251aitPcUkr?=
 =?utf-8?B?dmlDbkFYSU9QalBRNHJoZC9kcGNsTkNTWW5scklpT0FLUExBN2hTRHgrQUg4?=
 =?utf-8?B?aC85dzJEYnNYNE5hLzZhYUhqazhSSUgrMVBvd3I4MGVORkV3NHdJUDVIRlhs?=
 =?utf-8?B?TXk2RTYxSmRVdlozM0ZyL3grajZlR1V6K0RBeVBDc3dKUDQrMFlCNFpCb3U5?=
 =?utf-8?B?ZTFkSkVaL2FYMG5TZnBTSGkzT3hBWklPWTJsTkVHVm9sckV1TGcyTW5tMml6?=
 =?utf-8?B?QkplcXF2SktQWHVBL1dEVkhmL2d4bFprZnVLVUZvaWNSRmZQYnBDSzg0UGU3?=
 =?utf-8?B?L1JBSFRjNDBvY1hnbXRLT2xBbGo2VUYvOGhYbXM5T2poMjFrM05oeEV1emh1?=
 =?utf-8?B?dWdRWG41b0xHWlgyMVpJVjV4d0R0eHdXM1JqaDhlN2YrVnYrYXBEQ2xudW1C?=
 =?utf-8?B?dFJCRlBaL3VEMmEvTTVuL3VDamRTZ0k1ZkxFUDl1M0xlNEZpZzE1cWVycnhx?=
 =?utf-8?B?Qjc1YW05TnRRUjE1aUN4RGpiYWxMT0VXS05nOVRnME9Ob1VPZW5MZnI1UExh?=
 =?utf-8?B?Uzg5VHJEUnJqekJwVjB4bVl1R2tjQVppTEh3aVJwTnhSS1VONllUM0NNUW9I?=
 =?utf-8?B?TFVSUVI4dGFod2psUzIxSUhTQVVrUFVSR1MzTmlUVkw3Q2ljdFM4SzliVUlP?=
 =?utf-8?B?RXVoZzc5Z005N0FVVEZBUjR6dVVsREF4RVZUZ3lYZ1RUOC9Jc05pVFduR1V2?=
 =?utf-8?B?Q0hic1F1Z1lBRW4rcHEzZlZ4elFVRTNpR2I0TS9yL0NSKzd3MW9nVTVWUHV3?=
 =?utf-8?B?NHhpVGgyS21USDhXVVlGQ0Z4VlJtWVZ6T1Z2Mm53V3BPaEx2Qi9JTWdmamls?=
 =?utf-8?B?SXJFVEs1ZTBvamRQOEQyOUxFZlpwTlJuL0pGb0EwRHJ2MHdVWGdLbHVxaExv?=
 =?utf-8?B?cFpMZWFkWHBYNnJvM2RPVTJMTnI4OCsvQTdNU2d2STFLSHdYM1g5dkxhcm5P?=
 =?utf-8?B?dkZOTHNwSUEzeXp1SDJXak5zUVh6UFRpK3J6NDZVdDg2Uk5rbXdEQzhxSHBK?=
 =?utf-8?B?M2FWYnk4WTZuaThpZFlETjlhMG9XT1hseG5hYTIzVDFIa0owcnBPWHMxVWZr?=
 =?utf-8?B?RGluRExvdXRXMzVMWWcxemJqaHFZRFRhMGFoRkJTT0dSQURVTDRWNVM4Sitp?=
 =?utf-8?B?enJaSnVBNzJYajA2YVNoMTFqdmhaSVc3RkFaRUdEV0hDZWJXREZmcVpUdFR3?=
 =?utf-8?B?RzZmYjR1TWUvRDN2VGtLTU41VjB2QTZZY2dSSWZBb1hZbkppTEtUQmsrbkRj?=
 =?utf-8?B?bkxKRm9DZ25ZZ08yc1JrRGNhbFBtdm5mWStjNzByUDYyYTZMaGtjdWhJWmh4?=
 =?utf-8?B?eU9KcUpEbFFuODlPNXhnSzVJR3hzK1JPREUzWXJjRXhuRDY3TTE1NitwM2k0?=
 =?utf-8?B?aHVHb2tDeVBqc3NiKzZHNy93WEx5TThzVGFnTFBpZTIwMGN0Nk5RYTBMMVpu?=
 =?utf-8?B?dkRrRGZWSURyYTFsY1drV2pOT2lkS2JmYUV2UE54Z2N5ajFKbHJjOVM5SmFN?=
 =?utf-8?B?RW5TMHo1TWJ2bEo0Yk1IS0d2aHJ5eDk1YUtJQW0vN1BtWlZQNlRpUDhDdTlI?=
 =?utf-8?B?SXkzTk40YUJUdDR1WWNpRGpuVGxOUkJjbEo3TDNEcEp2eG9ZcjdFMmdWTnZt?=
 =?utf-8?B?V3FvWWczU0VpQUVuRUE3K2duMFVWenpKT0ZNa2RCZmRFdjdkVHpzdzRtZDUx?=
 =?utf-8?B?b215UWVaTC80a0tnMDUyUGJIWE1oVHdBcldYcGFqeDNadzNWSWpkd3ppRk0y?=
 =?utf-8?B?UTdlU3U4ZEpYRThrenlkTVpDc3hyTVozQm56eld3TWhpYVRlUWwxWWVHZWdy?=
 =?utf-8?B?Q2NHNUxFek5UcWNqK214SjJKbzdRVkVPak1GTHpBUFNFcjIvN3hXSmhabGtI?=
 =?utf-8?B?UFVGTjNmWklXUGdnMFRWcnd5RmJ6dm9CTHJTa0tnRGcvSnFKd09zdUJnN2t5?=
 =?utf-8?B?eVQxVWttakJrU0ZCVisvT0dCdjhaSlB1a0xKU3RTa0dKclpMbDhzQjJqeGcy?=
 =?utf-8?B?QWlFWTFHd1llMzhnN0N2OHk5TlkxSGxRLy90dmQ1ckVZQmFqRzBuMmlITDB5?=
 =?utf-8?B?UksvMDlQWG1ZRDhueVp2d3ZRYnREQVl5RGtWK2pGdWZ1QlZEcTBua3VhTHR4?=
 =?utf-8?B?NVlSNEdmdW43UGh1QXhmMjl3TUFhdDdTTHprWlp6bkJJbGY4R212U2ZkbTNl?=
 =?utf-8?B?aDd4TTdhY1N1ZnBwbzF0eU9ESHZkTUZ5aUFqMmNxSHB3Y3pkWkY2QU80dHFP?=
 =?utf-8?B?SDMvOFVWdWJkalQ4NGRKOXVLOFJQN0xDWjYxbkdQQnNQdzk3RTd3QT09?=
X-Exchange-RoutingPolicyChecked: dlKB6WdpsLnIPxTYsek1zM0JvsWcFwB/bG46cR9pqpMp/1NdzDzsTQgU4+q+qkf+WLj4MOJa3TIbizewMAAfkFvvNZ+qPcX9tfY2+1Fe8tjwx1uYsm8YQRaJpi5A5C2XkYYBWpJCVaXcQmdlyVyErvQlHWEPlq60Um+i86ZTASkTakiG58Yt8KTtxQlx/xpE0O5jnZfqz1c+XQKYBb+B6kUY8YEejH0N+BtUJ+fuHPdX9sYw8t27BcgvLDJQfgo6vd4eeJ5MxJGCsc6fgJTfwUeSIyHVV4hMxDfoox7hvL5GqtL3+52/gzlQ9XRpXlHdlhg9ceLNTbrBBN9w7Wc0Cg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 756d6afb-8f0f-40f6-a37d-08df367dffbc
X-MS-Exchange-CrossTenant-AuthSource: DS6PR11MB087165.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2026 12:04:50.2611 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NHMN6t+eKNtmomIrmLhYnJPUH8DcBT95Fwip44KeAsI/f4KxVmGlRCaqdliNH2FupBKwgz+Q5PI88sg9ua6ung==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PR11MB004556
X-OriginatorOrg: intel.com
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Ravi,

On 29-10-2026 14:29, Ravi Kishore Koppuravuri wrote:
> Added event notification support with subscribe for an error-notify event
> and wait for the event notification functionalities.
>
> Signed-off-by: Ravi Kishore Koppuravuri <ravi.kishore.koppuravuri@intel.com>
> ---
> v6:Added normalize_nl_error() for subscribe and wait_for_event functions
> v5:Added a guard to prevent duplicate multicast group subscriptions (Soham)
> v4:Renamed the library functions with prefix "igt_drm_netlink_*" (Nikula
>     Jani & Kamil)
>     updated error event name from error-notify to error-report to align
>     with the latest changes in drm-uapi/drm_ras.h
> v2:Handled SEQ_CHECK nl response using separate callback
>     Added monotonic-clock deadline to wait for messages without exceeding the
>     caller’s total timeout.
>     Added support to receive events until it sees an event whose node ID and
>     error ID match the requested values.
> ---
>   lib/igt_drm_ras_nl.c | 184 +++++++++++++++++++++++++++++++++++++++++--
>   lib/igt_drm_ras_nl.h |  18 +++++
>   2 files changed, 195 insertions(+), 7 deletions(-)
>
> diff --git a/lib/igt_drm_ras_nl.c b/lib/igt_drm_ras_nl.c
> index d23fce08f..62e48662e 100644
> --- a/lib/igt_drm_ras_nl.c
> +++ b/lib/igt_drm_ras_nl.c
> @@ -6,6 +6,7 @@
>   #include <errno.h>
>   #include <poll.h>
>   #include <stdint.h>
> +#include <time.h>
>   
>   #include <netlink/errno.h>
>   #include <netlink/genl/ctrl.h>
> @@ -62,10 +63,12 @@ static int ras_command_cb(struct nl_msg *msg, void *arg)
>   	nlh = nlmsg_hdr(msg);
>   	gnlh = nlmsg_data(nlh);
>   
> -	ret = genlmsg_parse(nlh, 0, attrs,
> -			    DRM_RAS_A_ERROR_COUNTER_ATTRS_MAX, NULL);
> -	if (ret < 0)
> -		return NL_SKIP;
> +	if (gnlh->cmd != DRM_RAS_CMD_ERROR_EVENT) {
> +		ret = genlmsg_parse(nlh, 0, attrs,
> +				    DRM_RAS_A_ERROR_COUNTER_ATTRS_MAX, NULL);
> +		if (ret < 0)
> +			return NL_SKIP;
> +	}
>   
>   	switch (gnlh->cmd) {
>   	case DRM_RAS_CMD_SET_ERROR_THRESHOLD:
> @@ -85,14 +88,44 @@ static int ras_command_cb(struct nl_msg *msg, void *arg)
>   			nla_get_u32(attrs[DRM_RAS_A_ERROR_COUNTER_ATTRS_ERROR_THRESHOLD]);
>   		break;
>   	}
> +	case DRM_RAS_CMD_ERROR_EVENT: {
> +		struct nlattr *event_attrs[DRM_RAS_A_ERROR_EVENT_ATTRS_MAX + 1];
> +
> +		ret = genlmsg_parse(nlh, 0, event_attrs,
> +				    DRM_RAS_A_ERROR_EVENT_ATTRS_MAX, NULL);
> +		if (ret < 0)
> +			return NL_SKIP;
> +
> +		if (!event_attrs[DRM_RAS_A_ERROR_EVENT_ATTRS_NODE_ID] ||
> +		    !event_attrs[DRM_RAS_A_ERROR_EVENT_ATTRS_ERROR_ID] ||
> +		    !event_attrs[DRM_RAS_A_ERROR_EVENT_ATTRS_ERROR_VALUE])
> +			return NL_SKIP;
> +
> +		ctx->event_node_id =
> +			nla_get_u32(event_attrs[DRM_RAS_A_ERROR_EVENT_ATTRS_NODE_ID]);
> +		ctx->event_error_id =
> +			nla_get_u32(event_attrs[DRM_RAS_A_ERROR_EVENT_ATTRS_ERROR_ID]);
> +		ctx->event_error_value =
> +			nla_get_u32(event_attrs[DRM_RAS_A_ERROR_EVENT_ATTRS_ERROR_VALUE]);
> +		ctx->event_received = ctx->event_node_id == ctx->node_id &&
> +				      ctx->event_error_id == ctx->error_id;
> +		break;
> +	}
>   	default:
>   		return NL_SKIP;
>   	}
>   
> -	ctx->reply_received = true;
> -	if (ctx->ack_received)
> -		ctx->cmd_done = true;
> +	if (gnlh->cmd != DRM_RAS_CMD_ERROR_EVENT) {
> +		ctx->reply_received = true;
> +		if (ctx->ack_received)
> +			ctx->cmd_done = true;
> +	}
> +
> +	return NL_OK;
> +}
>   
> +static int ras_multicast_seq_check_cb(struct nl_msg *msg, void *arg)
> +{
>   	return NL_OK;
>   }
>   
> @@ -158,6 +191,27 @@ static int register_callbacks(struct nl_cb *cb, struct igt_drm_ras_nl_context *c
>   	return 0;
>   }
>   
> +static int register_multicast_callbacks(struct nl_cb *cb,
> +					struct igt_drm_ras_nl_context *ctx)
> +{
> +	int ret;
> +
> +	ret = nl_cb_set(cb, NL_CB_VALID, NL_CB_CUSTOM, ras_command_cb, ctx);
> +	if (ret < 0) {
> +		igt_warn("Failed to set NL_CB_VALID callback (ret=%d)\n", ret);
> +		return ret;
> +	}
> +
> +	ret = nl_cb_set(cb, NL_CB_SEQ_CHECK, NL_CB_CUSTOM,
> +			ras_multicast_seq_check_cb, ctx);
> +	if (ret < 0) {
> +		igt_warn("Failed to set NL_CB_SEQ_CHECK callback (ret=%d)\n", ret);
> +		return ret;
> +	}
> +
> +	return 0;
> +}
> +
>   static int send_and_recv_nl_msg(struct igt_drm_ras_nl_context *ctx,
>   				struct nl_cb *cb,
>   				struct nl_msg *msg)
> @@ -303,7 +357,12 @@ static void reset_drm_ras_nl_context(struct igt_drm_ras_nl_context *ctx)
>   	ctx->ack_received = false;
>   	ctx->response_required = false;
>   	ctx->error_threshold = 0;
> +	ctx->event_node_id = UINT32_MAX;
> +	ctx->event_error_id = UINT32_MAX;
> +	ctx->event_error_value = 0;
> +	ctx->event_received = false;
>   	ctx->family_id = -1;
> +	ctx->subscribed_grp_id = -1;
>   }
>   
>   void igt_drm_ras_nl_cleanup(struct igt_drm_ras_nl_context *ctx)
> @@ -446,3 +505,114 @@ int igt_drm_ras_nl_set_error_threshold(struct igt_drm_ras_nl_context *ctx)
>   
>   	return 0;
>   }
> +
> +int igt_drm_ras_nl_subscribe_error_report(struct igt_drm_ras_nl_context *ctx,
> +					  const char *notify_group_name)
> +{
> +	int grp_id;
> +	int ret;
> +
> +	if (!ctx || !ctx->sock || ctx->family_id < 0 ||
> +	    !notify_group_name || notify_group_name[0] == '\0')
Could a short igt_debug()/igt_warn() be added ?
> +		return -EINVAL;
> +
> +	grp_id = genl_ctrl_resolve_grp(ctx->sock,
> +				       DRM_RAS_FAMILY_NAME,
> +				       notify_group_name);
> +	if (grp_id < 0)
> +		return normalize_nl_error(grp_id);
> +
> +	/* Check if already subscribed to the requested multicast group */
> +	if (ctx->subscribed_grp_id == grp_id) {
> +		igt_debug("Already subscribed to DRM RAS multicast group '%s' (id=%d).\n",
> +			  notify_group_name, grp_id);
> +		return 0;
> +	}
> +
> +	ret = nl_socket_add_membership(ctx->sock, grp_id);
> +	if (ret < 0)
> +		return normalize_nl_error(ret);
> +
> +	ctx->subscribed_grp_id = grp_id;
> +
> +	igt_debug("Subscribed to DRM RAS multicast group '%s' (id=%d).\n",
> +		  notify_group_name, grp_id);
> +
> +	return 0;
> +}
> +
> +int igt_drm_ras_nl_wait_for_error_report_event(struct igt_drm_ras_nl_context *ctx,
> +					       int timeout_ms)
> +{
> +	struct nl_cb *cb;
> +	struct pollfd pfd;
> +	struct timespec start, now;
> +	int remaining_ms;
> +	int ret;
Inverted xmas tree.
> +
> +	if (!ctx || !ctx->sock || ctx->family_id < 0)
> +		return -EINVAL;
> +
> +	if (timeout_ms < -1)
> +		return -EINVAL;
> +
> +	cb = nl_cb_alloc(NL_CB_DEFAULT);
> +	if (!cb)
igt_warn/igt_debug log
> +		return -ENOMEM;
> +
> +	ret = register_multicast_callbacks(cb, ctx);
> +	if (ret < 0) {
> +		nl_cb_put(cb);
> +		return normalize_nl_error(ret);
> +	}
> +
> +	ctx->event_received = false;
> +	clock_gettime(CLOCK_MONOTONIC, &start);
> +
> +	pfd.fd = nl_socket_get_fd(ctx->sock);
> +	pfd.events = POLLIN;
> +	pfd.revents = 0;
> +
> +	while (!ctx->event_received) {
> +		if (timeout_ms == -1) {
> +			remaining_ms = -1;
> +		} else {
> +			clock_gettime(CLOCK_MONOTONIC, &now);
> +			remaining_ms = timeout_ms -
> +				       (int)((now.tv_sec - start.tv_sec) * 1000 +
> +				       (now.tv_nsec - start.tv_nsec) / 1000000);
> +			if (remaining_ms <= 0) {
igt_warn/igt_debug log
> +				ret = -ETIMEDOUT;
> +				break;
> +			}
> +		}
> +
> +		ret = poll(&pfd, 1, remaining_ms);
> +		if (ret == 0) {
ditto
> +			ret = -ETIMEDOUT;
> +			break;
> +		}
> +
> +		if (ret < 0) {
> +			ret = -errno;
> +			break;
> +		}
> +
> +		ret = nl_recvmsgs(ctx->sock, cb);
> +		if (ret < 0) {
> +			ret = normalize_nl_error(ret);
> +			break;
> +		}
> +	}
> +	nl_cb_put(cb);
> +	if (ret < 0)
> +		return ret;
> +
> +	if (!ctx->event_received)
> +		return -ENOMSG;
> +
> +	igt_debug("Received error-notify event: node_id=%u error_id=%u value=%u\n",
Could the log string be renamed to "error-report" instead of 
"error-notify" to stay consistent with the function name?

Regards,
Soham
> +		  ctx->event_node_id, ctx->event_error_id, ctx->event_error_value);
> +
> +	return 0;
> +}
> diff --git a/lib/igt_drm_ras_nl.h b/lib/igt_drm_ras_nl.h
> index 5c9be5b17..057c6026f 100644
> --- a/lib/igt_drm_ras_nl.h
> +++ b/lib/igt_drm_ras_nl.h
> @@ -47,6 +47,21 @@ struct igt_drm_ras_nl_context {
>   
>   	/** @error_threshold: Error threshold value to query/set */
>   	uint32_t error_threshold;
> +
> +	/** @event_node_id: RAS node ID reported by an error-report event */
> +	uint32_t event_node_id;
> +
> +	/** @event_error_id: RAS error ID reported by an error-report event */
> +	uint32_t event_error_id;
> +
> +	/** @event_error_value: Error counter value reported by an error-report event */
> +	uint32_t event_error_value;
> +
> +	/** @event_received: Set when a matching error-report event has been received */
> +	bool event_received;
> +
> +	/** @subscribed_grp_id: Multicast group ID currently subscribed to, or -1 if none */
> +	int subscribed_grp_id;
>   };
>   
>   void igt_drm_ras_nl_cleanup(struct igt_drm_ras_nl_context *ctx);
> @@ -54,6 +69,9 @@ int igt_drm_ras_nl_init(struct igt_drm_ras_nl_context *ctx);
>   int igt_drm_ras_nl_get_error_counter(struct igt_drm_ras_nl_context *ctx);
>   int igt_drm_ras_nl_get_error_threshold(struct igt_drm_ras_nl_context *ctx);
>   int igt_drm_ras_nl_set_error_threshold(struct igt_drm_ras_nl_context *ctx);
> +int igt_drm_ras_nl_subscribe_error_report(struct igt_drm_ras_nl_context *ctx,
> +					  const char *notify_group_name);
> +int igt_drm_ras_nl_wait_for_error_report_event(struct igt_drm_ras_nl_context *ctx, int timeout_ms);
>   
>   #endif /* IGT_DRM_RAS_NL_H */
>   
