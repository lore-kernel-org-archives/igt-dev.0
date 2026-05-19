Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC71BCD4F3C
	for <igt-dev@archiver.kernel.org>; Tue, 19 May 2026 05:00:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 75C8610E121;
	Tue, 19 May 2026 05:00:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kHSRGb7F";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 610AC10EA5E
 for <igt-dev@lists.freedesktop.org>; Tue, 19 May 2026 05:00:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1779166823; x=1810702823;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=Qv07alQVbj1R0rRsMR4ZhqM6ZA1EYN56cb0PgU+PPVM=;
 b=kHSRGb7FcVKP8iP4karJOq7W/kSWe0EiPQa3g3Mqet1+c9inyxZu5BTZ
 Xqm0ajG/4rOluRcC+kyOQ2XrFnIyCX7JiMAgkraQ1DjCuV9hpZrsnGkx1
 WSSWrF6w6UgE9XSYY/WEsDHAiY9RTpgBYPwhh16Q6LkJZO8YBNJGChWpw
 QmzP/7NNDTpfCnC5pOz+HN4f0keLmArpo0ftjZx/KkaILDV9McuEhinkc
 4w5PS0D7gnT09N2bJ2BnyEjWQpwV5Qn/DCkPB2u552+ooSm3UJ/Z6RGwC
 27+1flqgJT6m8LCETPQBpLsRnrFtfI7vsERJ+FZ9G+ZGc9JLhsxjo464t Q==;
X-CSE-ConnectionGUID: wmm4yOMwRieHEEJ2jRjYnw==
X-CSE-MsgGUID: VYyX16t1RoypgAMhz25o1w==
X-IronPort-AV: E=McAfee;i="6800,10657,11790"; a="83650637"
X-IronPort-AV: E=Sophos;i="6.23,243,1770624000"; d="scan'208";a="83650637"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 May 2026 22:00:22 -0700
X-CSE-ConnectionGUID: Rpl2WqTTSUaa34yVzYKcPw==
X-CSE-MsgGUID: y2N7uTH3Si628XFtHbRC8A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,243,1770624000"; d="scan'208";a="235203898"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 May 2026 22:00:22 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 18 May 2026 22:00:00 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Mon, 18 May 2026 22:00:00 -0700
Received: from BN8PR05CU002.outbound.protection.outlook.com (52.101.57.57) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 18 May 2026 22:00:00 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=naOmYglbBOVE//44THzTjCXlzsMHFj96cFpa3h/qSk6cvwLNurV39adi0hPlP8MfzUsVVPb0jhJlp1VPzCSkbEFUpOX8FqS3kkhzh10zLJs/mwOPKXlCxIlFtp+22vggrP3FsNwKr0OPEaNkpPB88QWThamAkC4zHF1dQLwLKZRJWMRmj/HX5y+wZqsT8On4k3c2y4DCI8XvCjFBRqV0gv1kqYl4zHMt1R4TxsLG2XY5SgyIwg6+JY3TM5EYIFFYexI6bVJK5u6KQMGykyP0BEB67tK/eOM6er0IT/XbBc4/NauE76SpH26UESIlDXcOveJRK9avKQ6bRjOkYloK+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hYODHzWPH8F0tg9o8aIKyaWBFVlysXhvUyjBR8D64YQ=;
 b=Obl3i0+7weWEl5wb80n1u0wzz5pJ9miNnFQq9i9S90eEm9G6d/Er2ur+4PxTIKgcU9rkD1yVIB0N4dN2KANae+d1t08oVkSujZ5iR2t9iz7mCvuq8MqQq4HWvL2qOjNPkiWSKxx6TzVVZs6SumODuv39QZAlRSAnhxmjJ95jvdoH1yyJEXbTBBWKubZsFICW1sEucReUaoCrOclVKKoyXw/0t8KUA7wCqpLOkRtRTMbeIzOAtIF3a1HIBPFHqQU/qRMlYKUybkbU5JM5GOp8ZQe0rS3wF33AVT130lNl9AWb3Jaal1yZn0WW5xqIS3je94LUs3fvd2Il3vShDoJ71g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5309.namprd11.prod.outlook.com (2603:10b6:5:390::5) by
 BN9PR11MB5292.namprd11.prod.outlook.com (2603:10b6:408:119::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.25.21; Tue, 19 May
 2026 04:59:53 +0000
Received: from DM4PR11MB5309.namprd11.prod.outlook.com
 ([fe80::89e3:7ceb:6511:dd36]) by DM4PR11MB5309.namprd11.prod.outlook.com
 ([fe80::89e3:7ceb:6511:dd36%4]) with mapi id 15.20.9913.009; Tue, 19 May 2026
 04:59:53 +0000
Message-ID: <5fbf6329-3bc1-40de-bb5f-1bd8ddb73f80@intel.com>
Date: Tue, 19 May 2026 10:29:43 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v2] tests/kms_content_protection: clamp plane
 src/dst to output mode
To: Suraj Kandpal <suraj.kandpal@intel.com>, <igt-dev@lists.freedesktop.org>
CC: <swati2.sharma@intel.com>, Jason-JH Lin <jason-jh.lin@mediatek.com>
References: <20260519045736.1098558-1-suraj.kandpal@intel.com>
Content-Language: en-US
From: "Reddy Guddati, Santhosh" <santhosh.reddy.guddati@intel.com>
In-Reply-To: <20260519045736.1098558-1-suraj.kandpal@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0083.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:ae::9) To DM4PR11MB5309.namprd11.prod.outlook.com
 (2603:10b6:5:390::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5309:EE_|BN9PR11MB5292:EE_
X-MS-Office365-Filtering-Correlation-Id: 49295866-9323-4066-5e3a-08deb563767f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|22082099003|56012099003|18002099003|3023799003|11063799003;
X-Microsoft-Antispam-Message-Info: og2gD8XscMYAAKNCThxsxZOJMfQC12KxC2JNYKoAmbTjtvPiKfiBdD+Ql4MshEn/38vu2aeeGfHTAFLHDnXkGFuLRZAf/+/F/enf+SxMcXQtZKIOiyBcKkeoBXSL7ZVFZWvH0H4bBhMsdPeRXj2gD7AvuNAdb17PiLTeZy11TEYsbTjEXHmJhxdVhOdVCJM+p/5vZhLYBhtoTm155qjph+67zcwajyOhLEl/oILnjPJLJBek7Whg43MNb4BmXWGYOlDE05CZF6Am0ionsFGi+PvUo9ViN1lOxEUS+G9WZxZwT9biymeuJE6sl5WBqogyTO1KWt2NhC8FMV8tHrZ5nIJo5MT1TYiosfUhknisb4hnediIiCFC5c3jZzOgreFsxkitb9vgZWm/BjBETtDhEauoSnpY+uaMHpZit6Coj+TBxBtOb04L8/by6kQBVbtezB9vS8nXlkEfyWWKv9hz+106QdBteR7o3JITVboXoG5Bxei3xOKJB0BKmjiK+YSkCja2+Hm8Rf62gfVKxX66SkdwoZ+SFZy1TzATyJrLL5vwyHzWGk3qz5YWn46eNrds2ochWyKxtWpKOhOiP74j0a+uKlU2fUlSrO4C1MQXw1X+E5wFAJF5FZBkCkkxq+gNZ3A0XDQYn4q+NGfXOAXIXcDWMPfEx1CwzDBss0GqkqrGfyhInn3DP0TW9irw4P5Y
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5309.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(22082099003)(56012099003)(18002099003)(3023799003)(11063799003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bjFUc2VNRHBqeUFwM29BdjMramswS3NUUW1Ja01oQUNoaFJtUFhjYXpPZnR3?=
 =?utf-8?B?RDlnZitNVUZmOUozNFlQanlDYWJNaVJta095VDVRZ05sMkwyZzdBQnR6anJ1?=
 =?utf-8?B?Tlc2MlBMNlRuTndyWEZLYzI1SkxZeHZBL2VCaVJyazRxV3BPcGdWbUZhVlFK?=
 =?utf-8?B?WGpzMHdNeDFibTlqRUJJREZ2SlZqTlRJS3NkdlczbWRDeThGYWRoRStyMWpR?=
 =?utf-8?B?QlBJczN2MWN0dzdpYzJEWWtIbG9FTllWT1llMnpqbU1XUXVlVEh5cGFHR2xZ?=
 =?utf-8?B?eVZNK3I1dEhMN29BcjRqWndwS1AxelYybjRWcUppejVlY1lmUUVMbVdaWEtV?=
 =?utf-8?B?M2xOaCtXcXRmZ3JLMk5QSUZ6TWN3WTZzOHc3RVBGREZCM3J6SXhRY1E1V1l4?=
 =?utf-8?B?UzI5cXllZ2RhK0trYUR2UEY0enV2RmF1Z3FjbjB4SXMyb0g1MktVSWc2WUlr?=
 =?utf-8?B?WERmOERnMG5VSWh3RUtHVDFvaWVFNW9jUG1yVTE2NVd6dlBqaFFZVXVmWi90?=
 =?utf-8?B?L1B5NDBMbDR3WHlNSEJENkdjRnFkQ0VMeStEVzlDa2R0N1BDZlQ0c3NrbmNN?=
 =?utf-8?B?L0VwVDNOU29LckZRTCs3YWNLVDFuL1NCbXhUQU9VWWJvVUlXWHVqQ01jeTFn?=
 =?utf-8?B?ZnZ5cDBrMEtKMTgrN0xXNDRlL1VxcUJhYXhSeElUdG1xVVM1a1N4SGRFaHcy?=
 =?utf-8?B?Tk1pWFRVbHRlNkdrSFdabVVySVgwT0V1aWdrcHIwSWpROXd0dERNZE1ST1p5?=
 =?utf-8?B?akw5eSswSWltay9SOTF4OFljWjdMaUVYM2FxNk9LcUI4UHIxN3JVRm5SUXhx?=
 =?utf-8?B?ZDArV0NJUmYzV0xLNkhDVDZKUlJYWW1ta3NvdDNMcDFUUlA3RFhkM2RHTkVn?=
 =?utf-8?B?SHFWVzU2MDloUFRqeitZSlZFdXB2MmNyRnFPT3JKQjhBU0RQb0Y5UUtqejBJ?=
 =?utf-8?B?WC9uQ3pWWnN1OTA0UVR6bitVVVh0WjBQTVBTS1lPS2I4U3hrSE1jKzhHMlky?=
 =?utf-8?B?K2FQU3o3TGI4K2c4QkZjSkJscWFtTjlYRGY3elhvNzBMMGtSVmU5cFlwanY5?=
 =?utf-8?B?Y0JjMjZrZmlzdmZRYWR2WllpUjVTU3N0V2I5UWFhUjYveW5oYlJVTTdjV2w3?=
 =?utf-8?B?Y2xnVGQ1eTVSRWwvbjgvVU5HYmcvWDQrS0tMVldsbG9PVzFjY2I3QjkzU0dV?=
 =?utf-8?B?ejNGRGJOVjUrL2lWbEh1VnhWZkhPZ2dzSXFkSEk3a282cFdGVkw0UkhZVzRP?=
 =?utf-8?B?SVRrUkQxelMvVm9BWlJ4NE5EWVV3ZCs0VmZQNEIwU3YrZ1k4UVI3QjV5aTJU?=
 =?utf-8?B?NDdCSGNwN2d4RW5wN0k5OE1TMHdVa3Z1cWQzTXlWTENTS1pOay9OeklqZHdr?=
 =?utf-8?B?UytBeXc3Q1ROTEt6WkNDZis3ejc0aU5qQ29MVDZOYjFQM3dkS2lsUXJEV0xG?=
 =?utf-8?B?dEhsQmhoc0dnM2lyWk1ZaTZHZWxHNlpxd2lpczJ0TGhVVzdYWEgvZG9EVFoy?=
 =?utf-8?B?R05WcXo3UEg0YnZreWZKUUJubTI4MWM0eTc4RDVZV004TExhSW5QeE9mRUJi?=
 =?utf-8?B?M0dtRUw3MVh2ZGw4dnRhdjZndFY0T0FYakx4WUNoK2s0dytLNW5sUURUdHZC?=
 =?utf-8?B?bUtWQ0J2ZVpmY2IzV2k0Zk8vSnFHRGRNZllKZnpQbVg4eWg3VTBhaEtIaFdq?=
 =?utf-8?B?a2t0Wm5kRjBYd25YMkZXR21zeVVVTVRXZExuVitDVkplalE3cHFaTnhZMCtT?=
 =?utf-8?B?aEhyMU5HQ3F5TFkyZ1hnNGorNitJdS9uVjZnN1MvSkhIN2d0a210V2VrYkcw?=
 =?utf-8?B?OVpMMVBQRWp0NDgrRDRjeEtWVEZFL24vYnVDSkI2YmlBZXFNc0g1V1RQSmhm?=
 =?utf-8?B?d0psRHhINks1UEJReXFhS2lzRGxweWdObWZqTnlYWjJvMWVnRzFyYmNhSXhG?=
 =?utf-8?B?SWpzRHlvdDQrTFdRYnExbmNxUWdrVlFSNDFHSEt0NnhVSFgrdGVvbzZFSVhy?=
 =?utf-8?B?REd0Ti9zdWw2ZkpKUlkrTFIwUFJZcTlyR1l2RTdCcFNWTWJraGJad0thYTVq?=
 =?utf-8?B?YXVGNDI5NUxmRjVFUWJqZFhxeSt0WTJodjJ6WWdzcHQ0YXBwOWpsNGFCdVhm?=
 =?utf-8?B?clVkeWRDcXh0SXJYMFQ0WDUySW5XVVdaZ1V5cVRUMFBZbGpHV29tNUxRMWd6?=
 =?utf-8?B?NUpvblg2TTRUb1hBdGxWVHVCMy9OZENia3Qva1NvQ3laMGhIYk9rZ1pIazJm?=
 =?utf-8?B?TGhCekd5UGtLWjV0TjJaN0hFVlcvRHpXRWR3OVJSbldtTzVVMEN4eEVTbUZi?=
 =?utf-8?B?bi9JcUZYUk93TnVLaEhRb2NsSC9HclFMRExacDE5ZFJYWE5UdmhWQnhzT2NI?=
 =?utf-8?Q?8EBk7ThhF/BxRlrY=3D?=
X-Exchange-RoutingPolicyChecked: g0X034nEZ8z/B/L3RBMTlwr6pSfnu7TnYfnTWvlXSL8e1McANsTGgT6H1RuKcRv5zbMjEFuGSLFRlY362Y7qQdhyIi5fBaXeLKV6GKErZWEGWxoLcBwqREyccsQhWqLQDqncd7srTnmCFUi3APorRiAAumIKa/M+NBNHGDC9H+4aI0z+P92zAJVWDaPRpddh7IOeTBkYk80ayGW4jh9skPOYu5k7KBomzFb7/pZPhe9B7fVDytqiVTBAZes/5wKDQ35PBNYHEEISa+50DoHPBn3maBqeFDGZDi/+RAwbg2Sqy+zk8eNJHyxLXPZswJgc3bBq5QkRo/wCzQMNg6205w==
X-MS-Exchange-CrossTenant-Network-Message-Id: 49295866-9323-4066-5e3a-08deb563767f
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5309.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 May 2026 04:59:53.1364 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: B+ky+5rCxgPBE3GQBoQZpLoMRUqlD/3EvPUMyCu5pCU6m6wsI3ZySMx7nXkZ/d7zCXo6DxG9PQmH5UebBJOfdDgUL06dLbUcfGDT5sXjq+unpNpauXDeXBKIugpPXu5w
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR11MB5292
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



On 19-05-2026 10:27, Suraj Kandpal wrote:
> create_fbs() sizes the shared red/green FBs to the max width and
> height across all connected outputs. With panels of differing native
> resolutions (e.g. 3504x2190 and 3840x2160), the FB ends up larger than
> at least one panel in some dimension. igt_plane_set_fb() resets the
> plane src and dst rectangles to the full FB size, so subsequent
> commits submit a source rect that exceeds the CRTC active area and
> atomic check rejects them with -EINVAL before HDCP authentication can
> start.
> 
> Clamp the plane source (igt_fb_set_size) and destination
> (igt_plane_set_size) to the output's current mode after every
> igt_plane_set_fb() in modeset_with_fb(), test_cp_enable(),
> test_cp_disable() and test_mst_cp_disable().
> 
> Tested-by: Jason-JH Lin <jason-jh.lin@mediatek.com>
> Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
Reviewed-by: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>

> ---
>   tests/kms_content_protection.c | 29 ++++++++++++++++++++++++++++-
>   1 file changed, 28 insertions(+), 1 deletion(-)
> 
> diff --git a/tests/kms_content_protection.c b/tests/kms_content_protection.c
> index c59441f11..d1b7c5863 100644
> --- a/tests/kms_content_protection.c
> +++ b/tests/kms_content_protection.c
> @@ -264,16 +264,22 @@ static void modeset_with_fb(igt_output_t *output,
>   	igt_display_t *display = &data.display;
>   	drmModeModeInfo *mode;
>   	igt_plane_t *primary;
> +	int width, height;
>   
>   	mode = igt_output_get_mode(output);
> +	width = mode->hdisplay;
> +	height = mode->vdisplay;
>   
>   	primary = igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
>   	igt_plane_set_fb(primary, &data.red);
> -	igt_fb_set_size(&data.red, primary, mode->hdisplay, mode->vdisplay);
> +	igt_fb_set_size(&data.red, primary, width, height);
> +	igt_plane_set_size(primary, width, height);
>   
>   	igt_display_commit2(display, commit_style);
>   
>   	igt_plane_set_fb(primary, &data.green);
> +	igt_fb_set_size(&data.green, primary, width, height);
> +	igt_plane_set_size(primary, width, height);
>   
>   	/* Wait for Flip completion before starting the HDCP authentication */
>   	commit_display_and_wait_for_flip(commit_style);
> @@ -284,6 +290,8 @@ static bool test_cp_enable(igt_output_t *output, enum igt_commit_style commit_st
>   {
>   	igt_display_t *display = &data.display;
>   	igt_plane_t *primary;
> +	drmModeModeInfo *mode;
> +	int width, height;
>   	bool ret;
>   
>   	primary = igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
> @@ -302,7 +310,12 @@ static bool test_cp_enable(igt_output_t *output, enum igt_commit_style commit_st
>   	ret = wait_for_prop_value(output, CP_ENABLED,
>   				  KERNEL_AUTH_TIME_ALLOWED_MSEC);
>   	if (ret) {
> +		mode = igt_output_get_mode(output);
> +		width = mode->hdisplay;
> +		height = mode->vdisplay;
>   		igt_plane_set_fb(primary, &data.green);
> +		igt_plane_set_size(primary, width, height);
> +		igt_fb_set_size(&data.green, primary, width, height);
>   		igt_display_commit2(display, commit_style);
>   	}
>   
> @@ -315,13 +328,20 @@ static void test_mst_cp_disable(igt_output_t *hdcp_mst_output[],
>   {
>   	igt_display_t *display = &data.display;
>   	igt_plane_t *primary;
> +	drmModeModeInfo *mode;
> +	int width, height;
>   	bool ret;
>   	int count;
>   	u64 val;
>   
>   	for (count = 0; count < valid_outputs; count++) {
>   		primary = igt_output_get_plane_type(hdcp_mst_output[count], DRM_PLANE_TYPE_PRIMARY);
> +		mode = igt_output_get_mode(hdcp_mst_output[count]);
> +		width = mode->hdisplay;
> +		height = mode->vdisplay;
>   		igt_plane_set_fb(primary, &data.red);
> +		igt_fb_set_size(&data.red, primary, width, height);
> +		igt_plane_set_size(primary, width, height);
>   		igt_output_set_prop_value(hdcp_mst_output[count], IGT_CONNECTOR_CONTENT_PROTECTION,
>   					  CP_UNDESIRED);
>   	}
> @@ -343,10 +363,15 @@ static void test_cp_disable(igt_output_t *output, enum igt_commit_style commit_s
>   {
>   	igt_display_t *display = &data.display;
>   	igt_plane_t *primary;
> +	drmModeModeInfo *mode;
> +	int width, height;
>   	bool ret;
>   
>   	primary = igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
>   
> +	mode = igt_output_get_mode(output);
> +	width = mode->hdisplay;
> +	height = mode->vdisplay;
>   	/*
>   	 * Even on HDCP enable failed scenario, IGT should exit leaving the
>   	 * "content protection" at "UNDESIRED".
> @@ -354,6 +379,8 @@ static void test_cp_disable(igt_output_t *output, enum igt_commit_style commit_s
>   	igt_output_set_prop_value(output, IGT_CONNECTOR_CONTENT_PROTECTION,
>   				  CP_UNDESIRED);
>   	igt_plane_set_fb(primary, &data.red);
> +	igt_plane_set_size(primary, width, height);
> +	igt_fb_set_size(&data.red, primary, width, height);
>   	igt_display_commit2(display, commit_style);
>   
>   	/* Wait for HDCP to be disabled, before crtc off */

