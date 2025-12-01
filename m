Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA20CD116F1
	for <igt-dev@archiver.kernel.org>; Mon,  1 Dec 2025 14:54:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E9E310E2B7;
	Mon,  1 Dec 2025 14:54:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GAd6vcs4";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 951DC10E110
 for <igt-dev@lists.freedesktop.org>; Mon,  1 Dec 2025 14:54:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764600849; x=1796136849;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=3TbbcojLpFY/jXL9ikgMN6RJASm5iiMhoOdYremhQFs=;
 b=GAd6vcs4MyU7Fz0JJNBRqjrp8goi42lWbrg4oNIyetN0kbB+eF+jcGOF
 g6W3BKwS9UxFY+uTJlWso26+SC5y9SVpYuU2sigC27CmifjUyTP8Km9GL
 pDM9DsCD72i13D/Jiqpb7OhMQPYrUpyq4KVGB5l70T6DO9cfNOjTKFgbB
 HIAwhnq83iPOs452ouRb+vCxTg78F990q4h1lpuBYpLnLOgyHNK8T55kY
 WzB5DUDUMwn15Hk1sVUN+Kdd9YADsqWS4YYYDDk/QPMThNht11NUnlGuJ
 41oNxve+7cS3rIm/k+4bfWjvmJZHtK/Rl2Yb81WLfmxfWniQfoPiMROBj w==;
X-CSE-ConnectionGUID: NFSSkOlhRViJKkABLYqrVQ==
X-CSE-MsgGUID: UC8sqWZNT0iWBGtC205Dag==
X-IronPort-AV: E=McAfee;i="6800,10657,11629"; a="66577534"
X-IronPort-AV: E=Sophos;i="6.20,240,1758610800"; d="scan'208";a="66577534"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Dec 2025 06:54:09 -0800
X-CSE-ConnectionGUID: ZR/+J8vgSiWS7YX4HShTFg==
X-CSE-MsgGUID: nxcAj6UOTdC/kWssO6VlxA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,240,1758610800"; d="scan'208";a="199215864"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Dec 2025 06:54:09 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 1 Dec 2025 06:54:08 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Mon, 1 Dec 2025 06:54:08 -0800
Received: from PH7PR06CU001.outbound.protection.outlook.com (52.101.201.44) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 1 Dec 2025 06:54:08 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=brJC6BBQG92HcS2xbxs4zE+Q9a4vTNj0IzGzR2PILfpmAw54IPrf147+4QKIpVZJNwRWfeqE6qz2brc43xDpIfKUWrTF+CwX06z6O8yPaJoY8wOzGKl3PBOv+stVqAl0e4k0sULv0WGc1bJZfSsnzIQRNp3CXcvNsgQv3FLFyNQ06FYO0mSFRjvJ0N8IrEYOW2cUkfzcLIgJLIZErQXsuTFg9H12aJ59y2xHgNTxiFEslZUuwAoS/5nL/6TvfMYY9edIDPmn5BxzQAAcxAbe46N/KhGK1bpHMzGkUjsk/KKM0XFVfm6IjxR4z3IsJi9n5EqgoB+8i8bJS6zLyvfjOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=C9FgXrVxEEkWn8zyQfGPar9pXQkBeMNgBQTRjopwQdE=;
 b=edKXJD99ffSoYugHvV6hrcLNx/qxEYsb/2PKVE99CddZeefufr1ghedzVfYLBSA6POWIuEwJyc5aDpAJWFPEfX8iXp/yaiP9ekoZGEry5ta/xNmB2wkssT4r7yuWQHPPC2uuzzkf64vtSiSddpCl2pkLSh4j6si5o9uLn2vFrrtdmfEkXR/l7wA05rGJQ4uUvGDA63luG2seF+fhkMSrrrc9+oXyp0+Sg5gzh+NSnrSj7xcH5vOvnK2mZlCLE/b2I4v8e/riBvy4DSiyKfdeDNlCp2N0Q9b34jFa6sUN1GxXor56qT/GCdOJlDoywdhfk8W5cgtYJmmTpKCvHsbImw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ5PPF7DCFBC32A.namprd11.prod.outlook.com
 (2603:10b6:a0f:fc02::839) by MW3PR11MB4699.namprd11.prod.outlook.com
 (2603:10b6:303:54::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.17; Mon, 1 Dec
 2025 14:54:06 +0000
Received: from SJ5PPF7DCFBC32A.namprd11.prod.outlook.com
 ([fe80::e17c:d0f4:db8b:d7e6]) by SJ5PPF7DCFBC32A.namprd11.prod.outlook.com
 ([fe80::e17c:d0f4:db8b:d7e6%3]) with mapi id 15.20.9366.012; Mon, 1 Dec 2025
 14:54:06 +0000
Message-ID: <36c1443e-e842-4ad9-98bf-5791a9c6b25d@intel.com>
Date: Mon, 1 Dec 2025 15:54:01 +0100
User-Agent: Mozilla Thunderbird
Subject: =?UTF-8?Q?Re=3A_=C3=A2_i915=2ECI=2EFull=3A_failure_for_tests/intel/?=
 =?UTF-8?Q?xe=5Feudebug=5Fonline=3A_add_pagefault-one-of-many_test?=
To: <igt-dev@lists.freedesktop.org>, Patchwork
 <patchwork@emeril.freedesktop.org>
References: <20251128-pagefault-one-of-many-v1-0-a8377a93da8f@intel.com>
 <176434709807.39153.5249723901296767420@a3b018990fe9>
Content-Language: en-GB
From: "Hajda, Andrzej" <andrzej.hajda@intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <176434709807.39153.5249723901296767420@a3b018990fe9>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: VIXP296CA0003.AUTP296.PROD.OUTLOOK.COM
 (2603:10a6:800:2a9::8) To SJ5PPF7DCFBC32A.namprd11.prod.outlook.com
 (2603:10b6:a0f:fc02::839)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PPF7DCFBC32A:EE_|MW3PR11MB4699:EE_
X-MS-Office365-Filtering-Correlation-Id: bb60cb0f-e2d4-4628-785b-08de30e979bf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0; ARA:13230040|376014|1800799024|366016|13003099007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?V1VGM0dMUXdDNGtQRUZqTDI5Z1p5RzVpenhHU2l0ZTU4UUVSSDNwbFZ5cXBR?=
 =?utf-8?B?MWtGdlVrUlEvL01iV2tzNHVaeHVwc1VacGUyRFZMaGRJR0JHVmp0QitYejlx?=
 =?utf-8?B?RUdReklOUGRvanZtNWt3SEZJanBwRTJhS1RIcXUwOWVvSGh6cVd1RUFGdGxh?=
 =?utf-8?B?b2xTdmplTVFKOWh0SGxrVlorZCtFeXBqMjk3UC9YZXExK0F4ZEdCQXZkOWlQ?=
 =?utf-8?B?L2xhNmVJcEZGZmZ3K1VkYTM0bEdOMEpuVG1YeERpaUR0RmRzVTJHOHlYN3Ju?=
 =?utf-8?B?LzFIcFZZMTB3Z0s4YUJETXhJY244NzN1ZHlKN095WG5ZaXlaWkxOdHExeVJW?=
 =?utf-8?B?Rk1GbTd6b2c5cEtzY0lJUzY1QTdQUzNlZWtlM0RFNkwyTGZOeGVYaXFBVnZo?=
 =?utf-8?B?N3puUWRkLzdNNTZOWXdra2svV1plelhnOTExQ2lmNFVwclVCYXB2TW52aStQ?=
 =?utf-8?B?UkJMa1FFcDl6amdkVExXN2duNm4zS3llZUdjUVp2UmpzQkcva1Y4N01raktZ?=
 =?utf-8?B?aFNzaHd2NktWeGs4My9mZEhMbXVKS2toUTltZ2xlUkdORmMwZThtOEZXNG5i?=
 =?utf-8?B?UG82NlhHYjRyajByYlZ6VktxUVlFTE5HWGg0Y2JpblUxbE9XV3Y5UlpMWDdI?=
 =?utf-8?B?ZnFuNXBHdHMwTkhrbzg0Njg1UHZrcVgzbmdTb0lJckp0QUZJS3ZabmkyZDMy?=
 =?utf-8?B?dUpRVVQ3UXU3Ty8vbm5OeWtvS2RtVUIyZGVPZVRRaHo3dFVMaVVTUDdlTnV0?=
 =?utf-8?B?WEdmVndlSithcmdXRlJTQUJZY1hVMDdjU0hlRHRKRFdKcW9nTlo0TXBiYzBv?=
 =?utf-8?B?ZWpraENYWksvMk8xN0M3MDNUSHRhZGpRMDJiSHM0RTF1NlQ5Ti9ZNFB0bzFT?=
 =?utf-8?B?MGExemNEODA4dUp2WEVveFVkckJUK2VycmJaZFljbDlRRVdKd2VIcVZxTTR2?=
 =?utf-8?B?M3RHbkVOTXg0SEdoa0lUL2lQWGpCdEVzNUZFL00rWWp4aWlya0N0YWZOcUFT?=
 =?utf-8?B?cFZQbmdJcWNzVU51Mm1RVVB1RkhldkRUYlh1OXFlTkdySjVsRUUwOWhzbklJ?=
 =?utf-8?B?YlR4Yk1uWUZXS0kzVzNwNThLMms0eE1OaE5aVlk0NEdOK2RpL1M0M05GRFFY?=
 =?utf-8?B?RDNHaTE5aVZvRy9SYUgvZllJeThNa2JlVDJNNzc5LzJQR29ROXhsQzQyTUky?=
 =?utf-8?B?MHNKRk5ucFc3TEhpR2FsQlNZbEp3a01PaUkybGZlTnB2YklCMmI4UWJtOEFP?=
 =?utf-8?B?YXA4VGgzbFg5VWJDZXlxc2FlZXlaSEZJV21kTjNZcnFTSTBCQ0RpY2MwczJQ?=
 =?utf-8?B?NmJQTDUvL1ZjUG52V1BHYXIxcENxRUhwZ3ptVjZ0VDNGM0JQSjdBTTRNQnFi?=
 =?utf-8?B?TWpydHBTYm8wdXJEakpoRGIwaUc5eFFleFgxNEVqRGhCbC8ram03c3ZWV0dY?=
 =?utf-8?B?MHdvRlhPTVBtTzBLLzNMeWIwbTdadzBSb2doRDlia3Z5V1dLaTFTblo3SlV2?=
 =?utf-8?B?NEN2QlJ2bDhVQmdEYVhDUE1UazN3cHNVczgrOXo2ZFVFYWlxNG91clBtVUtw?=
 =?utf-8?B?ZXdvY21QUEQzOXQyb0hWdDUzVjJJekxOQ2xXMzl1dkRHT2hsSVpyYzBPWDM1?=
 =?utf-8?B?Z21TdjlxZW5UTXkwYi9xZm9JUCs0dEM2eFJ1blVCbldnN1NwMnpZbkJOaTFO?=
 =?utf-8?B?MlBFcSs4dVVWU3AwbXVCbUxQNDdBdGZPVUU3ZDZFeXNpcU1tckppcEVaQmdJ?=
 =?utf-8?B?K0xNZWJ1aTJuUVh5eTVtSStnMkpsVWJUczViVE5Zd2ZVN1h6UTRvdHJiMTkw?=
 =?utf-8?B?MHZkTDMrcEpZdEFyYk5OYVhCTXdUUXc4N0NmeWMvSkxoLzJvYkNCeTBudnhi?=
 =?utf-8?B?VWZYNEppdEpXeVlNNUlKa0Vqek9RbHpndXJra3ZDbENBK1E9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ5PPF7DCFBC32A.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(13003099007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?d3J2akVFQ0ZMOFBmNVFIWXNCY1ZuaHhlOWhQemZoR3BZVkFFVmFlcTdFUmRE?=
 =?utf-8?B?cGt2UmJQaC9kZFVvSE1jaHJpemI5OWZtUnMvQnB5M0FoNGpYN0l2UkhNb3h5?=
 =?utf-8?B?VWZPNkVXcjIrUmhXOXdkeDBHNE9SSWxCajJTY2tzR2ZiQXVUUVl5TUo2N05w?=
 =?utf-8?B?QUdqdzJSNXRwbXpWQnRFajdNTUEzaVJJZVVad2F1VDJKUUZ6RXZwcWVNa0s3?=
 =?utf-8?B?eFloUDVybzZnRGVhdVpxWXkvaTRMTE1PZHhrYUMwZ3hlZkEvZ3haT2wwR0hN?=
 =?utf-8?B?ZmJoQXV3UGliem52ZjBBWUVtVzRoV09nSXVyclFnQWx1Ry9taVBiSnVJc3lq?=
 =?utf-8?B?R3JOVG1oeDY5MFlBTlhNZ29oUmxwZlpUbGRsT2FmbUJJWW5pZk5iaW1NZ2Rr?=
 =?utf-8?B?S0J6VE5lMlFhRDBPT0xpcW1MbFNEMHVCK095NjRZTitYRllWN0RQUkx1L2xJ?=
 =?utf-8?B?VEVjeFIyeDZCKzA5bFZBVWhJTk50NDdrODQ2bVk4KzJIS3VHZjJLOVEyclIv?=
 =?utf-8?B?by9TY0lFSXRqNXJxeHNXTzRXY2VtYXNXWmIrKzZnL2VXQkdqNkJvSEI5V3c1?=
 =?utf-8?B?OUdlVEs1dUJnYXA5QmVmSXBIaFdoWE5Ja0dzTTI5MnY2ODdZRHdERDFoMkdP?=
 =?utf-8?B?K1hTMU1McDhMZGQyR2J6WUkyb0R2UkRsMUpzOE1jQUxVOXBkZ3ZaaVdoOXk2?=
 =?utf-8?B?WlRLSGNQYXd2b2RxSmlIZU9LVllaakN4QnhZZjhYeWJtd1hjSmQrREdlbDFL?=
 =?utf-8?B?eFdjcGZzVWEyL0thdW1KdHRqNXNVZG1ibk5zc095Y24yVUMvcDFaK1pIaDk5?=
 =?utf-8?B?R3hsaXRmYm1ibzdPVm9TcUpTRnlHcURBNkZPQS9BcnlEVlJaV1BJa05GSm41?=
 =?utf-8?B?WTgyK1Q0Ymd3K1RXNXVyaWZ4N21wWWFuQkYvQ3NrU0oxaGNyQkxQeCtLcUZI?=
 =?utf-8?B?S0hDeU4zNmlDbllVZ1dmQndNL2ZtS01maC9OaTlncVR1Vlh4NzA4RFNjQjZZ?=
 =?utf-8?B?VTJ3YllpMCt2bjcwT3NxUUNCS3dZZ1VydTBKK3ZSV2lmS3ZmaHBDaFJaTVBi?=
 =?utf-8?B?bnBMeVVralNYRys3amdnKzIzSlQxTW5nYklUR1VVQzQwQkJqbmN5akpXZUxq?=
 =?utf-8?B?OGpIRDR6a0IwNTRKa0k3NXdmc2tFeTRGZjNHOUo5K0poaE1QbG5ML0wyWDA3?=
 =?utf-8?B?MnpZUlNaSzMrRGltTUMzNkQxNWd1VVdoQ0xsTkFqTzhUR3ByaXB6eVpIaG5u?=
 =?utf-8?B?NCs4eUx1TkhGMzZMY2VCOGN1UmM3UFBuU2s5ZnhKai9nRVdFbjFTUjVXL3ZZ?=
 =?utf-8?B?dmQrNHY4aSsyVmV0bHVEZUtxRGd4Y2VrWkNydDJ0enNpZm14eVc0ODJRYloz?=
 =?utf-8?B?N2tzaU9oVXNvZklwTlRTMmxwTXZFaVdVQUMvbXdZS1RwZlR3U3JIcG9IcFRz?=
 =?utf-8?B?aHRsK2V6RG9mTU0xcUdkQ3NFaDFJem43ampqUGxSZFE2MXVva1JQTUlWbWYz?=
 =?utf-8?B?ZGRqTTZONTdRZ0o5MEQyUXg5Y0dqMWtZUzB6SmlLZHd2MTJIR2UzbWpFMDhC?=
 =?utf-8?B?OUNNWVc3Q3FKOHRiTmNEb283YWxyR1MrbnI2SHJjZEc1cWFrMGtmMVRyKy9V?=
 =?utf-8?B?eEEvd3JFQkxORHV4Q0RPdVdaYmo2NVo2MG5FVXhIdVNEQlpnYlJRRmJDblRN?=
 =?utf-8?B?UjdIWVdzMFRNcFRiMDM3SGMzMTYvWnNWekUyamFzU290MUVuQmpiR2F6VVB2?=
 =?utf-8?B?L1dNMHRDckVzREYxS2ovTkpTU3hkKzg1VWNSZWk5eTRXOWVIY3Rwa3R2bTg2?=
 =?utf-8?B?aktLeS90b0ZsL29pN1kzZ2t3WUdta25pRk5tRVRmSGdxdms1dkJ0Wi92elJa?=
 =?utf-8?B?dklFYTFOTFpLYllycTBKQm5RbFdUT004VGRJc2RnUCtMRkNuUXhlVmIxNXJQ?=
 =?utf-8?B?VGc2Si9BK0R3QWx2ZzU5SzMzOXlRcnJraU1RK3gzS3JvWWxBRlJKMHJuQksy?=
 =?utf-8?B?KzhNN1R5aVhLYURaRDFPWFFpQ0VqdmR4VWMrNWVpWDBSL29WUnVEZ3B4dzUw?=
 =?utf-8?B?S2ZMQ2NFUW5ZRkNGdVVPam9jOHFyRVRiSjJPMUo5d0JiZDlCc0dCek1jeE1Z?=
 =?utf-8?Q?dAwPabSe5HoiJJ7lG1cqSZcpJ?=
X-MS-Exchange-CrossTenant-Network-Message-Id: bb60cb0f-e2d4-4628-785b-08de30e979bf
X-MS-Exchange-CrossTenant-AuthSource: SJ5PPF7DCFBC32A.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Dec 2025 14:54:06.3278 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sBhqoNal5qX8iXatKd+JFrOinHdk3D9tCQ9PGiZUwe98d2Z4gnTQZR46yuKt96ccyYkLOMEUzP+JUDgnSDay7Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4699
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

W dniu 28.11.2025 o 17:24, Patchwork pisze:
> *Patch Details*
> *Series:*	tests/intel/xe_eudebug_online: add pagefault-one-of-many test
> *URL:*	https://patchwork.freedesktop.org/series/158209/ <https:// 
> patchwork.freedesktop.org/series/158209/>
> *State:*	failure
> *Details:*	https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14132/ 
> index.html <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14132/index.html>
> 
> 
>   CI Bug Log - changes from IGT_8645_full -> IGTPW_14132_full
> 
> 
>     Summary
> 
> *FAILURE*
> 
> Serious unknown changes coming with IGTPW_14132_full absolutely need to be
> verified manually.
> 
> If you think the reported changes have nothing to do with the changes
> introduced in IGTPW_14132_full, please notify your bug team (I915-ci- 
> infra@lists.freedesktop.org) to allow them
> to document this new failure mode, which will reduce false positives in CI.
> 
> External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14132/ 
> index.html
> 
> 
>     Participating hosts (10 -> 10)
> 
> No changes in participating hosts
> 
> 
>     Possible new issues
> 
> Here are the unknown changes that may have been introduced in 
> IGTPW_14132_full:
> 
> 
>       IGT changes
> 
> 
>         Possible regressions
> 
>   *
> 
>     igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-a-
>     hdmi-a-1:
> 
>       o shard-tglu: NOTRUN -> FAIL <https://intel-gfx-ci.01.org/tree/
>         drm-tip/IGTPW_14132/shard-tglu-2/
>         igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-
>         a-hdmi-a-1.html> +1 other test fail
>   *
> 
>     igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-shrfb-draw-mmap-cpu:
> 
>       o shard-dg2: PASS <https://intel-gfx-ci.01.org/tree/drm-tip/
>         IGT_8645/shard-dg2-4/igt@kms_frontbuffer_tracking@fbc-1p-
>         offscreen-pri-shrfb-draw-mmap-cpu.html> -> FAIL <https://intel-
>         gfx-ci.01.org/tree/drm-tip/IGTPW_14132/shard-dg2-6/
>         igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-shrfb-draw-
>         mmap-cpu.html>
> 
> 

KMS - nothing related to the changes.

...

> 
>     Build changes
> 
>   * CI: CI-20190529 -> None
>   * IGT: IGT_8645 -> IGTPW_14132
> 
> CI-20190529: 20190529
> CI_DRM_17605: e1c1b3e03e356d1e20432dcb0d38ad44d5e92670 @ git:// 
> anongit.freedesktop.org/gfx-ci/linux
> IGTPW_14132: 14132
> IGT_8645: 8645
> 

