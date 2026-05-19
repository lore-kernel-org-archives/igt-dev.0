Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80B2ACD4F57
	for <igt-dev@archiver.kernel.org>; Tue, 19 May 2026 10:23:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 20C6810EC05;
	Tue, 19 May 2026 10:23:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="e6LKMBhl";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 32DE910EBFD
 for <igt-dev@lists.freedesktop.org>; Tue, 19 May 2026 10:23:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1779186197; x=1810722197;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=18M7GfPruMtb0PLn7lN0TqQ2jeWN/aRek32Y1weGio0=;
 b=e6LKMBhlVlKHSa7MrbLGnBL4VJc2JskJOgrSS6DXw9KiZJTgAWujv51h
 93VbQcPwaPMvVgNpLHtTxJHegq2JoxPF3lJlv3UnVo/Tx4hHlAF1v8yDc
 l94REMW2vpxQlDlm4DtR7LIn+Cykod6RyRbxfyfYhUg977l8dtMJpm9C9
 N3m6p+jgKlQOAMepdGd3AbcPK8xpMPVfog0+bjeGBrwTSSyFULd8z2emu
 kTETxJp/1MMYfp1H/VsOIU3bZSTNB7EOYcyQ++xcD1w0EfXbpg2ODnc1C
 Y+EWXWIwFfZrt3Q97HovwZ0gS6e2pmrk5UsDsL5BtDGr0mZCcnNe1f9cN A==;
X-CSE-ConnectionGUID: HU29V44JQ9e1DzfIUEZUsQ==
X-CSE-MsgGUID: MN2nFDSpRa2Mp4MoORrqlg==
X-IronPort-AV: E=McAfee;i="6800,10657,11790"; a="105520118"
X-IronPort-AV: E=Sophos;i="6.23,243,1770624000"; d="scan'208";a="105520118"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 May 2026 03:23:17 -0700
X-CSE-ConnectionGUID: KLtpUn1CSNuer+turUrH+w==
X-CSE-MsgGUID: k88xRnWFTyukBo4JjagYvw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,243,1770624000"; d="scan'208";a="239783316"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 May 2026 03:23:17 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 19 May 2026 03:23:16 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Tue, 19 May 2026 03:23:15 -0700
Received: from CH4PR04CU002.outbound.protection.outlook.com (40.107.201.42) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 19 May 2026 03:23:15 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=b8P6mZ6+D+iRtK+TqA70Arkgc9P6N2w7+qPA13rT10N7/cDA76U6AHBnZNrnLVCbKo+e3DjKmvZ1ynkldzUxOFQPBNFzCQYx0C/cxLnpZXFQsyHcLwgpG8u4Y0I08mF6mVnw+Ox/1wPbLGiYzIm80d9IgNfENuJcPZzbGeqKGI0cEGrEGY1XO31B9wBhMVz75Crvd69HCDFpyOIc87RHuOivZYZY+lN/Uu7otgpMHZGhm5rydPqsikSx1+7NcA00Oot3y8RnHOYVwnB95SFTOVPT5kbCq6nf0LLihfM96iS5GbjuVNocXzoHZKCsMHNFOpDjzXs0ZlH9RW0UE5dCkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=76et/4nV7HiuVKfYpyMw6Y/gk70BHdav5sKN4m1IzV8=;
 b=EYp1UAlrSxcF8+yR/APDNqZnUCtGwKZD+SseMiOYLOuPgjXhkLLe5zBpzMLAPbQ/Vk0xp2UebCh8j3oAi81Jh8XJ2nrdyi+arbLzB+2I1dnGd+stgErBjY/CXr5DgnyY7rV+Hxq1SdWC+9bERcSqgfSUJKyyR9ITlJHtnDQQBUOMkPGU+n3itQ2hA+LfyeNPQq89StCWFF/km2NytQrJJUsO/jzyzMDy3LUpI4naRKhGTYmCFy1LAAzeXfgboYl0REFBi1nEp1DBfULHZiPMKPetxQGuHMyZGUN/bn7He13EAJagoTVs8lvDns5HOXqrhk5bWVbxCRaBgJAtTMxzlA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CO1PR11MB5057.namprd11.prod.outlook.com (2603:10b6:303:6c::15)
 by MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.14; Tue, 19 May
 2026 10:23:13 +0000
Received: from CO1PR11MB5057.namprd11.prod.outlook.com
 ([fe80::3b75:a8d2:464e:30cc]) by CO1PR11MB5057.namprd11.prod.outlook.com
 ([fe80::3b75:a8d2:464e:30cc%6]) with mapi id 15.21.0025.023; Tue, 19 May 2026
 10:23:12 +0000
Date: Tue, 19 May 2026 10:23:03 +0000
From: Krzysztof Karas <krzysztof.karas@intel.com>
To: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
CC: <igt-dev@lists.freedesktop.org>, <kamil.konieczny@linux.intel.com>,
 <ashutosh.dixit@intel.com>
Subject: Re: [PATCH] tools/igt_power: Fix crash on Xe devices by initializing
 xe_device cache
Message-ID: <u675mrahh45rru46tylndfexvahhnc54te6rducdxyci27fro7@5e2lfrh77ywu>
"Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173,
 80-298 Gdansk - KRS 101882 - NIP 957-07-52-316"
References: <20260518123224.7398-1-sebastian.brzezinka@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <20260518123224.7398-1-sebastian.brzezinka@intel.com>
X-ClientProxiedBy: DUZP191CA0022.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:10:4f9::26) To CO1PR11MB5057.namprd11.prod.outlook.com
 (2603:10b6:303:6c::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB5057:EE_|MN0PR11MB6059:EE_
X-MS-Office365-Filtering-Correlation-Id: 9d456bae-52db-415b-be15-08deb590a155
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|18002099003|22082099003|56012099003|11063799006;
X-Microsoft-Antispam-Message-Info: L5egX5ul8vc7N4RjSJ4vQD9+ZbPe9cHJfg+5Kp8mlsP9mKhwlfVlnU7VzD3mT5gbDAhjPL/q1q9S/zqd5MS9gSL5KRQXlYJtGRcbgOLAdQWNOXATCDMOpk8aiKD5+SekxRv7XsnzrYt45JM6fWkV/5oNIF+hcUPCP7b6if6HWscbz+d2kGCNRDgtxS2IqKAtFHbtYQYykBcf9CZ8WLYqAs/XW3ndp1NVV6FgsAYYCYIJ+A+q3fkukpN4lG6j3gCiTP7+iWyIp7cJ2NASu6bJ3O1AcodNPdTs8qWT66jMmX4PUPuVfRilQDtTuw7MIJXBriQwIxIqEbUngtn/Ml8z7Rq9/VJUVHoSnHAoIGpBCkfpbBWJsS5Zlc0UjMw2FKZVTQs0VoTCnNkJ5d0lJ4TKKZaQ/+Z9YiQ4jgBErlf6xXTUxV/U2ayOrZtAtdziB+5p2/UOv8PmgJw03jjXuL/fwAJLuPCxjehlQUmFTCD2mo6CA+1P7Fdm072OcTEyRR3QWLp2M5K6lzz094q0ct4oRTSd9XV3rkFOjcPts5xameln1dbiCYYyvna087pAu0GDOEI+t8a2xsJGRdGI9Rvjxkt3cpH4Pa5DeXaMLUE6d+mDdYxdbQcBUij5mDq/jyJ5rGThNnQMwKV0b6mnJrZi4Oqk+BKLz0mX1AEdsySe+IEPqA5zCu7HAA9t86mq9T0a
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR11MB5057.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(18002099003)(22082099003)(56012099003)(11063799006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?S1d2ZUt2YWNVNHR6U01XZ3RkMVRsQnVRc0wyZzdNMEtaN0RFcHpiNkIvNU5i?=
 =?utf-8?B?SkhZMk1sbFcvT2gyelIvR0NkYmpZYm11c2lHbW1pNG1kTmtUc2VpYUg4eEJP?=
 =?utf-8?B?cDVDMytRZnVpRWN1dEc4YkxNMWF4TVRqbHdqeTllZHpUbC9aOFlUOW80d2hX?=
 =?utf-8?B?OUtCak9FcWNFVXNWUktCOWFkbDR4S1dPS1JVbE1TamRLSVVqa2kwQzgzQk5M?=
 =?utf-8?B?Rk1XYnlIdmJxL3kyY01oQjNRNkl3TmtYSi9OMGw1cnVzeENyQVd4VTRhL0t2?=
 =?utf-8?B?bTdFU0FNOWVaczRXMm9Nb21MbEtZOVlMbXp4SktmVFZXNU5JNUpuQUU1Ykxt?=
 =?utf-8?B?NUZzbnY2TEJCbUZUZFE1M3BicjRyNnR1U29jSVFPOTJkeVFONXdMcFNtekRV?=
 =?utf-8?B?bTVVZE55dmExSnpNVWRFU3V0UU0ySTJGcTJaVE43VzVzSEN3ZFozc3pxMzVp?=
 =?utf-8?B?U2NEWnptSkdWTjB3SjFHcFRVaW1YOG1pY2RnTjJKb1ZaU3BML3piRmNIN2lt?=
 =?utf-8?B?QWtFMVROSWFIdzFOaGxnaThsRkdnNHhxVEVubjFKL2F6QUNaNDJydVkrN0pP?=
 =?utf-8?B?VlJBQktNR0hCQzlzREl0cjRCUmZPSGc4cGxHc2U0UkwvZjVSVVJ2b3ZkdW1t?=
 =?utf-8?B?ZnpjUUJDNmFtdkplVHRtSzRQQXZ6K3RDOS9pVWwxb3RPbGpxa3N0Nm8vTlpo?=
 =?utf-8?B?eXNXYmZLVDJQSVRtYnJBR3lHNERaVHFZeTRrczhlUTN5U2IwZzljSDc0cW1Z?=
 =?utf-8?B?WllYNGJPV2QxVDA4aXowNDh4TXpsMHdjSWdBRVBNNHdZUWFaS2lQZnRYWExr?=
 =?utf-8?B?aEVkdGx2ZEkrczU2RnpyTXlybmZXbHA3cnZ3RVoybnB3bE1Fa05mUE0yTlNk?=
 =?utf-8?B?NjU4bGlaV1UvaE1QYUQ0ZExpdWdBWVk4cjV0bGw4Q0RSL2MvZVBuUGZDUWVl?=
 =?utf-8?B?b3lzSktJSU1zTUVIVkNrcURjOEFVQUtmZkRhWS9tQzkwUE5MQXZJb3YrY3dU?=
 =?utf-8?B?QzlRcHRxMUZqZVBBNmRRZzcya01aSXNRd25PeUpYMTJuWkpWa3g0b3IyZE9h?=
 =?utf-8?B?RUVTUFJ5alJ2bmFneDM2Z294c3hZOURJQUdNaSs3Z0sxZDBZQ0ZMS0lOSElC?=
 =?utf-8?B?K0FZbEJGL3BEUXd6dEVQS0l0aTdTMi9IU2pGZkdzTitRS3B2ci9XWVhTWGZF?=
 =?utf-8?B?RnNMWXhCN01PMDV2bWd6VnhVbENNM08rZ0JQeHlxK0NpSGpUaGRIWk9zWEtD?=
 =?utf-8?B?dENGWFFDN0g1eU9lQnRHY21nS2kzUG5XcmgwVGhsSnhPQ0JyWEVtckZPTno1?=
 =?utf-8?B?eXJTYWpiVmExY1puYjZxTHByS0ZZZy9VZDRPMVlMTVRsU3J0Wk9iSGNWbFkz?=
 =?utf-8?B?Rjgvckh2WWQrejdLZTVUWVJXcVFkL3Q0MUo0NG1NRElKVlVka1I5RFE1b3Vs?=
 =?utf-8?B?eUdtYXRWTFdIdTZ2SDVqbWZVS3R4S2NmVkl0VnZxem9DQklqWjUzWUV3S2x2?=
 =?utf-8?B?QjIwSjFyWDlzZGRQY01QUEVsWFc5U1lnTUlIVjZXRmNDdVhpenNWQjZmUGMy?=
 =?utf-8?B?QkpTblZvUWUvM2Z3TDRPNHZaNTVsQ1MzTUZBWkYrSDhTS0NHbTJsREVIdys2?=
 =?utf-8?B?aExTOXdxQlBCSzJGMEdnUThzSU5TWUdOM1FtaDcweVBkbHNONVRCbkwreGNv?=
 =?utf-8?B?eHdlNjVUWnc3S0FLTTh1ZEdFSzJ4VmU5RWRwZ3NhVU1LWGFCOGhjMk9XdnVS?=
 =?utf-8?B?T1N1V2VoLzVsdFZQSEJvOC9QYlJybytoK3B1YnROc2NZM0xNaEx2SEVOR1hl?=
 =?utf-8?B?cTdrY1UwV1dFRDVLdGdLNWgrcEJiV2I3MzAvNGFVdmRURmNRSW9jRlA0Yll5?=
 =?utf-8?B?dFJ5b3FCV3lkK29kQnRYdDRpRGV2WnZVSWVWZ1pSdDc2dEpjcUV1OGYyRmV3?=
 =?utf-8?B?dHN1N2tCMzdOVzJwN21QcFROUE1zQ1VMZEZmUFNESEQ2c2FaODB1SHdqYk9v?=
 =?utf-8?B?enFDMVIwTUFFR1A0ajZqamJqQ0tDTkVhSkJKdG1ZYlA1anJmdkFLR3oxVTBP?=
 =?utf-8?B?SDZXVjJnbVN2bVB6TmtabmlVQUdqQzdWRzRyVEVEbWxvb3N4S3Jqa1N2bTht?=
 =?utf-8?B?aTBYQnk3NlQ0ZnlLRWVIMUJiYlgvMlp4U3g3dnYvZDlqUiticGNyUEhxQXph?=
 =?utf-8?B?UDBScGdpblJnQ1hiSzUveXpVTU1jZ2Q2STJmZEhOYThCdFdYczhBMW96cnVY?=
 =?utf-8?B?ZHIrK3c5a0RLN0x5a0RBVjdUWmF0OHRqWXZsUUNXMzRPbnpvZndGdkdhYmxD?=
 =?utf-8?B?UWtodWc0dkwwbXM5cWJLOVJhVFFrZSt1cHlCeHdnVEhOQmxoTW1sR3g2clE4?=
 =?utf-8?Q?S49zjV94odV0C4cM=3D?=
X-Exchange-RoutingPolicyChecked: oDReehbNj2oVDj0bVp1JNslD4s8BpcxK9iVrbY8M2ZU5GKNrp4P5/Wje2u3aU2uTUsH+6KhTf3DcbkXy1qEPqFHdnjuhdF0fr+bsyWM6ZwHh0R4QXMyIWeLyISWa0IWGOzXVYwTWEqKp8KOfg9b4IzigFuxAeqprtH+bxFFMHflBw3W7DGRRpQj8yqJXUg7r2Q3EHS2ONCw59g7o6Qjof+AMJCfJG+U/2RECNUmhDFK2fiXy6nfzK33KCj3hkftxz1C+OWCcZMtB1tGxiakmwuhMoCtsy2H1e3HCV6+r0nScUzvCqJYTYM3u+9cSyo8V4t9RDnM+GFZ5h1XaemKdBQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 9d456bae-52db-415b-be15-08deb590a155
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5057.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 May 2026 10:23:12.1597 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cgVNIvUjb0jPI9bnab2SpkgmPNT7VMDm1TbcaWfUJgaVidLz7R1wvpNfBFZHTRYdQrrkTAK7ip9SAr94jqdAzwX27grSkOM6keCVTc+sKiQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR11MB6059
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

Hi Sebastian,

[...]

> @@ -38,12 +39,15 @@ static bool prepare(struct measurement *m)
>  		int ret, fd = -1;
>  
>  		if (m->drm_device) {
> -			fd = open(m->drm_device, O_RDONLY);
> +			fd = open(m->drm_device, O_RDWR);
>  			if (fd < 0) {
>  				fprintf(stderr, "Unable to open drm device %s (%d)\n",
>  					m->drm_device, -errno);
>  				return false;
>  			}
> +
> +			if (is_xe_device(fd))
> +				xe_device_get(fd);
>  		}
>  
>  		ret = igt_power_open(fd, &m->power, m->rapl_domain);
> @@ -54,12 +58,20 @@ static bool prepare(struct measurement *m)
>  			else
>  				fprintf(stderr, "Unable to open rapl domain %s (%d)\n",
>  					m->rapl_domain, ret);
> -			close(fd);
> +			if (fd >= 0) {
> +				if (is_xe_device(fd))
> +					xe_device_put(fd);
> +				close(fd);
> +			}
>  
>  			return false;
>  		}
>  
> -		close(fd);
> +		if (fd >= 0) {
> +			if (is_xe_device(fd))
> +				xe_device_put(fd);
> +			close(fd);
> +		}
>  	}
>  
>  	return true;
> -- 
> 2.53.0
> 
These changes follow a known Xe get/put pattern, so I do not
have anything against them:

Reviewed-by: Krzysztof Karas <krzysztof.karas@intel.com>

On a side note: did you notice any similar places where this
could be missing? I do not think more changes should be added
to this patch, but maybe there are more bugs like this and you
already know how to fix them :)

-- 
Best Regards,
Krzysztof
