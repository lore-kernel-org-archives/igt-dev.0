Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FD66606A319
	for <igt-dev@archiver.kernel.org>; Wed, 21 Oct 2026 16:39:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Hc++491p
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 45B1810FF2C;
	Wed, 21 Oct 2026 16:39:38 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5615110E30F
 for <igt-dev@lists.freedesktop.org>; Wed, 21 Oct 2026 16:38:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792600725; x=1824136725;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=eXh2YZYh9XlwYNa2Yx3yTNaTuPqJreEI8hVhYpzidgM=;
 b=Hc++491pVOpCmHVIvZm+jPJDcPCL7szFYlD00PH4Tax+kKj9wDzs3866
 t4Q/IZ1ldZ/C1qj4fjGwF925I3t/AG6xYRoRhAY7wS63DqZQjIIpHTF2F
 Eul+/FORdBhgBHHw3LgtAEpu8DOUxmHOj2FQ37q4DRL7uAKiKoNHQID1i
 f8awFyBPRrtvZV84cOaq9nBT3PkxkjVHEFH73HyFLi79pcuSdVmU0aaYv
 37NDBg8G615wuX7UFtarq5d7vcC6PnIMvqVq8vIu00/UB3mGrOjzoC+nP
 taxiOYbH+hVJvXcbTubYwjsuFwPEkVVXLYj8FsyP73TD9sFIF6TQn+GUL w==;
X-CSE-ConnectionGUID: lK7TFbvhT5eOCVhJNScX8w==
X-CSE-MsgGUID: ZK1FVnm7Rnm0R//FjJEgMQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11942"; a="1234688"
X-IronPort-AV: E=Sophos;i="6.27,170,1787036400"; 
   d="scan'208";a="1234688"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Oct 2026 09:38:37 -0700
X-CSE-ConnectionGUID: lh54zmD8TfeuM605/SH2uA==
X-CSE-MsgGUID: zw/Q6o7LQvObcEwJ1eoIWA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,170,1787036400"; 
   d="scan'208";a="3145106"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Oct 2026 09:38:37 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Wed, 21 Oct 2026 09:38:36 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Wed, 21 Oct 2026 09:38:36 -0700
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.68) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Wed, 21 Oct 2026 09:38:35 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UgGEqNmLTx/FVsUl146cyJpZO7aCB3eCvno1orSiUUBydMByjfrg1s0huDC2DuSVpfTE+w1HAPiE9Usgyw5rpgQnG9/Pyf0w4BkO+p/M3Tcpw+PHvFRfVGT76zsNp7pIeSedZ18/5x83X8grQYbUisl3j++Tb2aLv5SqerwID+3V1Z9uRCBORIdNvOHjdgE7Oa0p52jlM40RdsHAlxlYuxirsPAuuA815+0FdfhklDFdykJWZTdmi+YYpvEcHJlxxymNtCsEaIdzikLzXSoK6V2mfXwZuVvd2yktu2p2KlB4/jE/Y+W9e/Hqah1M3f66AJfahXpn0GcWM0PBXjYSFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=24fV5SKq1LTRS1KnbLImUCs71jqa/X4AYCl2gpKxi/4=;
 b=Xg/ll3zl2/Gz3ZdClJ7Rr5zQtFwOafbyVdLp4SvqtCycGIuGG/vv6lnvJ0rExNJaKR1Q3wPy3sl0jdPSZNXCnCXfSRT+CBqUabaDWYkxfO9FQVR6XD+JLR2APcv1vkX7kis8g6jrg6XVhe4Nr48uJoE/xzeIUbbx8gbrEIQVwuiYaQbQ0Nf0/yyKPjzajYrZrxwdGcaohDKx0pS4S7VzcfR4V9UuW+wG9vafbx9GbtfZHnURnbobCyqIJVQ/SFPeUxsk1pxnSDwwKDVwVSMWlXLXDXypQOWLk/CwCWXpmApRKnrimig/J3zacRYiEvVFHuu3/FucxMZVgvmDXlRo4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB8252.namprd11.prod.outlook.com (2603:10b6:510:1aa::14)
 by MN2PR11MB4696.namprd11.prod.outlook.com (2603:10b6:208:26d::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.15; Wed, 21 Oct
 2026 16:38:33 +0000
Received: from PH7PR11MB8252.namprd11.prod.outlook.com
 ([fe80::9f66:9d6f:3199:78b2]) by PH7PR11MB8252.namprd11.prod.outlook.com
 ([fe80::9f66:9d6f:3199:78b2%4]) with mapi id 15.21.0522.017; Wed, 21 Oct 2026
 16:38:33 +0000
Message-ID: <64b3ba65-ccf4-47cb-aa92-f34f1c928e04@intel.com>
Date: Wed, 21 Oct 2026 22:08:26 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4] tests/intel/xe_wedged: Add cold-reset wedge test
To: "Tauro, Riana" <riana.tauro@intel.com>, <igt-dev@lists.freedesktop.org>
CC: <anshuman.gupta@intel.com>, <badal.nilawar@intel.com>,
 <karthik.poosa@intel.com>, <raag.jadav@intel.com>, <soham.purkait@intel.com>, 
 <mallesh.koujalagi@intel.com>
References: <20261016054808.306372-2-sk.anirban@intel.com>
 <c362564d-d846-43af-9cef-4a91062ea3d1@intel.com>
Content-Language: en-US
From: "Anirban, Sk" <sk.anirban@intel.com>
In-Reply-To: <c362564d-d846-43af-9cef-4a91062ea3d1@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5P287CA0296.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:21e::7) To PH7PR11MB8252.namprd11.prod.outlook.com
 (2603:10b6:510:1aa::14)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB8252:EE_|MN2PR11MB4696:EE_
X-MS-Office365-Filtering-Correlation-Id: 3e793a7e-5997-4c8b-5931-08df2f91bf21
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|1800799024|376014|366016|6133799003|18002099003|22082099003|10067099003|4143699003|261009223027099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info: dnNoyBGUcsngQ33Nf9mhO43LN5gjb5DtCibYy23s50iTzWsCQcgDm4C0ex7mCtCqVZoWZ/CmAi0UI4RAbiqScYWKKeDo+vB6fAfLV84oZIa+I7fTTamc5liSqVjwWhhmBboMNYF36ffE49+/+yIZxHtNP7J8UvHB6lUZMwlBd6k8ZsSFGtBgw6RgKbxZ2Z2iJPMNAD4dB8w8L4ByQUe5r2v5/p4g+xdsu6+jFLrDuruZUUXEA2TG0quD6FpKoXao328GVSosDyzfkapG0gT/Ke79U8b446hqGY1et4/i0lwHa23DTRMcUYxaNeAfikxc8kNKw/H0jc8Up4MJL56RgJwvtRRIGmY0oDTXomSCtEZn1FEQ8zVG4tq4Y/TSDqJ4aWZKTQ93/zGyTo8lCdQZrmoB/LPTZoP93QIuT1XoaQXVSnkFyloxfjJeBiq2xAI0Zh83ls8LtGQ/QXHNUkWkUDsFJQe1kU/ORKHOshISalmu+Ggmg7nz/UPTulxpcL+8a4+qTOoEw0Ac+bQISAxGvDfFSj+Q0Qm2RiV8Q6Hks4Qwla0s9dIDepH7/9/l8YXL2GUnSNfeJb4fhdnAPR/efcWfMJpjUY6jZ8wacQK6r7Cgp3Azhz5E4zpkWUoI4oj3X1a1cthnV9Yw1QPeHvnfogd+ycIRSss+/l3wokmizm8=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB8252.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(1800799024)(376014)(366016)(6133799003)(18002099003)(22082099003)(10067099003)(4143699003)(261009223027099003)(11063799006)(56012099006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UEdDaE0xKzRpWmZMUi9DTlJqcS9uQkJPNUVHb3gyOUs4RThObFVaRmc3ejl4?=
 =?utf-8?B?OXRPMmxzSHk5ZXFBZ042OXpKbkFDZ3dXRmZLb3UyRWY3dUx2N2Y4OS9jY2dq?=
 =?utf-8?B?TVFhQ0FNcVlhM3NENk1IOUpDa2U0ZDEydmxqSE9CSkVDVzJlQTliWU5xWEJD?=
 =?utf-8?B?V2lBRk1DWXQzWjdFRWVzZ1h2cHo1Ukxhd1pRc2pTZ1RVQWdpRGFTUzhsaGd2?=
 =?utf-8?B?MXFsS3lQZk45OEpVaTRwTnRXVUdJVTNCN3M3ZzlLTFAvK3ZLVFc3bXlsZkFZ?=
 =?utf-8?B?bTVFQVVMMGl2ckI0Z3d5VFQ5WWtBNFpnSm50ZXY3WjdBZWNGaTFHeDRXUzBs?=
 =?utf-8?B?aW40WkZNbExaZ24xNXhueE5tV1oyNU12eW5USUJsVDZNRXhmR1JlVGlaVmh2?=
 =?utf-8?B?VHFzS251NlpaQnZId3hDUVBLd01uTmZZbk44NENaQUZKMXVpUjZFSmtRM25t?=
 =?utf-8?B?NXhCZHJ4dUoxZHpGZ2hBL1RVZUdCL09ZU2pNWXdCMUdtQXhnV2lUVDBpci9s?=
 =?utf-8?B?WTc1elhXbDRxcUdKTHN4a1VibWF6UkxzclZJTlpYbnRWd3laOWFOSStXMjkw?=
 =?utf-8?B?c0I4NFh3Yy9IZFFXMHQrUUI0b2ZtL25RckN1di82ZXBEWTRtc25TRWI3TVR5?=
 =?utf-8?B?bG81czBMUkhaZW5JTXBBT2N3djFBTGU5dFRXQy9IcVp6TGdBaTQ3ZmJHL3Vt?=
 =?utf-8?B?Tlp0ZiszZXBLaVdWb3VmSSs1MGFTSGhma1prSVE0eUVWWjBPSU5yRXU0Zkc2?=
 =?utf-8?B?Tk9rcmJpZjlHTFJYT1E0V1Yxd0FBd2JwbVZYR2xiM1F2MWJ6MmNYWXZXYkww?=
 =?utf-8?B?MnpIUUF6VnBaZ1JJVWRsWE9XS2lSQWk0ZktMSHJuNG5QODJtNlFCdnNwTXNu?=
 =?utf-8?B?VGNEQTg4cEFNYmhsbjlCMDhORUFUQk8yMGdkcE5uMVRMYy84ZHJjQS9kcDdV?=
 =?utf-8?B?cC9LNjZ2bmNnK2VUcW1vTTQvMkdXMjFzTW5FYkRaNE1SaGJ4TDkyN21TN0hU?=
 =?utf-8?B?RE85VmFlbzJxYU8rMDc3ZnFoMUJMWklJQTZMV1NSRThiaER5dUp1Zi84RHRS?=
 =?utf-8?B?dVNtNzlTMmZtMlNoaS9MSzNQRDlLeHpKSXBnUWFRbmpiTFZBSWdaWTV5RG1X?=
 =?utf-8?B?c1QyaU9ub2U4LzNqb2loSjQ0ZHAyZVQ2dm5ITWgvOUFKRHdGbDhVajJzTHk3?=
 =?utf-8?B?SFd5Q0VyaXc1R0tidWhJNjRLUUFyRFJnR3F0RnpXQ3pLbGMzYTBQYlU4TUY1?=
 =?utf-8?B?WENKVjlyY2dFWGhpM2M2THNPc1VOYWhyRFhjYnh1YXRpRllzeUpyMUtBSEdq?=
 =?utf-8?B?WWc2QTY4REFlQk1zQ3dEb0RFeFdOY2xRbWxFM1c2cG9ybmZramVLYzN2Mm5j?=
 =?utf-8?B?aFI1VVJWdFJqOVRGaHY0MkRlSy9EZlRaWDJacWFEY3VoVXo0R05lQk93Vjcz?=
 =?utf-8?B?TVJOWXRXR2ZhRkI1S29BRVlNNUR2dHF2Rk02L2xzYy9rRWR4VjM5R0w5ZzVQ?=
 =?utf-8?B?SUlZcW9rMkUza2lFV1JyaGpiMUsxUUdTejBWWGN3enFuOWJuRGxOYk0vS3VC?=
 =?utf-8?B?T3FkK2dMczlZMU5jMjNjUUdncWgrWDFSaXZ2V0lzakxjRTZmaTRNek5SNlZt?=
 =?utf-8?B?TUFiYlhwSWgvcTg4YWg2N1FlbW53SmE5Vy8yQXhHc0JSRUZnSk8vTnhkU2Nl?=
 =?utf-8?B?R3VKaDQvbGhTY0Z3dU9jQ0NsQ214c3VHR1NXRFBqT2ViZTBBcHgveXY0MG12?=
 =?utf-8?B?cnM0OFVTS0ZvMWZnOEhKbVhLOGZOaVJHYmNyTTJQYnAyT2ZzamQ0NG55MmJp?=
 =?utf-8?B?THBaaENqSHZmTHFTL1llTHJrT25tUkpMSG9SRTh6RnNYay84VEZwSzkyVXlh?=
 =?utf-8?B?YXJ4UEdEM1YwbHZOZUMySHVqd0VWV3I2WTl3KzBSc1IxU1loeFFqd0pPMWcv?=
 =?utf-8?B?b0FlbHdVR2F3ZnJPTmN5a2l3azVLd1VnN1RqaFVoQ3hIY3VFVWszUk82dTA3?=
 =?utf-8?B?SStNQ1dJbEh4a1Z4TGhUUTF0eUI2b1F4NS8vM2JUbWR3TDhLVFZwYjhxbC9W?=
 =?utf-8?B?Q0hsU3lsdTg0WUlGMGJuYlVPckNqU3Y0QVgwcGZ2RlM5dkNwUTMzNE83ZmpT?=
 =?utf-8?B?TTNLamtzTG5QVDJ3ci9QMnhQMWJFMzcya2ZiRXhCNlZBRkxTd3FVbW42dHBG?=
 =?utf-8?B?SXFCUXk0QjVvOXVUaGR0UzUrYzNLQ25teDVSQTZST054OGhvRTFFV0NQVUNa?=
 =?utf-8?B?d0xJSXVqb2kybjNVUmxQem13aEVOMXRHeXlHVTByNUdrbWpEZDRnbi9JbnA5?=
 =?utf-8?B?SFJsMXN2RmhZZkx4WVhUMUkraEZJK2ZlMlIwMndjL2dTcGhkcldqUT09?=
X-Exchange-RoutingPolicyChecked: 4TVNr2IDDL6NwimIHVNKckTrfA6haWi8ttPyRxZ/EIasA9CG1XbeqE/z24EdCR+52GYOM9FeNvR6lGkcP1/ekOJwbMFCflNaSzVhUrpy8TV6L3XB74jYTbHoAJvpMPgl8HA/FdNN2c9GVzO8gvpxEoBjWcRACuuiGbK97aJj8YfjDJFHrUYdltYP/KC/gZihtXvmT/IWF3Or3TEcbwpS8GsijogfJsUmvqDP1SO+VBGV2jEBELhNLz90+pWdGzry2j+b0CAK8ivx4uYGU7Hkq5F38Yao3d1XUTEqWRw4MI3bIF3+WCxm2Q/gxL3Sg/jrVNw5lWdqyF/IH7U+36DsVQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 3e793a7e-5997-4c8b-5931-08df2f91bf21
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB8252.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Oct 2026 16:38:33.5228 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fK8LTJvzhvdSWv2a6mmHKi8aq/Ndkder9/hy0lk+WfaW3pH5n5GbxpwuHI1SwGxoGOcoqjmPUMmvvKFw5XnSfg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4696
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
X-Spam-Status: No, score=-17.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Riana,

On 16-10-2026 11:40, Tauro, Riana wrote:
>
> On 16-10-2026 11:18, Sk Anirban wrote:
>> Inject cold-reset at probe, validate the WEDGED=cold-reset
>> notification, and verify the device is functional after driver
>> recovery/rebinding.
>
> When does cold-reset get triggered? i see a unbind rebind in this test.
It will get triggered during first re-bind after we write to those 
debugfs entries.
>
>>
>> v2: Fix restore flow (Mallesh)
>>      Cosmetic changes (Mallesh)
>> v3: Fix verbose and dmesg regex
>>
>> Tested-by: Sk Anirban <sk.anirban@intel.com>
>> Signed-off-by: Sk Anirban <sk.anirban@intel.com>
>> Reviewed-by: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
>> ---
>>   tests/intel/xe_wedged.c | 116 +++++++++++++++++++++++++++++++++++++++-
>>   1 file changed, 114 insertions(+), 2 deletions(-)
>>
>> diff --git a/tests/intel/xe_wedged.c b/tests/intel/xe_wedged.c
>> index fe8ea6969..afc248b96 100644
>> --- a/tests/intel/xe_wedged.c
>> +++ b/tests/intel/xe_wedged.c
>> @@ -14,6 +14,8 @@
>>     #include <limits.h>
>>   #include <dirent.h>
>> +#include <libudev.h>
>> +#include <poll.h>
>>     #include "igt.h"
>>   #include "igt_device.h"
>> @@ -28,6 +30,25 @@
>>   #include "xe/xe_query.h"
>>   #include "xe/xe_spin.h"
>>   +static char pci_slot[NAME_MAX];
>> +
>> +static void cold_reset_restore(int sig)
>> +{
>> +    char path[PATH_MAX];
>> +    int dir;
>> +
>> +    snprintf(path, sizeof(path), "/sys/kernel/debug/dri/%s", pci_slot);
>> +    dir = open(path, O_RDONLY);
>> +    if (dir >= 0) {
>> +        igt_sysfs_write(dir, "wedge_cold_reset/probability", "0", 1);
>> +        igt_sysfs_write(dir, "wedge_cold_reset/times", "1", 1);
>> +        igt_debugfs_write(dir, "wedge_cold_reset/verbose", "2");
>> +        close(dir);
>> +    }
>> +
>> +    igt_kmod_rebind("xe", pci_slot);
>> +}
>> +
>>   static void ignore_wedged_in_dmesg(void)
>>   {
>>       /*
>> @@ -55,7 +76,14 @@ static void ignore_wedged_in_dmesg(void)
>>                       "|EngineInstance: [0-9]+"
>>                       "|Tile[0-9]+: GT[0-9A-Fa-f]*: Fault response: 
>> Unsuccessful -EINVAL"
>>                       "|Tile[0-9]+: GT[0-9A-Fa-f]*: Engine memory CAT 
>> error"
>> -                    "|SIGID=203");
>> +                    "|SIGID=203"
>> +                    "|class=[a-z]+, logical_mask: 0x[0-9A-Fa-f]+, 
>> guc_id=[0-9]+"
>> +                    "|cold-reset wedge injected"
>> +                    "|GT[0-9A-Fa-f]*: Invalid gsc header in proxy 
>> reply"
>> +                    "|device wedged, needs recovery"
>> +                    "|IOCTLs and executions are now blocked"
>> +                    "|SIGID=[0-9]+ .*GT: reset failed"
>> +                    "|SIGID=102");
>>   }
>>     static void force_wedged(int fd)
>> @@ -67,6 +95,60 @@ static void force_wedged(int fd)
>>       sleep(1);
>>   }
>>   +static void wait_for_wedged_uevent(struct udev_monitor *mon)
>> +{
>> +    struct udev_device *dev;
>> +    const char *prop_val;
>> +    const char *dev_path;
>> +    struct pollfd poll_fd = {
>> +        .fd = udev_monitor_get_fd(mon),
>> +        .events = POLLIN
>> +    };
>> +    bool event_received = false;
>> +    int timeout_secs = 30;
>> +
>> +    igt_until_timeout(timeout_secs) {
>> +        if (poll(&poll_fd, 1, 1000) <= 0)
>> +            continue;
>> +
>> +        dev = udev_monitor_receive_device(mon);
>> +        if (!dev)
>> +            continue;
>> +
>> +        prop_val = udev_device_get_property_value(dev, "WEDGED");
>> +        dev_path = udev_device_get_property_value(dev, "DEVPATH");
>> +
>> +        if (prop_val && !strcmp(prop_val, "cold-reset")) {
>> +            event_received = true;
>> +            igt_assert_f(dev_path && strstr(dev_path, pci_slot),
>> +                     "Expected bus address '%s' to be part of 
>> DEVPATH '%s'",
>> +                     pci_slot, dev_path);
>> +            udev_device_unref(dev);
>> +            break;
>> +        }
>> +
>> +        udev_device_unref(dev);
>> +    }
>> +
>> +    igt_cleanup_uevents(mon);
>> +
>> +    igt_assert_f(event_received,
>> +             "Timeout waiting for cold-reset-wedged event after %d 
>> seconds",
>> +             timeout_secs);
>> +}
>> +
>> +static void test_spinner_after_recovery(int fd)
>> +{
>> +    uint64_t ahnd;
>> +    igt_spin_t *spin;
>> +
>> +    ahnd = intel_allocator_open(fd, 0, INTEL_ALLOCATOR_RELOC);
>> +    spin = igt_spin_new(fd, .ahnd = ahnd);
>> +
>> +    igt_spin_free(fd, spin);
>> +    put_ahnd(ahnd);
>> +}
>> +
>>   static int simple_ioctl(int fd)
>>   {
>>       int ret;
>> @@ -229,11 +311,14 @@ simple_hang(int fd, struct drm_xe_sync *sync)
>>    * SUBTEST: basic-wedged-read
>>    * Description: Read wedged_mode debugfs
>>    */
>> +/**
>> + * SUBTEST: cold-reset-wedged
>> + * Description: Inject a cold reset wedge and validate cold-reset 
>> uevent
>> + */
>>   int igt_main()
>>   {
>>       struct drm_xe_engine_class_instance *hwe;
>>       int fd;
>> -    char pci_slot[NAME_MAX];
>>         igt_fixture() {
>>           fd = drm_open_driver(DRIVER_XE);
>> @@ -330,12 +415,39 @@ int igt_main()
>>           igt_assert_f(str[0] != '\0', "Failed to read wedged_mode 
>> from debugfs!\n");
>>       }
>>   +    igt_subtest_f("cold-reset-wedged") {
>> +        struct udev_monitor *mon;
>> +
>> +        igt_require(igt_debugfs_exists(fd, 
>> "wedge_cold_reset/probability",
>> +                           O_RDWR));
>> +        igt_install_exit_handler(cold_reset_restore);
>> +
>> +        igt_debugfs_write(fd, "wedge_cold_reset/verbose", "1");
>> +        igt_debugfs_write(fd, "wedge_cold_reset/probability", "100");
>> +        igt_debugfs_write(fd, "wedge_cold_reset/times", "1");
>> +
>> +        ignore_wedged_in_dmesg();
>> +        mon = igt_watch_uevents();
>> +
>> +        drm_close_driver(fd);
>> +        igt_kmod_rebind("xe", pci_slot);
>> +        wait_for_wedged_uevent(mon);
>
> This is not right. once you unbind/rebind device specific values will 
> be reset
> Am i missing something?
>
> Thanks
> Riana

No, wedge_cold_reset is a module-global. Its probability field lives for 
the lifetime of the loaded xe module, not the device binding. so even if 
we do rebind only "times" gets modfied, where as the probability retains 
it's value. As discussed offline I will add a comment in the test for this.

Thanks,
Anirban

>
>> +        igt_kmod_rebind("xe", pci_slot);
>> +        fd = drm_open_driver(DRIVER_XE);
>> +        test_spinner_after_recovery(fd);
>> +    }
>> +
>>       igt_fixture() {
>>           if (igt_debugfs_exists(fd, "fail_gt_reset/probability", 
>> O_RDWR)) {
>>               igt_debugfs_write(fd, "fail_gt_reset/probability", "0");
>>               igt_debugfs_write(fd, "fail_gt_reset/times", "1");
>>           }
>>   +        if (igt_debugfs_exists(fd, "wedge_cold_reset/probability", 
>> O_RDWR)) {
>> +            igt_debugfs_write(fd, "wedge_cold_reset/probability", "0");
>> +            igt_debugfs_write(fd, "wedge_cold_reset/times", "1");
>> +        }
>> +
>>           /* Tests might have failed, force a rebind before exiting */
>>           drm_close_driver(fd);
>>           igt_kmod_rebind("xe", pci_slot);
