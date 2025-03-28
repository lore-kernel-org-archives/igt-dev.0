Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADF5CC28B20
	for <igt-dev@archiver.kernel.org>; Fri, 28 Mar 2025 10:40:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 589DF10E9D8;
	Fri, 28 Mar 2025 10:40:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XpxYtHDH";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C27E10E9D8
 for <igt-dev@lists.freedesktop.org>; Fri, 28 Mar 2025 10:40:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1743158436; x=1774694436;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:mime-version;
 bh=pTKJWEdgDMpU9dfvLl3M2PZCYhIDIxBbuWfRMa5mek0=;
 b=XpxYtHDHFIo4jRvSVbDCLlyfMSJANvbyNAkXNA4D6N9wJCjSenty461j
 XD0uXPybm1K/f8VMQAdtnnrYd1tzKvjeuoRFV7Su1JeE7nXUUjLb+IyEW
 fYcaPKy8gs0zs3Iq2EBdM7HoYpMOP3D58lQEzqjFW6KJ8JyRIYC9r+Bbv
 ldTtkrxrBbef9ca6elYQ5ezZhFVrXRqpUr8Beq5PLDXy5WBxeqv9Ar1DP
 J3V20p+JCNKy+roDmogkn3Y04k6Z0ce62+rreNV4P78bo7hFZHAAbyK0s
 tv+YZguelLFqxmxV14Dcl7vC0gywPBzez+MZEKq+mKGT1/H7IsXiD2SgP A==;
X-CSE-ConnectionGUID: NUkSg9plRzeQUqwk4yRjNw==
X-CSE-MsgGUID: YWHc5pp6SpOAI+2fTgUn6w==
X-IronPort-AV: E=McAfee;i="6700,10204,11385"; a="66988862"
X-IronPort-AV: E=Sophos;i="6.14,283,1736841600"; d="scan'208,217";a="66988862"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Mar 2025 03:40:36 -0700
X-CSE-ConnectionGUID: orjveMmcQ0mSPsVJh8tE1A==
X-CSE-MsgGUID: wRj8Rjy5SQaOPlh6YYpsRQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,283,1736841600"; 
 d="scan'208,217";a="125176972"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa009.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 28 Mar 2025 03:40:35 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Fri, 28 Mar 2025 03:40:35 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Fri, 28 Mar 2025 03:40:35 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.169)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Fri, 28 Mar 2025 03:40:34 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jxqKabmIGm4QXyFN2MaCQvCjwtp5osJS8BCYyfwHkumgZ6bUOch6aX2Qk49dHXGRZ53NxCXaC3paG4UoKbhSToM4rnYdRXINysgB+cjgqw1t+Qppxi8jl/8ulTaWczrQjgl8gZvqVvR80W5SJBv55zWe4DogTQCCJkogGx/m3llnYQcqstp4CWWky1UfPyarVDpHn+q8w4mN23yBuFxVqbWdx59Fj+bjaRYXI/moOhqXlN8vcP+1sIreDKLzvCZPee+8oi0WGGU2JKF3DAzxseOFoJm8ZqFZQz7fQvB1KJByy4bUkD8fzZ9aVRQk8Y3cKesPUT6W1FFS0HCyMQ0seg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/Hio7DES/p/qQ2CEkodfxZ4ejO0N+tUuH2tgTlkRVeg=;
 b=VasNPqN6Top/L8FHHeAT/ZTtLH05pMZBjhAAz5OaGe2vXBydVy6r14eD99uo8Y3fu8lVfRmIwl5A1egDtlan7Ru0vFAARogJpvTBq3vum18RSiak7aZid+4M3cxh7XaUKALo6FlS8dWPWq7aW6jU+f2VHMkIc7IZWAhrPPjKj2/D/fEgJdxY+40H/eIfsXugn7qszppOAsEQSDuiLfIfBVknvR6Gr7K5hN9uUU4SShlj8F8k52BNfnsy7MxTN7mdaA8/yOwouGabGfmiV1nNMFs1DA8Wwecy/VCp4BuoVqfApYFBk8KAhTA4V/1nwcKxpNiEzYKQvRWT7a5V/INgbw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM6PR11MB4738.namprd11.prod.outlook.com (2603:10b6:5:2a3::18)
 by CH3PR11MB8414.namprd11.prod.outlook.com (2603:10b6:610:17e::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.42; Fri, 28 Mar
 2025 10:40:32 +0000
Received: from DM6PR11MB4738.namprd11.prod.outlook.com
 ([fe80::7064:9c9a:d2ca:c6a1]) by DM6PR11MB4738.namprd11.prod.outlook.com
 ([fe80::7064:9c9a:d2ca:c6a1%6]) with mapi id 15.20.8534.043; Fri, 28 Mar 2025
 10:40:32 +0000
Content-Type: multipart/alternative;
 boundary="------------E0iqPpeosJ9w9YDz0nT1DqK0"
Message-ID: <090b37cd-d15b-4bf8-b13b-cad0f5a002f3@intel.com>
Date: Fri, 28 Mar 2025 16:10:23 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] tests/kms_vrr: Bucketize refresh rate tolerance
To: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>,
 <igt-dev@lists.freedesktop.org>
CC: <uma.shankar@intel.com>, <ankit.k.nautiyal@intel.com>
References: <20250328050959.659508-1-mitulkumar.ajitkumar.golani@intel.com>
 <20250328050959.659508-2-mitulkumar.ajitkumar.golani@intel.com>
Content-Language: en-US
From: "Naladala, Ramanaidu" <Ramanaidu.naladala@intel.com>
In-Reply-To: <20250328050959.659508-2-mitulkumar.ajitkumar.golani@intel.com>
X-ClientProxiedBy: MA1P287CA0024.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a00:35::25) To DM6PR11MB4738.namprd11.prod.outlook.com
 (2603:10b6:5:2a3::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR11MB4738:EE_|CH3PR11MB8414:EE_
X-MS-Office365-Filtering-Correlation-Id: 6605d34f-cd9d-48d5-797f-08dd6de4f724
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|8096899003;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?YnZua0wzbnVqNFl6L3NRWFpyMlVLRlRaVWc1azU3UVA4YWlLYUo3Mi9ia2ZK?=
 =?utf-8?B?ZG9uMUMrdkdQYnRXVmVsR21XV0hqaU9QMmc2d3VSb0xIY2JQRy9wTFZkVFZI?=
 =?utf-8?B?Sm45bzRkWUg1bGp4SzAyY2VQTkxIRFJKSWk2YlE2eHFkcjVQZ1hIN0lIRnJX?=
 =?utf-8?B?R0E5SzVHbkJmWUh1bVAvRlpnRVBNcUtDOGp6cVV6Yk5MVlZGOVpPcThDcXNU?=
 =?utf-8?B?Q2JSbmNidGVHVXRubGpKZkZ2c1N5MWhDZXk0ZWwwNi95djJsYWxRMkhTWkxH?=
 =?utf-8?B?OTMzM1I1Qy9QaVFBYnVRRTYxVW9ZUjcwNnZ1cHhxakZ0QWdFWmtWNFlhRXpC?=
 =?utf-8?B?K2syallPSnZDekxsUFFLMStkOHI3WUJmSkhTdTI2L0NwM2JCU0FsZDNmTHFj?=
 =?utf-8?B?NlZranB0Um1OZnI4Wmx4YXcyUnVuM3VyMkJETHVrbkdxMlBJRCthTlRFdGN1?=
 =?utf-8?B?OXdVa0xJTXdNNFBwdXZQbk1SZVExcklYMjRRZE5wTXNpbFZWc2RJVnFMSWNo?=
 =?utf-8?B?TXFFM1FLeWl2M0FwclE4VWhUQjFtVWxTRXNXM292dGowNjhhYnZSclJza205?=
 =?utf-8?B?YzdoTVJ6NmJvVWlXb3NKaUd2SFdjK09hSmNMTUhLS3Y3QkNVVTErYWErZkZ2?=
 =?utf-8?B?ZHNUSjZWMFd6cVppWVNSMDBXZmVqZlpFSU9VOUpOL2haQWxoeXdFMjBmelpZ?=
 =?utf-8?B?M2tnTzdOdnF1YUhya1NOMXBETW9MeURSTHNsbHJrZWx0QUdBUjBkOFNwaU5V?=
 =?utf-8?B?WUpXNGNjMXlPWDNSRldwSVFteTJvWHQ4U1ltQkZxMHEwYmxROTNLSVlLSm9I?=
 =?utf-8?B?a0xLWDN2d015a1YzMTE1T1pSMldQbzdEOENyNkFoVHVRem1weGlodFhUaEJ5?=
 =?utf-8?B?aW9OSS90NnN2T0ExdkJhYnpjczh6ajl2MGZiazdZaUhrWlBsNmVTQlpHWGt1?=
 =?utf-8?B?TWt6S0V2MDBqR2syS3VtOVBoWng4NnpjUkwrd0EyT29UdEVIcjNUVEowK0tS?=
 =?utf-8?B?TE5TT1EwVnZCdXppZGZRWFkzMkx3SDhvMUZyNFN3Q2ZsU2JWZHFLYzdPMzdm?=
 =?utf-8?B?UHNTVkdlQXZ6YmRmdEFUMTNjdVR2NGN6MFFtRmNwZU1paGk3TDhhZnBmVU9C?=
 =?utf-8?B?dERCM3M4QmhEV2xnSk1tVnFpSmdqaXRSc1BRTW43OTZoMEJRQzVqWmh0ME5h?=
 =?utf-8?B?Z252VDFsWTZRbWNzelByUHhKcTI5b2tGQnBLZGQ2Ri9zdE1sTTdnSldDMTFj?=
 =?utf-8?B?ckdaaXN1bDJNY3A5eEVPZ2tsT0sxeGxDU2ppWmFRMERTajJHYTJoYkdESFpj?=
 =?utf-8?B?TXd5T3h6b2w4U3o1OGtNdk5lSGEyeEZXZGtEOEdqWUYwaTNDdW8vb25xVnlH?=
 =?utf-8?B?SFlnZGQ5dEU4TXZEb1ErWXR4YnloRjBiSzQzcEk5cGU4RVlxV0ZKaE1Nc2Z2?=
 =?utf-8?B?NEpHRWk1aDlGdXRKNkRWMDIzTE8zOUo3NmNCcGJPS2JaVzQrK1VFbUhkTmd1?=
 =?utf-8?B?bDJGZFFDbnh4dzRCcjh0U20wL05nZWdITEx4T2l6UTE0ZTc3OUpKUng1eWl6?=
 =?utf-8?B?N1JicGpLYkxYdEV6VHFNTDdQRDFVL0FGVVUwaHlkTlR0bGZhdlFkazdwSjRv?=
 =?utf-8?B?aEhQVVo0bTBEU20zekJBSUdPUEh1MEIvRWNFWkdtTmxuUnBWb0VQVXcwWW1Z?=
 =?utf-8?B?Q2JNTmx3UjFhWGtBYmwzQ1JIQ3hybnJaNWVLdXpxZElqTENlR1dwdklyZHZl?=
 =?utf-8?B?TXJNeDlmV2NnVkxDaUlyc3Q2dElQNWgxZHEwM3cxMGFCaWF6OGxBNmlyaTBN?=
 =?utf-8?B?aDNpWitDbUgxOGpCeUJ5b3prajZsOFVxTVF6SjFCdTM3Sk5nUk1GTFVXWjFo?=
 =?utf-8?Q?lImPglnAAB2Q8?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR11MB4738.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(8096899003); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?L0hjRUxqUElLMUxPSk5GNDZIbmd5dkJVQy9UdCtjbHQ5MnF3NUJia1Npd3Aw?=
 =?utf-8?B?NjVLeG5nTmh5RXpjaTA5dzFPZlJ5ekNDTzVKTlorb2Z6Wjh3RGppOUF4OGxk?=
 =?utf-8?B?R0RMUHMzYnZsb0d5eURrSFgreWYvMEFXcWFEVngxYm9VVWhjTllLdjR3WXoz?=
 =?utf-8?B?eGJiakZrSWhlYk9NYzM0K3hJa0hoVWVXaHc2SEp1YTFuZE11K21UdVhwczJ5?=
 =?utf-8?B?YlBTd0k0dFJaUlNSWVdqdUpaM0tOVldIOTF1Z1p2VVpiMHRtQVd6cm5yUHJq?=
 =?utf-8?B?dDBSRzhYWm92dytzU0NiaS8vdWtaWWJGRDFCOTlwOXVqTlZZalB1bjg3Z0tT?=
 =?utf-8?B?Rk83U1FpNnBwTkhFVXFrck9HZG1zZG9za0xGMStrZDdzVmJGZmVlaEFpQWFT?=
 =?utf-8?B?VEZFQVUwUmZiaCttaHpRUTNUSEwzalBrWUhYRnptK2VWQ2RScXZseTJDU1pO?=
 =?utf-8?B?cWhnRkU3RURCNWRqS3pBb2FpV2UrY0d2YURJN3k1Z1lWc1E0Q2xKSlpjUU9p?=
 =?utf-8?B?OXRVZjFkWno0QjdEdy8xUU45cUpOTCtIREY4RkJhcDV1WmUwWnE2bmExZ2NX?=
 =?utf-8?B?OE42MEpybHh6dTdlUkNGMTFIL1Z0bVF0UnF0VTUxZmZkbThYdGhjMVZuSFhW?=
 =?utf-8?B?Y1R6dDdYek81c2taWWhmWW9GMGFvdUg0OFVnam9sRjNzNWwvYWRZSnFuUFdm?=
 =?utf-8?B?K2FBTTFIOUJidm1lYzB5ZVdKeTV6K1lTSE5yQ0c0WHNrdzVXcEkxS3k2L0Nj?=
 =?utf-8?B?UG8yK1ZLcUEweFJIK2lpTkM5cWxuY2FZdmpmdzhxcWZKR0hHQmFrWWxxRVl4?=
 =?utf-8?B?K2lVQUZlWkxsMWhac0FqTXlkd1VOOE9zT2hQV0lIUHh3VzZKb1RXQXBwaUN4?=
 =?utf-8?B?V3dyUDFmb1FIR2ZIc0oyTEdOanVtOUtFbVh3U3FLQ29GSWZaODJMK2VNVXky?=
 =?utf-8?B?NDFoRlMxcEdKcTdFaXJpei9qaGFrZ3B6Y05aaEJuRnlyR2JycytyTklvUm41?=
 =?utf-8?B?a2RtRXBzNmpsU1d4SnZ4dlk0a2JHaEJzMWoxV0tXUGl0QzRVa2J1OE9ERUI2?=
 =?utf-8?B?NCtTeW1Kbjh3NEtrNXBNWlQxVlNIRHNTbWhWOGFjSEQ1am5ZcVhnSEJmbEZT?=
 =?utf-8?B?b1J3RXhuczE4LzV3c09GYk1CREdSNGdCa0I4K2JJWlJnWXdoc0R5QnFNS1Ew?=
 =?utf-8?B?VjRIa2FEWEJvVmZwUUViUStyc01qSzNmOVRQcVlLRnlMM0xFblN5eXFvK2VZ?=
 =?utf-8?B?cjRnNUlqbXBKbnlRYkJ3WTM4bGpIbDVSdUlSUWUweU1CekxQTk1oL2FiMllT?=
 =?utf-8?B?ZCtwd2xwTkhzc1lSRjBramJlUzRIUmNmMDFtcGdnREE5eExtekdZQTgzdkNU?=
 =?utf-8?B?NXlpSHJ1UUFhdUx6Y1pXMDhtWFpsdzlrOUlFMGtZWXhlMU1sM3BRV3VGNE9K?=
 =?utf-8?B?UmtWQzNnM1BIRlI4Q1hxOTVVZEczSEt1RXlvOEh3YzlhM0VMcjNVWXhKM2p5?=
 =?utf-8?B?Nks1eEgrSkFyWHB6RmxPZDlqcXJ0aWlEcGZBWU5TaEIxWGdKNnlmTVNHWDhT?=
 =?utf-8?B?YjJrSVlDU2lIYjlKK2JiUzIzQ1RNckl2Wks1UTFWWEl4UHJxY05aVmlmOUxC?=
 =?utf-8?B?WnFDOG94UEpMOUc0ajMraURuTWdvZ2JEVHNORXFzZTl4R3Nxc0lrTUF1SHdz?=
 =?utf-8?B?aEVPZWg0MTlZcHFnYTNuc0RaQVB4MHoxUkRseVNzQjNoWjZUbWNtd2pJQjZZ?=
 =?utf-8?B?K1pDU3RSVnU5TkdWSGNySzh2REYwUjllWkt3TDdWWlhza2ZHWnoxbkdzazFj?=
 =?utf-8?B?a0RIYzJHSUcvalNhVmdVZEVnL3dTSGU3ZWZqaUp5NUxmeEVZRzFxd0FLRGFY?=
 =?utf-8?B?ZjQ4TXk5VGhVUzZETEtmdmVEaFpoaUZ4WWUvWjk5elBXYVVaY1p3UkVpRkdF?=
 =?utf-8?B?VlpvSzBQbXIyVVgvZUREVzk2UEZkYjJTYWlDZ1VxK2RmNDczcldUQlVnQWJv?=
 =?utf-8?B?UWlrSngzclpBcDJiaXBqYTZmb202cDRRa3VKeUlnRWZleHJoQXFQcnVBY1Zv?=
 =?utf-8?B?Q2hLRTJIazZwVUJHbTcwbXJKSXFBbVRia01hUkF0OFVyeUVoTEtTUkI2RDNX?=
 =?utf-8?B?WE8zNDFha2gzdjJ2TXJzcTZlRFVlV1R0NVRKL3pKczlpcVdiOWFwK3JCL3Fy?=
 =?utf-8?B?R1E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6605d34f-cd9d-48d5-797f-08dd6de4f724
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB4738.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Mar 2025 10:40:32.5041 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TVFO8Qoz3Nmz1eMIeA05f5QIls5F1lcbLhCl5sGI5OAbfxTPUpSq1o1YfwYX21N3XMDKK7jo9rzH8QsqFf/TzWM+M9Lxs9DRVfAhXAyPh3U=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8414
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

--------------E0iqPpeosJ9w9YDz0nT1DqK0
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit

Hi Mitul,

On 3/28/2025 10:39 AM, Mitul Golani wrote:
> Reduce false failures while preserving timing accuracy. Introduce
> a small tolerance buffer based on refresh rate which accounts for
> HW/SW latency without compromising validation on HRR panel.
>
> --v2:
> - correct refresh rate criteria.
>
> Signed-off-by: Mitul Golani<mitulkumar.ajitkumar.golani@intel.com>
> ---
>   tests/kms_vrr.c | 50 ++++++++++++++++++++++++++++++++++++++++++++++---
>   1 file changed, 47 insertions(+), 3 deletions(-)
>
> diff --git a/tests/kms_vrr.c b/tests/kms_vrr.c
> index c4bb30f6a..c7be37ff8 100644
> --- a/tests/kms_vrr.c
> +++ b/tests/kms_vrr.c
> @@ -410,6 +410,52 @@ do_flip(data_t *data, igt_fb_t *fb)
>   	igt_reset_timeout();
>   }
>   
> +static void
> +calculate_tolerance(uint64_t *threshold_hi, uint64_t *threshold_lo, uint64_t rates_ns)
> +{
> +	uint32_t refresh_rate = NSECS_PER_SEC/rates_ns;
> +
> +	if (refresh_rate < 0)
> +		return;
> +
> +	/*
> +	 * Current IGT implementation follows this sequence:
> +	 * 1. Perform a page flip (`do_flip`).
> +	 * 2. Wait for the flip completion event.
> +	 * 3. Compare the timestamp of the flip completion event with the previous frame’s completion timestamp.
> +	 * 4. Adjust CPU cycle burning based on the relative frame time.
> +	 *
> +	 * If a flip completes too early or too late, it is marked as out of tolerance.
> +	 * As a result, additional CPU cycles are burned to match the `target_ns`.
> +	 * Even if the next frame is on time, the total frame time now includes:
> +	 * Burned CPU cycle time (from the previous frame) + Flip completion event time.
> +	 * This leads to miscalculation, causing **false out-of-range detections**.
> +	 * The impact is more significant on High Refresh Rate (HRR) panels, where: The allowed tolerance
> +	 * window is smaller and more correction time is required. i.e. for 210hz (4.762ms), allowed range is
> +	 * 209hz(4.784ms) to 211hz(4.739ms). This comes just 23 microsecond tolerance, which is much lesser
> +	 * for accounting HW/SW latency, CPU burn cycle latency and correction logic applied in igt for
> +	 * validation.
> +	 *
> +	 * To address this implement a Bucketing Strategy:
> +	 * Provide a small tolerance buffer to allow IGT tests to account for correction. based on range of
> +	 * asked refresh rate. This prevents excessive failures due to minor timing adjustments.
> +	 * Although an imperical number but already IGT is living with that.
> +	 * This also ensures that asked refresh rate is not too off and always catch the real HW/software
> +	 * latencies.
> +	 */
> +
> +	if (refresh_rate <= 120) {
remove = in this if condition if (refresh_rate < 120)
> +		*threshold_hi = NSECS_PER_SEC / (((float)NSECS_PER_SEC / rates_ns) + 1);
> +		*threshold_lo = NSECS_PER_SEC / (((float)NSECS_PER_SEC / rates_ns) - 1);
> +	} else if (refresh_rate >= 120 && refresh_rate <= 240) {
> +		*threshold_hi = NSECS_PER_SEC / (((float)NSECS_PER_SEC / rates_ns) + 5);
> +		*threshold_lo = NSECS_PER_SEC / (((float)NSECS_PER_SEC / rates_ns) - 5);
> +	} else {
> +		*threshold_hi = NSECS_PER_SEC / (((float)NSECS_PER_SEC / rates_ns) + 10);
> +		*threshold_lo = NSECS_PER_SEC / (((float)NSECS_PER_SEC / rates_ns) - 10);
> +	}
> +}
Patch has style problems please check by running checkpatch.pl.

imho, Better to add one more bucket for refresh rate between 60 to 120 
to +/-2 deviation range.

from my analysis below observed,

from (60 -140) flips are in deviation range of 2, from (140 -220) flips 
are in deviation range of 5 and after 220 flips are in deviation range 
of 10.

			Number of flips on threshold
SNO 	RR 	Total flips 	1 	2 	5 	10
1 	62 	311 	307(98.7%) 			
2 	94 	471 	291(61.78%) 	458(97.24%) 		
3 	126 	631 	447(70.84%) 	587(93.02%) 		
4 	158 	791 	257(32.50%) 	521(65.86%) 	788(99.62%) 	
5 	190 	951 		504(52.99%) 	907(95.37%) 	
6 	222 	1111 			802(72.18%) 	1083(97.48%)
7 	254 	1271 			1022(80.40%) 	1249(98.26%)
8 	286 	1431 			675(47.16%) 	1160(81.06%)
9 	318 	1591 			892(56.06%) 	1393(87.56%)
10 	350 	1751 			739(42.18%) 	1591(90.81%)




> +
>   /*
>    * Flips at the given rate and measures against the expected value.
>    * Returns the pass rate as a percentage from 0 - 100.
> @@ -439,9 +485,7 @@ flip_and_measure(data_t *data, igt_output_t *output, enum pipe pipe,
>   		else
>   			exp_rate_ns = vtest_ns.max;
>   
> -		/* Allow ~1 Hz deviation for different reasons causing delay. */
> -		threshold_hi[i] = NSECS_PER_SEC / (((float)NSECS_PER_SEC / exp_rate_ns) + 1);
> -		threshold_lo[i] = NSECS_PER_SEC / (((float)NSECS_PER_SEC / exp_rate_ns) - 1);
> +		calculate_tolerance(&threshold_hi[i], &threshold_lo[i], exp_rate_ns);
>   
>   		igt_info("Requested rate[%d]: %"PRIu64" ns, Expected rate between: %"PRIu64" ns to %"PRIu64" ns\n",
>   				i, rates_ns[i], threshold_hi[i], threshold_lo[i]);
--------------E0iqPpeosJ9w9YDz0nT1DqK0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p>Hi Mitul,</p>
    <div class="moz-cite-prefix">On 3/28/2025 10:39 AM, Mitul Golani
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20250328050959.659508-2-mitulkumar.ajitkumar.golani@intel.com">
      <pre wrap="" class="moz-quote-pre">Reduce false failures while preserving timing accuracy. Introduce
a small tolerance buffer based on refresh rate which accounts for
HW/SW latency without compromising validation on HRR panel.

--v2:
- correct refresh rate criteria.

Signed-off-by: Mitul Golani <a class="moz-txt-link-rfc2396E" href="mailto:mitulkumar.ajitkumar.golani@intel.com">&lt;mitulkumar.ajitkumar.golani@intel.com&gt;</a>
---
 tests/kms_vrr.c | 50 ++++++++++++++++++++++++++++++++++++++++++++++---
 1 file changed, 47 insertions(+), 3 deletions(-)

diff --git a/tests/kms_vrr.c b/tests/kms_vrr.c
index c4bb30f6a..c7be37ff8 100644
--- a/tests/kms_vrr.c
+++ b/tests/kms_vrr.c
@@ -410,6 +410,52 @@ do_flip(data_t *data, igt_fb_t *fb)
 	igt_reset_timeout();
 }
 
+static void
+calculate_tolerance(uint64_t *threshold_hi, uint64_t *threshold_lo, uint64_t rates_ns)
+{
+	uint32_t refresh_rate = NSECS_PER_SEC/rates_ns;
+
+	if (refresh_rate &lt; 0)
+		return;
+
+	/*
+	 * Current IGT implementation follows this sequence:
+	 * 1. Perform a page flip (`do_flip`).
+	 * 2. Wait for the flip completion event.
+	 * 3. Compare the timestamp of the flip completion event with the previous frame’s completion timestamp.
+	 * 4. Adjust CPU cycle burning based on the relative frame time.
+	 *
+	 * If a flip completes too early or too late, it is marked as out of tolerance.
+	 * As a result, additional CPU cycles are burned to match the `target_ns`.
+	 * Even if the next frame is on time, the total frame time now includes:
+	 * Burned CPU cycle time (from the previous frame) + Flip completion event time.
+	 * This leads to miscalculation, causing **false out-of-range detections**.
+	 * The impact is more significant on High Refresh Rate (HRR) panels, where: The allowed tolerance
+	 * window is smaller and more correction time is required. i.e. for 210hz (4.762ms), allowed range is
+	 * 209hz(4.784ms) to 211hz(4.739ms). This comes just 23 microsecond tolerance, which is much lesser
+	 * for accounting HW/SW latency, CPU burn cycle latency and correction logic applied in igt for
+	 * validation.
+	 *
+	 * To address this implement a Bucketing Strategy:
+	 * Provide a small tolerance buffer to allow IGT tests to account for correction. based on range of
+	 * asked refresh rate. This prevents excessive failures due to minor timing adjustments.
+	 * Although an imperical number but already IGT is living with that.
+	 * This also ensures that asked refresh rate is not too off and always catch the real HW/software 
+	 * latencies.
+	 */
+
+	if (refresh_rate &lt;= 120) {</pre>
    </blockquote>
    remove = in this if condition <span style="white-space: pre-wrap">if (refresh_rate &lt; 120)</span>
    <blockquote type="cite" cite="mid:20250328050959.659508-2-mitulkumar.ajitkumar.golani@intel.com">
      <pre wrap="" class="moz-quote-pre">
+		*threshold_hi = NSECS_PER_SEC / (((float)NSECS_PER_SEC / rates_ns) + 1);
+		*threshold_lo = NSECS_PER_SEC / (((float)NSECS_PER_SEC / rates_ns) - 1);
+	} else if (refresh_rate &gt;= 120 &amp;&amp; refresh_rate &lt;= 240) {
+		*threshold_hi = NSECS_PER_SEC / (((float)NSECS_PER_SEC / rates_ns) + 5);
+		*threshold_lo = NSECS_PER_SEC / (((float)NSECS_PER_SEC / rates_ns) - 5);
+	} else {
+		*threshold_hi = NSECS_PER_SEC / (((float)NSECS_PER_SEC / rates_ns) + 10);
+		*threshold_lo = NSECS_PER_SEC / (((float)NSECS_PER_SEC / rates_ns) - 10);
+	}
+}</pre>
    </blockquote>
    Patch has style problems please check by running checkpatch.pl.<br>
    <br>
    imho, Better to add one more bucket for refresh rate between 60 to
    120 to +/-2 deviation range.<br>
    <p>from my analysis below observed,</p>
    <p>from (60 -140) flips are in deviation range of 2, from (140 -220)
      flips are in deviation range of 5 and after 220 flips are in
      deviation range of 10.&nbsp; </p>
    <table border="0" cellpadding="0" cellspacing="0" width="534">
      <colgroup><col width="64" span="3" style="width:48pt"> <col width="82" span="2" style="mso-width-source:userset;mso-width-alt:2862;
 width:62pt"> <col width="89" span="2" style="mso-width-source:userset;mso-width-alt:3118;
 width:67pt"> </colgroup><tbody>
        <tr height="19" style="height:14.5pt">
          <td height="19" class="xl66" width="64" style="height:14.5pt;width:48pt">&nbsp;</td>
          <td class="xl66" width="64" style="border-left:none;width:48pt">&nbsp;</td>
          <td class="xl66" width="64" style="border-left:none;width:48pt">&nbsp;</td>
          <td colspan="4" class="xl67" width="342" style="border-left:none;width:258pt">Number of flips on
            threshold</td>
        </tr>
        <tr height="19" style="height:14.5pt">
          <td height="19" class="xl66" style="height:14.5pt;border-top:none">SNO</td>
          <td class="xl66" style="border-top:none;border-left:none">RR</td>
          <td class="xl66" style="border-top:none;border-left:none">Total
            flips</td>
          <td class="xl66" align="right" style="border-top:none;border-left:none">1</td>
          <td class="xl66" align="right" style="border-top:none;border-left:none">2</td>
          <td class="xl66" align="right" style="border-top:none;border-left:none">5</td>
          <td class="xl66" align="right" style="border-top:none;border-left:none">10</td>
        </tr>
        <tr height="19" style="height:14.5pt">
          <td height="19" class="xl65" align="right" style="height:14.5pt;border-top:none">1</td>
          <td class="xl65" align="right" style="border-top:none;border-left:none">62</td>
          <td class="xl65" align="right" style="border-top:none;border-left:none">311</td>
          <td class="xl65" style="border-top:none;border-left:none">307(98.7%)</td>
          <td class="xl65" style="border-top:none;border-left:none">&nbsp;</td>
          <td class="xl65" style="border-top:none;border-left:none">&nbsp;</td>
          <td class="xl65" style="border-top:none;border-left:none">&nbsp;</td>
        </tr>
        <tr height="19" style="height:14.5pt">
          <td height="19" class="xl65" align="right" style="height:14.5pt;border-top:none">2</td>
          <td class="xl65" align="right" style="border-top:none;border-left:none">94</td>
          <td class="xl65" align="right" style="border-top:none;border-left:none">471</td>
          <td class="xl65" style="border-top:none;border-left:none">291(61.78%)</td>
          <td class="xl65" style="border-top:none;border-left:none">458(97.24%)</td>
          <td class="xl65" style="border-top:none;border-left:none">&nbsp;</td>
          <td class="xl65" style="border-top:none;border-left:none">&nbsp;</td>
        </tr>
        <tr height="19" style="height:14.5pt">
          <td height="19" class="xl65" align="right" style="height:14.5pt;border-top:none">3</td>
          <td class="xl65" align="right" style="border-top:none;border-left:none">126</td>
          <td class="xl65" align="right" style="border-top:none;border-left:none">631</td>
          <td class="xl65" style="border-top:none;border-left:none">447(70.84%)</td>
          <td class="xl65" style="border-top:none;border-left:none">587(93.02%)</td>
          <td class="xl65" style="border-top:none;border-left:none">&nbsp;</td>
          <td class="xl65" style="border-top:none;border-left:none">&nbsp;</td>
        </tr>
        <tr height="19" style="height:14.5pt">
          <td height="19" class="xl65" align="right" style="height:14.5pt;border-top:none">4</td>
          <td class="xl65" align="right" style="border-top:none;border-left:none">158</td>
          <td class="xl65" align="right" style="border-top:none;border-left:none">791</td>
          <td class="xl65" style="border-top:none;border-left:none">257(32.50%)</td>
          <td class="xl65" style="border-top:none;border-left:none">521(65.86%)</td>
          <td class="xl65" style="border-top:none;border-left:none">788(99.62%)</td>
          <td class="xl65" style="border-top:none;border-left:none">&nbsp;</td>
        </tr>
        <tr height="19" style="height:14.5pt">
          <td height="19" class="xl65" align="right" style="height:14.5pt;border-top:none">5</td>
          <td class="xl65" align="right" style="border-top:none;border-left:none">190</td>
          <td class="xl65" align="right" style="border-top:none;border-left:none">951</td>
          <td class="xl65" style="border-top:none;border-left:none">&nbsp;</td>
          <td class="xl65" style="border-top:none;border-left:none">504(52.99%)</td>
          <td class="xl65" style="border-top:none;border-left:none">907(95.37%)</td>
          <td class="xl65" style="border-top:none;border-left:none">&nbsp;</td>
        </tr>
        <tr height="19" style="height:14.5pt">
          <td height="19" class="xl65" align="right" style="height:14.5pt;border-top:none">6</td>
          <td class="xl65" align="right" style="border-top:none;border-left:none">222</td>
          <td class="xl65" align="right" style="border-top:none;border-left:none">1111</td>
          <td class="xl65" style="border-top:none;border-left:none">&nbsp;</td>
          <td class="xl65" style="border-top:none;border-left:none">&nbsp;</td>
          <td class="xl65" style="border-top:none;border-left:none">802(72.18%)</td>
          <td class="xl65" style="border-top:none;border-left:none">1083(97.48%)</td>
        </tr>
        <tr height="19" style="height:14.5pt">
          <td height="19" class="xl65" align="right" style="height:14.5pt;border-top:none">7</td>
          <td class="xl65" align="right" style="border-top:none;border-left:none">254</td>
          <td class="xl65" align="right" style="border-top:none;border-left:none">1271</td>
          <td class="xl65" style="border-top:none;border-left:none">&nbsp;</td>
          <td class="xl65" style="border-top:none;border-left:none">&nbsp;</td>
          <td class="xl65" style="border-top:none;border-left:none">1022(80.40%)</td>
          <td class="xl65" style="border-top:none;border-left:none">1249(98.26%)</td>
        </tr>
        <tr height="19" style="height:14.5pt">
          <td height="19" class="xl65" align="right" style="height:14.5pt;border-top:none">8</td>
          <td class="xl65" align="right" style="border-top:none;border-left:none">286</td>
          <td class="xl65" align="right" style="border-top:none;border-left:none">1431</td>
          <td class="xl65" style="border-top:none;border-left:none">&nbsp;</td>
          <td class="xl65" style="border-top:none;border-left:none">&nbsp;</td>
          <td class="xl65" style="border-top:none;border-left:none">675(47.16%)</td>
          <td class="xl65" style="border-top:none;border-left:none">1160(81.06%)</td>
        </tr>
        <tr height="19" style="height:14.5pt">
          <td height="19" class="xl65" align="right" style="height:14.5pt;border-top:none">9</td>
          <td class="xl65" align="right" style="border-top:none;border-left:none">318</td>
          <td class="xl65" align="right" style="border-top:none;border-left:none">1591</td>
          <td class="xl65" style="border-top:none;border-left:none">&nbsp;</td>
          <td class="xl65" style="border-top:none;border-left:none">&nbsp;</td>
          <td class="xl65" style="border-top:none;border-left:none">892(56.06%)</td>
          <td class="xl65" style="border-top:none;border-left:none">1393(87.56%)</td>
        </tr>
        <tr height="19" style="height:14.5pt">
          <td height="19" class="xl65" align="right" style="height:14.5pt;border-top:none">10</td>
          <td class="xl65" align="right" style="border-top:none;border-left:none">350</td>
          <td class="xl65" align="right" style="border-top:none;border-left:none">1751</td>
          <td class="xl65" style="border-top:none;border-left:none">&nbsp;</td>
          <td class="xl65" style="border-top:none;border-left:none">&nbsp;</td>
          <td class="xl65" style="border-top:none;border-left:none">739(42.18%)</td>
          <td class="xl65" style="border-top:none;border-left:none">1591(90.81%)</td>
        </tr>
      </tbody>
    </table>
    <br>
    <br>
    <br>
    <blockquote type="cite" cite="mid:20250328050959.659508-2-mitulkumar.ajitkumar.golani@intel.com">
      <pre wrap="" class="moz-quote-pre">
+
 /*
  * Flips at the given rate and measures against the expected value.
  * Returns the pass rate as a percentage from 0 - 100.
@@ -439,9 +485,7 @@ flip_and_measure(data_t *data, igt_output_t *output, enum pipe pipe,
 		else
 			exp_rate_ns = vtest_ns.max;
 
-		/* Allow ~1 Hz deviation for different reasons causing delay. */
-		threshold_hi[i] = NSECS_PER_SEC / (((float)NSECS_PER_SEC / exp_rate_ns) + 1);
-		threshold_lo[i] = NSECS_PER_SEC / (((float)NSECS_PER_SEC / exp_rate_ns) - 1);
+		calculate_tolerance(&amp;threshold_hi[i], &amp;threshold_lo[i], exp_rate_ns);
 
 		igt_info(&quot;Requested rate[%d]: %&quot;PRIu64&quot; ns, Expected rate between: %&quot;PRIu64&quot; ns to %&quot;PRIu64&quot; ns\n&quot;,
 				i, rates_ns[i], threshold_hi[i], threshold_lo[i]);
</pre>
    </blockquote>
  </body>
</html>

--------------E0iqPpeosJ9w9YDz0nT1DqK0--
