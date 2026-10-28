Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 671FB606A31A
	for <igt-dev@archiver.kernel.org>; Wed, 28 Oct 2026 09:10:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=QPfSSUqj
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E7A010E5D3;
	Wed, 28 Oct 2026 09:10:08 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4191810E5D3
 for <igt-dev@lists.freedesktop.org>; Wed, 28 Oct 2026 09:09:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793178552; x=1824714552;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=+pD2E/jLu0fJymTiJDnxwX4u4Fu+sR3QzMxV9T/Xl4M=;
 b=QPfSSUqjCj71idu2hTJsUb3VD8+Eftbc0hedq8ORa7gylN4FrKZw0GL5
 wRwlbsnnoLV68ZPGgZt9QZmhxFsZj9lABcvQwInGKAazGrbn393br9Xfm
 owvCxuulYyVKMcedLXPiqFPpI3NXkCV6hD2J7PgXybWIzyKKr6e0oYRg0
 YjDH/RDGPkY03EYG1wm28A3v4+waJBNUhfoGX133fp8e3ofR53LY+nhev
 CAfVBGdBtcZ/TRdIUbrS74uBqX/gxTYLBnzoHjTf4ZgOZYBs+R7KxOZeT
 +kA1d+gy75M0NCHCpjx2l5AAiZTAmnejoVt00RsPFeMrGgvtlZe2dY1n7 g==;
X-CSE-ConnectionGUID: rGyxTMlCT3uDqyBuc97aqg==
X-CSE-MsgGUID: qLIsOjv9TAuTIEABBuCicQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11948"; a="1915657"
X-IronPort-AV: E=Sophos;i="6.27,182,1787036400"; 
   d="scan'208";a="1915657"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2026 02:09:12 -0700
X-CSE-ConnectionGUID: xatYnPjxSa+In6uly+1AgA==
X-CSE-MsgGUID: Xu5jDn21QzK580or9Ex6tQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,182,1787036400"; 
   d="scan'208";a="4924168"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2026 02:09:11 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Wed, 28 Oct 2026 02:09:11 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Wed, 28 Oct 2026 02:09:11 -0700
Received: from MW6PR02CU001.outbound.protection.outlook.com (52.101.48.16) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Wed, 28 Oct 2026 02:09:10 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lcQ3IdIQBIS6JUN7GVMv0m1oRsJnHb6Du7O1Bd9/vRm2Sz72k8QeHKKNRLekiZfA+WVCSmZ5IbHgnOT2zsNR0SUstHNvhFvMNrfdhi3CNbQva1ZIKnUM9vC/5tZ2u1+9ve+/6oMmWOvbNDAk4jjw6+oh06ZXLyIbhEnxat5TSJiMq1aIHsg/nEO2eCKWsGlCy9sAkF5+uEJpzTVKhyr7//2NADxB8t51Y1NuRKyEYwtHl8ZpTE5z/NbRt7t05ld0sbGMTTpsYoVanpSF6bvmbWD/TUYztG9RSfNKon/wMLJHdVzRNOLj0V3nhdfxF3zJXgS2ci+D+OIJJ+Basdo97w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jWYB+5b9uV7+44rW0c1e3hwAqdZC7n3QXv/kHjI8GOY=;
 b=lwP1pgR3k52qM3VpJDcIdxCYYMpuBDlDk2Bykp+EVVH8UViyE45a/QcdFlBiArMUySuFhn5LRj8g9qYJd8+hWqu4Ou1msAfS32wlPUiLJ7S7S+OdyPxkMyCXWvA8ZticaDiPo8tyl8y3FrUpGL8e8DDRrE4HVYMwY8DzqzQfQOKU5eEQdJ52y2Cf64mZ7JNrGopk3HGJehTfueckvCQMAVr6yLrGds4itMkcNcuvxcY403zzoxEo9TrvKsbk3avkTiqYpPXM4W3WFKWr6MS6COiitMrxdGH7K5pVgQHlXA/vtM0BRb610IoGNr2Y1o9I2L6vHIW4RL7O6iURpq2FXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH0PR11MB5690.namprd11.prod.outlook.com (2603:10b6:610:ed::9)
 by IA6PR11MB469167.namprd11.prod.outlook.com (2603:10b6:208:5e8::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.22; Wed, 28 Oct
 2026 09:09:04 +0000
Received: from CH0PR11MB5690.namprd11.prod.outlook.com
 ([fe80::d0b2:7271:ad7e:cb1a]) by CH0PR11MB5690.namprd11.prod.outlook.com
 ([fe80::d0b2:7271:ad7e:cb1a%6]) with mapi id 15.21.0546.021; Wed, 28 Oct 2026
 09:09:04 +0000
Message-ID: <b0ef9213-3981-4620-a74e-ef6c585835db@intel.com>
Date: Wed, 28 Oct 2026 14:38:56 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t] tests/intel-ci/chamelium-only.testlist: Update the
 chamelium testlist
To: Pranay Samala <pranay.samala@intel.com>, <igt-dev@lists.freedesktop.org>
References: <20261027053126.1135315-1-pranay.samala@intel.com>
Content-Language: en-US
From: Karthik B S <karthik.b.s@intel.com>
In-Reply-To: <20261027053126.1135315-1-pranay.samala@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5P287CA0284.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:221::13) To CH0PR11MB5690.namprd11.prod.outlook.com
 (2603:10b6:610:ed::9)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR11MB5690:EE_|IA6PR11MB469167:EE_
X-MS-Office365-Filtering-Correlation-Id: 2badebd4-bc2b-431c-e753-08df34d31d29
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|42112799006|376014|1800799024|366016|18002099003|22082099003|56012099006|11063799006|10067099003|261022075727099003|261021121427099003|261009223027099003;
X-Microsoft-Antispam-Message-Info: GCRv8RaADGcO3Cn30H8jRGKst/i1XwY0nv9CUngYjQyWPmMcmkgwVGIrakVQrbBpGH5So644oA/Ni0B/dm5xuCqYSBa/nNfXyo8xNQNDj2Alw0sLjSgCrhdcTZkoQW8Y54aqpZEW2n1QhPYxbSN/FYyXJXp5rVuWdBu2IakWi3OttIt696E+Ai2RtckjkzpoCAhBsZL3YZbj8/RRyRH48rQr/GyS0POxFoLtfgO7JGF/RUWvB3jUAlSZSA6fMZQdpNM3bqBK1DyF2dDUWjZ2pBID7oQw5Vnt52VgpTKQ4ptCNXeGK3JfDk9BAEy2SE2IhnauZkbfrPiSPpi0+nKxzO+LZ9NIYOkrH3yHsL8cCpvShoC2nvYuvW2umv4qE/PCzbKf2O20+db4MWvyPp+qBka9sW3ALsk2NdGtlkf4/8WYhJHvOzRJGPGft7p5wr/n/GmbDDOizNVgi0lvKClRYASCYvlQ2zWjOVevP784dTaSMnot1eBsOa0OZaGR6ZDV6VsF1HNKpAXzzJXPBxn2ndqvvMSGBQO0WSMDv+hX4KA70SMT+71DJQP4zooYeh8Q/lqx03QbIF9vrUCX+2amHnK86e5fdnlSMEb1iyh9zfpxCPmddQTlBCSndrAiHfehVo5HI8Ay3Q9Jx68VlVCEW35tQkEvvxGLIoOV0NBd01Y=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5690.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(42112799006)(376014)(1800799024)(366016)(18002099003)(22082099003)(56012099006)(11063799006)(10067099003)(261022075727099003)(261021121427099003)(261009223027099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SmY1b0pqNi9icHVCZTRyVUxHcDlxWEs4ZVBOVk1tQXV6YWhiSDI3RkI3VjR5?=
 =?utf-8?B?STJ2RC96Tm5Ka3B4ZEVsTW5tWmhBajc0Qk5Pc2hOSkxKSVpvQ2pNd3pWNVJS?=
 =?utf-8?B?dEJKMUtnUjZtWVFYcTZkb0FLRmU4QWZ5WjNCd2IrR21rVStRTklZWHc5dUR0?=
 =?utf-8?B?OUZrOU9QeStsN1RWdlp1WCtQVmVNUTEwSmVLMjZjVFpFUGFQelFXTTBrTmI0?=
 =?utf-8?B?VmxISHpXdnZBc1F3RWd0amEyZHhzUXY4SDA2b3Zzek9tcVZaVDBxY3lDMVl4?=
 =?utf-8?B?QWJqVE5Fd3c0OVdBeFVUMGpORHBpZnYreFJLL3pMMzV1KzVsNUVKSDM2dnVM?=
 =?utf-8?B?ejdTWldNMXlMbDI2YmlEYVRnUEFwcm91QkhzdUhjSGFVMnhHaU9NRWc5aklQ?=
 =?utf-8?B?ejNyRk8rTFF1UnpMdUJEVTVqWDl1RlN0bFVGMVROZEtpS2c2NURsV205QmNi?=
 =?utf-8?B?ZlR3YU45VlUwWlBoS0hwMnFyYWJZTXFLYlMyUTdCcE5kazFUOWgxOFFaS2Fs?=
 =?utf-8?B?U1c0WXJ5MFUxc1JwdXVlTW5YYldzTG9zTlY5L1hORGNCR09LK2JLblNzdUZR?=
 =?utf-8?B?eW1rNHcxWWVVMjRZeER3eW1qNU5ieUxSQlZRQzI4THFuMnprTW5QcTBhM0E0?=
 =?utf-8?B?SHJJdVJlWjRXMHdndElxdm9CV3RIcnpOVkhISFZ2WUljVXg3N1FlTDU3bWFE?=
 =?utf-8?B?bGV4cTg3QWNZZ1QvbUN6MEhHYTduMUNPczJJRUtrZUZxR2N2cCttTklvR29m?=
 =?utf-8?B?NjdHRjd5MnlWRW9SMWpiNFZrN3ZldzFOK3hvZHZuODRSTDFVYW9sK2UwZWFX?=
 =?utf-8?B?MHlkMDBWZW1LSGpmTEtwVUFmRk0rRndxbXQraDJ4MmRGT1pSQnlpOHhWMkZR?=
 =?utf-8?B?NnhyWHdFVDVTYldlb3ZvQWNINStMV1FVQStsc25SSHd2SXRMNWRtS00xejJ1?=
 =?utf-8?B?bi9YK2JaeUlpNEozb3JtYzF0UEtUQjNMWnVpeFhmakt3aVlHOFEvT2pPbWtB?=
 =?utf-8?B?TmZJZVAzTDJvWFRIOHJXUWlobExPMEVLRm5nSzNHMFBUUWdpZUJxRkJYaTIy?=
 =?utf-8?B?d2k4OUFtN3EvaStSb1NBcGpsVWxIVDFJcnhVNG9nNXR4bHlzazIyRHg0NUg5?=
 =?utf-8?B?dHp2WU0wa0pXNS82UFBuQ2s5cEM3cjBka2ltcFVvcHZoaU1STDRZZXlRblRo?=
 =?utf-8?B?VVpvTzlva29ZY2pKc2RPTXYxbnVjSlNmM1NXN21landudEZRdmp4c0J3eEE5?=
 =?utf-8?B?V25jSEJwKzNFSmMwM0FhVElBU2UxeUE3Tis2cmFWWGNmZUZsckwxNFRHS3c4?=
 =?utf-8?B?UWg2YS9rajBFak80K0xXQ0NRRWxmQmFiS0J1U3R1MWJreEd6c0FiR0tlZmxR?=
 =?utf-8?B?V24vV25iWW5QZThrZW5MRGpOZ0Z0d3ZiTWt6MmhXK3JWS3FQQ3pMaWZRM3dE?=
 =?utf-8?B?SDcvYW5SUlhJSkJxSE1sVzl0SFgrYWRBeU5NTnhKWk5jUUFwMTVQeWhiNm9r?=
 =?utf-8?B?dVlpb21wYUVNMlFQaURQbzFuZWgvckxZSXhEM3pXak5nUC8wYVRSdklpcFk0?=
 =?utf-8?B?bUdYc20vUStSRklUNE1PenczNlpUaTNkemsxc2tOMlVPdXo5WTNBZVV6WDVK?=
 =?utf-8?B?VG9oWFREaTdUYnA1d1Q5bTVFWE5sMXpxQzVKUFRreGdyd0JMeGRkcW82T085?=
 =?utf-8?B?VHEyeTR1WlNHU3h5ZFNIcU9OSXczUU1vMGlLSzcrM2tGRFJwVDZyNlBRQVRx?=
 =?utf-8?B?NjA5WW1tcUE0TFlDODhUTm1wL3FIeWRQd1NvNzlxRnVLdzhuSEFrN3pnY2d4?=
 =?utf-8?B?UHdLakl6TVU4NWhqaE5QUGtOc1JOcDBvK1NnQmxvTE12bFFqZDgvcmRLU2ZP?=
 =?utf-8?B?QjdndGRGbXV0cEVNVlZTS0ovZTdmaHpaZjRkSGNzbkUwamxSR1BySzhVV2ZW?=
 =?utf-8?B?MkcwL21PQlNUWGZDMHRuU2pZV2QrWXk4dDhWSGxHcXdWVlRCVGJvOHN5ZVJ4?=
 =?utf-8?B?dmpYeExjYy9qSkpDNmJZQ1dObjV6U1VkU0ordVo5WktUQ09MLzdWMlV4MzJV?=
 =?utf-8?B?NmxQdWxrRjhQUlBFRlVORmJyS1h6SmRkWWlBL1RNeGMwYnFBOGhxdWJZL0lS?=
 =?utf-8?B?andnZ21wMHN3bmFlQnlyK3ZMaE82WUdxWVhaa2l6RmhIRGlWa2UwVWthSFd3?=
 =?utf-8?B?a2FCaDZJa28wdXVNNUs0YTRqOE5VdzA1WFRzMzVaRVI2SHhCZ0o3bi90aVBv?=
 =?utf-8?B?YWhBSmZkMWtXM2I1Z2hvV1R1TXZKQzU4VEM5QWtWakFLaG1PakN3MEJrMUNR?=
 =?utf-8?B?MnJRdXR1UEJvMUZpM3M5YjRCUlQzamI3VVNZOGpMd1ZGaWgwTFJjdz09?=
X-Exchange-RoutingPolicyChecked: VvzUPYpaS7xgth6EObog1XK4+mWCmp6idkYBkDlrv099m10/Wf/2J4gogV4NXVU/Efr0LpvfddbS29quEgO8cjmam+ZUTNi2C5D3B6MPalnxzCXX5L5LFHXl2FbdCvsgKAQSFprkCNF0XN3nHTGOWQYFGCTW2UcAYmrKWC1yX973Y7GA3UnWEOBiCxCu14qrb6hjX6gAwHjZ/vTxVKUrNlnOZAi0tZmKVraUJrvio46PnqWiIGru+IVUjHO1NPNbgRB3K9nWujls84B/h4qr6cTgVyEQW5M+vzkTFZ/qNezsKvGYcba+Fa+x09SsU7c3IyDeaKfAG9/chsDt3h36AQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 2badebd4-bc2b-431c-e753-08df34d31d29
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5690.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2026 09:09:04.5656 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0aJtK+ZgnTY026oUyPTPC1jFEtGuRgTkIdaApfohCkjyG1LsOdni7mUb6kVIROnoY6QDraThRCyRudSFu9dZ0w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA6PR11MB469167
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
X-Spam-Status: No, score=-17.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,TVD_SPACE_RATIO,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1


On 27-10-2026 11:01, Pranay Samala wrote:
> Update the testlist with newly added tests.
>
> Signed-off-by: Pranay Samala <pranay.samala@intel.com>
Reviewed-by: Karthik B S <karthik.b.s@intel.com>
> ---
>   tests/intel-ci/chamelium-only.testlist | 2 ++
>   1 file changed, 2 insertions(+)
>
> diff --git a/tests/intel-ci/chamelium-only.testlist b/tests/intel-ci/chamelium-only.testlist
> index 6b395e8da..c7d76ab4c 100644
> --- a/tests/intel-ci/chamelium-only.testlist
> +++ b/tests/intel-ci/chamelium-only.testlist
> @@ -97,6 +97,8 @@ igt@kms_chamelium_audio@hdmi-audio-after-suspend
>   igt@kms_chamelium_edid@dp-edid-change-during-suspend
>   igt@kms_chamelium_edid@hdmi-edid-change-during-suspend
>   igt@kms_chamelium_hpd@common-hpd-after-suspend
> +igt@kms_chamelium_hpd@dp-hpd-after-runtime-suspend-d3hot
>   igt@kms_chamelium_hpd@dp-hpd-after-suspend
> +igt@kms_chamelium_hpd@hdmi-hpd-after-runtime-suspend-d3hot
>   igt@kms_chamelium_hpd@hdmi-hpd-after-suspend
>   igt@kms_chamelium_hpd@vga-hpd-after-suspend
