Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E71CC606A332
	for <igt-dev@archiver.kernel.org>; Thu, 19 Nov 2026 03:27:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=RtHBD0xp;
	dkim=pass (1024-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=VnTTKndt
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9852D10E423;
	Thu, 19 Nov 2026 03:27:44 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5863110E4EA
 for <igt-dev@lists.freedesktop.org>; Thu, 19 Nov 2026 03:26:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795058797; x=1826594797;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=Dbjuyz3vDhyDO0eCS055dEFI6L+1d/LS6rXrlXqxDks=;
 b=RtHBD0xpc9OWm31U8hd26NaPppseltW/RKNdFnZ4Oo5pjRGxoDdeGo8z
 RuoJ9mbo0SKtvJru/EQ3Q7a76EQ/QFTNR74rKMo3cAX5Ts1s2elmoXrQT
 7FBnhOMvtZkR96rF6c+Hu6+bn4Z2Y7J0xSzep8WXb3zuYBS7DsFHPk+xC
 7t65E9J2wBSqKjKfZUDn7WGY9GKXOVF58u2fwBJPkpgV/2gKy57aPcczx
 QAkV6LZ2e70/mH62DUEjFvpRB1LpZq7gXuuQRp/ZDNcf54/jomcqJOItv
 ZYGcp1R30Lp3Mcgps7nc/GsLb1NMHigF0j2/vogYhtzW0Ocky7vh7a2Y0 w==;
X-CSE-ConnectionGUID: bx5MSFjQQDqGAXdXdBcKJg==
X-CSE-MsgGUID: bOEeyklJTCOAgf7fj8dcbQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11970"; a="3933605"
X-IronPort-AV: E=Sophos;i="6.27,220,1787036400"; 
   d="scan'208";a="3933605"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2026 19:26:36 -0800
X-CSE-ConnectionGUID: RMQWLp5WSPmw3cZZH7zUwA==
X-CSE-MsgGUID: hXfprLWnRWiqEVsK/cUDUg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,220,1787036400"; d="scan'208";a="10244189"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2026 19:26:38 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Wed, 18 Nov 2026 19:26:37 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Wed, 18 Nov 2026 19:26:37 -0800
Received: from BL2PR02CU003.outbound.protection.outlook.com (52.101.52.20) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Wed, 18 Nov 2026 19:26:36 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Icd3IAbCw3v714wMvZiMtVUutcGyxjLASZQ+PnuwFGkdRnOHkAyiht3UB2q/aQuJ+hyFHRED8vdXzjXEKzMOG4homGYPQoqoGcoDoJtwz6fQtJxPLI4akShWXBQ8CASnV+6DKTW+cziryMhL/Ksw3dlZ3UD9XKIzIlyzdIjXTY/k9DYyL5ubjaf7ef4W1NLweolpTP/MejCDGwbdD5izWKqRcvz7X/idGlYTbXcjMV2mFGQ+UX+VoxUppQfWoSNnrZvoZ2uMGq0mJpEe53ov+SvPrBHo/nHlGrZ6uCo41VsbjrQ+YiFYmoXyDVoaeRVImqhvyzizwlgNmu8mIsq86A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0WeTIOkcvxl+3ynJ8z7vR+98c9Z3gj5zRmhAsXU8jEA=;
 b=gbGgBN9GW/3zCwSLiOGtugycm5J6b5QxMU6GWpoRJRtXHxb2inneTmjqFzglAI5DtjtF535URrPp78MlzRtk5rS8V0i7PFztbw4QMQFRG+WurboYy4s1I8yQIIc+bo17hqSIHCFQ4EQN6ByhliDkRFN0VWltxaKD8KdkOxoLSSNIMrx3lxTuWAI+/6OlobxpLga/N8pBCio0STZfeWh0Cl+nAh7dUiExAFNQ73pYjqTvktpaGy22cICwbOqRMVSgDpfDpXZpguUV2cEnPF+aOzYmiEiw1eljrf9nraqUHpMQFKIxrCE0oGeF9lS6FGyRLx4EQyzb9UtXEGrVUjey3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0WeTIOkcvxl+3ynJ8z7vR+98c9Z3gj5zRmhAsXU8jEA=;
 b=VnTTKndt4zT0/Bjy6S9GXjPvCog9HOtXg8pyLESisWq3fnVj7ikTbKsf71BChuHATEADXWMD4Jvv9tiQN3lRmgiMpubiF1Sgb38ebcLci9ryq9rVElD+qPecrFWxQi2KXOsatMv9yBALdBlKcjLrhnDZoBcThXmO6PLdEGmnw+0=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SA3PR11MB569431.namprd11.prod.outlook.com
 (2603:10b6:806:53f::5) by DM4PR11MB5279.namprd11.prod.outlook.com
 (2603:10b6:5:38a::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Thu, 19 Nov
 2026 03:26:33 +0000
Received: from SA3PR11MB569431.namprd11.prod.outlook.com
 ([fe80::36f0:fe31:ac43:ae77]) by SA3PR11MB569431.namprd11.prod.outlook.com
 ([fe80::36f0:fe31:ac43:ae77%2]) with mapi id 15.21.0615.013; Thu, 19 Nov 2026
 03:26:33 +0000
Message-ID: <bdae5fbd-eb7c-4d18-96f2-2bd53aed2e4a@intel.com>
Date: Thu, 19 Nov 2026 08:56:25 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t] tests/intel/xe_compute: Use monotonic clock in
 loop-duration-2s
To: Shuicheng Lin <shuicheng.lin@intel.com>, <igt-dev@lists.freedesktop.org>
CC: =?UTF-8?Q?Zbigniew_Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
References: <20261119010857.377785-2-shuicheng.lin@intel.com>
Content-Language: en-US
From: "Sharma, Nishit" <nishit.sharma@intel.com>
In-Reply-To: <20261119010857.377785-2-shuicheng.lin@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5PR01CA0168.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1cf::10) To SA3PR11MB569431.namprd11.prod.outlook.com
 (2603:10b6:806:53f::5)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA3PR11MB569431:EE_|DM4PR11MB5279:EE_
X-MS-Office365-Filtering-Correlation-Id: 9d072e70-960b-40a6-befa-08df45ece8a2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|23010399003|366016|22082099003|18002099003|261009223027099003|261021135927099003|56012099006|11063799006|261026121527099003|261102123227099003|261028144727099003|261026140227099003|261021121427099003|261022105027099003|261021123027099003|261022075727099003|10067099003;
X-Microsoft-Antispam-Message-Info: /cxOxAyK/G4JF61zKL+ps4Yb83neqoO1cYAIgSYn6g/qnkxwRTPYMiWoWRvgLygzQ0JLiiltRvYQTOI0d1zC8NrWo7Tj7mLzSNtVNRjCMszBAD1B5cJLx89pAvVjJKDVsgZQMAPGay79wI7bXC+fE3KN2N+thVn/hd5Ha6KcI9v4o9ts2IRR7NF6TLh9U1kSY1uX6aT9iE1mq9x5nSCzGPw0mp7cfuvpfOxdJXYyblGG53CirmMCJqCg9hujz/1jHmkBYakceYOEd/sANsDyJbvRNqrnM/IGYfch/NtOVUrnZkTvc5E1gDVZMjjPf+l5hl687r8A+ymQQPQQgrm1PKJQvAlx8wl4LjjQ51y20DH2k0/hKgKbrA9jI/OpL7Px796ndG1WlWe1Ie+TjWB1VLTu7X1oN0n7sP8ujQzIdEqB4+T4MjruB7LIAhv361wXC+fGGVTPYQs65SOulReuTgg9YNkKQys+nXv2rZ5GHr6qol2rsa5pcFbn8qJE9L0WG1Iok7NxPVe74X3x4kDVFPBip+u/NU3bNyrIP9fo3AO5QNG7YSGfmM+SfCp6iSbsjB5422RIMf7Yu3hRMjwUh7v8x3nnV5MuzUcAW2pzHFE=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA3PR11MB569431.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(23010399003)(366016)(22082099003)(18002099003)(261009223027099003)(261021135927099003)(56012099006)(11063799006)(261026121527099003)(261102123227099003)(261028144727099003)(261026140227099003)(261021121427099003)(261022105027099003)(261021123027099003)(261022075727099003)(10067099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OEgyclpOcmhMZUZtV0FNYU1UclhETmx2dmVBeVpra3hJTm5QTmltY3VmczV6?=
 =?utf-8?B?QXFhbXdxOHF0UVd0eDgvdWwwOHNlcWx0aG4wQjNhRHRKYUgwRGc2c2kzdFo1?=
 =?utf-8?B?S2dqdWNlTDZIUHNsTURIVmlPampSZGg1Y1NIZE0rcE9yTktNQm1kUmw1N1U3?=
 =?utf-8?B?OUs3MTNrRzlRemEvemQ3Uldvdmhoekt3UU5SL2M4R2lEQ1JOWGVubkd3ekFo?=
 =?utf-8?B?anczYlpXU1hrT2JUTG9sT1ZhRlFJYXNCcGhlRnoybzlNZnpVbVhIb0tTSHFH?=
 =?utf-8?B?UTlOY3BNZGh2dGhOeWc1UXdsRUN1YU1JVnFTMDhxZEJxZy9rUTk5dXVQSnNY?=
 =?utf-8?B?WDkyZ2EwZHM0REFhZjRneGcrdDZtWXB2Rjd6eDM1TVJ1WVZ3Z1ZxSE9mVWxL?=
 =?utf-8?B?eVFsLytLWVhOS3ZseUZOSEpSWjJITjBzcERzR25ORTJna2tnVG51OGZORWpz?=
 =?utf-8?B?TkpwOWc2OGl2Vk5oTWhVa0o4YXpudFRhaXNzZWFhY3paNlczaGl2dUxtSVJs?=
 =?utf-8?B?Q1ZjT2IxbW1aSU9NUXJ5QVBOTDlzR0xDaFB0d0lJUHJHUGxPcjE1NmFyZXRy?=
 =?utf-8?B?eVpadmRCcXFSRFRYckcwdTc1R2xrL3hPVHQvRFcxbStZN09teVRCbUtmUEs0?=
 =?utf-8?B?STNxL3dnSGVDTk1YRzdTUEhaWEZFVzNNd2JCVDc5TFB1Q0NEbkhqejQ5c3FS?=
 =?utf-8?B?RUFVZ2t4V09FY25qa3ZtQWNOeTZHUU1sN1BrWXFieDdYakZ1RkgzdHo1c3o4?=
 =?utf-8?B?NDlOOHZVNGFCVnZmYjN6ZUhoKzdhdlBOR01TTHVCNEluMWhiL3I2VFNmczVR?=
 =?utf-8?B?WDJPRzBiTC9wSVdBRCtvNTdTUkRUb0NVcE1lL01FeFluYUxFTzhRWVZCS1p6?=
 =?utf-8?B?QmZRUlE5ZWdqdHBjVXMvQkRIanFpUFNuUndZaWpuVy9DK2xHRkZHSGlyYm5L?=
 =?utf-8?B?Mm1vN2xkQkxqMjVUWk1nUE96a0kyakxaeFBsZUJiOUNqOS9RNERuMk1QWmpV?=
 =?utf-8?B?MjBid0N3cXlCSGd6S0dQK1A4alpFWnVqbzllU3daWEVDcWhtYTBUZVRQOXRP?=
 =?utf-8?B?OVoxbURDTE11WVkvTXZLRk5oOWRQU0hEdlIrKzJ5Ly9kdjZTZS9jN0tSOW5j?=
 =?utf-8?B?bWgzMnFHWERqaW54RGpKNUVKMVRIck9kazRCNkJzRndjWXdzVG9nemZBM3Jw?=
 =?utf-8?B?UG5nREhUejQrUlczL0VsRVA1MEptNkEyd1VOTCtZdzhaOFZPQzI1M3Vlb1kv?=
 =?utf-8?B?TVlLeVhweGFBeDVra3NwejNiRDNwSWwzMnFHSllsWUdZVDNtNTdZb0ltQytz?=
 =?utf-8?B?dlJZc1dOaFBFNXJJUGpsdVVIVFdld3NCcXZNR3Zkc3hTVzZqeVVzRXhrcFBM?=
 =?utf-8?B?Szg3OGVmeGNxUXN1U3I1TDhWdW5uSlgycFhoc051NjMwNU1XSjFsZlkxamll?=
 =?utf-8?B?aGh0OXptZ0wwZlJkcmdna3JxUStMYXBzR0s4OVM4WlVCQTlKVnZPS3QvSjZZ?=
 =?utf-8?B?aStUTkJUeEkzaTFUS2E3c3R1NWZlU2tzanczUVRaSnJXajFMRDYvK3BVZS9S?=
 =?utf-8?B?dS92czhoT2xZVEtBUHlDYTJSTjF2U3M3U2VZYWc0bXdOeFZSMUF6QlNuc2wv?=
 =?utf-8?B?L0s5bmQwUGJKdmJxOFdSdTJNZGhYbng3QmcxbjBnc3Buam1GM1F5dXNpa01a?=
 =?utf-8?B?Sm5nNlZVUHpqUERXWnZiTlZlU1VQMStmQ0VWWlQ1dlRLRFUreWtkc2FzYWV2?=
 =?utf-8?B?MGFxRjlFaVcycDh2ZFVxRzlReVU1WGhCLzB6dXY4VXluQW5iQTVjQ0VUcm5n?=
 =?utf-8?B?cnpsUnVURTJrL2orVGRPU1NQaXQvS01Cc21tU05lUUM3a245Um5FN3gxbDdD?=
 =?utf-8?B?L3NaSDd3TVl1cDQ4ZWdyRloyRXRBR0orUjlwM3BQSC9hSmVLV1pJQzBya2RV?=
 =?utf-8?B?ZHh1Nko1dWltcFlqVytoSFhDK2RvNzAwRXUwUE5EY2R2ZHhIeHZwMUxaeCsw?=
 =?utf-8?B?ME5hNUFmL2lvN3AybHhMK1h0Z21kMzlscXhiUE05OHArczhobHRubXdReGp0?=
 =?utf-8?B?Z2lTZHEyVWJSR3pnVWQ1M0RkTGZjMmM0V3EyYVRHNTIyNmdMZWpHWE9NRHR2?=
 =?utf-8?B?Wi8ydkdERE82SERFSmZmd056RnN2cy9QY2JyNjlXdEEvMW5rcXdTTjR2WjJ0?=
 =?utf-8?B?ZlVNTHQ4aTBuSEFxQ0d3TnJJTzFuek82S1BhY1oxKzAyL2EyNm5Qd3poekNP?=
 =?utf-8?B?M1VZRTdiWHZ1R2FTQzFRdC9WTzNjU3ROamo1QWhDTnZ6TFFlN1k4YmFrdEF3?=
 =?utf-8?B?MktVcmpCTWhSR09DK2d2U2NsMWxGa0lOWWEyTzhPQlRKKzVKdmN4dz09?=
X-Exchange-RoutingPolicyChecked: kwHKppVV60FtF7Ojk83UyG8fCIPD1lSVcmcH0NH4z9+AMVX53TZUrC0heLz4mQeA4IIdy8yeCNB+VHqpqk7z+rqYGsFcfGVKhMF679bth2AilcXWorskFlMRQ4FbaKL4rqD5WStZPWLq/u18zJuzqlfL9un5dxPz2ZWp1MXwtH/XF6KHdTQ7H75BTv2sUG4ZWu0/L/LfBp4h02z7H3DKns805D5y7qocPdo9kKOD43rgGhRVW6FAKSGayXUH8D0J9EBYnQj00IpIwr6LwiBpK+AvVlDUpoZfIfZkd8pESax7wqcl7hGnI87UbclOXXGjORLC/fe40clBKzlTce200w==
X-MS-Exchange-CrossTenant-Network-Message-Id: 9d072e70-960b-40a6-befa-08df45ece8a2
X-MS-Exchange-CrossTenant-AuthSource: SA3PR11MB569431.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2026 03:26:33.0378 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KViiWH4o/LTYK66TRnrakjx8Lv69pymchAUuAbFjLS9JXXilPn3f14CFmVNG8L77TZBl5EPoryB8ceyWfkznHg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB5279
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


On 11/19/2026 6:38 AM, Shuicheng Lin wrote:
> The subtest times the loop kernel with gettimeofday(), which follows
> CLOCK_REALTIME. If the system time is stepped (e.g. by NTP) during the
> run, the measured time falls outside (1.8s, 2.2s) and the test fails,
> even though the kernel ran for about 2s.
>
> Use igt_nsec_elapsed(), which is monotonic, and print the measured
> time and bounds on failure.
>
> Reproduced on PTL by stepping the clock with date -s during the test:
> the old code fails every time, the fixed code passes.
>
> Closes: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9795
> Cc: Nishit Sharma <nishit.sharma@intel.com>
> Cc: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
> Signed-off-by: Shuicheng Lin <shuicheng.lin@intel.com>
> ---
>   tests/intel/xe_compute.c | 18 +++++++-----------
>   1 file changed, 7 insertions(+), 11 deletions(-)
>
> diff --git a/tests/intel/xe_compute.c b/tests/intel/xe_compute.c
> index e738c9dab..ee376fd88 100644
> --- a/tests/intel/xe_compute.c
> +++ b/tests/intel/xe_compute.c
> @@ -207,12 +207,6 @@ test_compute_kernel_with_ccs_mode(void)
>   	igt_require(num_gt_with_ccs_mode > 0);
>   }
>   
> -static double elapsed(const struct timeval *start,
> -		      const struct timeval *end)
> -{
> -	return (end->tv_sec - start->tv_sec) + 1e-6*(end->tv_usec - start->tv_usec);
> -}
> -
>   /**
>    * SUBTEST: loop-duration-2s
>    * Functionality: OpenCL kernel
> @@ -228,7 +222,6 @@ test_compute_kernel_loop(uint64_t loop_duration)
>   	const struct intel_compute_kernels *kernels;
>   	struct user_execenv execenv = { 0 };
>   	struct drm_xe_engine_class_instance *hwe;
> -	struct timeval start, end;
>   	double elapse_time, lower_bound, upper_bound;
>   
>   	fd = drm_open_driver(DRIVER_XE);
> @@ -247,20 +240,23 @@ test_compute_kernel_loop(uint64_t loop_duration)
>   	execenv.kernel_size = kernels->loop_kernel_size;
>   
>   	xe_for_each_engine(fd, hwe) {
> +		struct timespec start = {};
> +
>   		if (hwe->engine_class != DRM_XE_ENGINE_CLASS_COMPUTE)
>   			continue;
>   
>   		igt_info("Running loop_kernel on ccs engine %d\n", hwe->engine_instance);
> -		gettimeofday(&start, NULL);
> +		igt_nsec_elapsed(&start);
>   		igt_assert_f(xe_run_intel_compute_kernel_on_engine(fd, hwe, &execenv,
>   								   EXECENV_PREF_SYSTEM),
>   			     "Unable to run compute kernel successfully\n");
> -		gettimeofday(&end, NULL);
> -		elapse_time = elapsed(&start, &end);
> +		elapse_time = igt_nsec_elapsed(&start) / 1e9;
>   		lower_bound = loop_duration / 1e6 - DURATION_MARGIN;
>   		upper_bound = loop_duration / 1e6 + DURATION_MARGIN;
>   
> -		igt_assert(lower_bound < elapse_time && elapse_time < upper_bound);
> +		igt_assert_f(lower_bound < elapse_time && elapse_time < upper_bound,
> +			     "Elapsed time %.3fs out of range (%.3fs, %.3fs)\n",
> +			     elapse_time, lower_bound, upper_bound);
>   	}
>   	drm_close_driver(fd);
>   }


LGTM:

Reviewed-by: Nishit Sharma <nishit.sharma@intel.com>

