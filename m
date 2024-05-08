Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7A3FC04FFE
	for <igt-dev@archiver.kernel.org>; Wed,  8 May 2024 19:01:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B30711318E;
	Wed,  8 May 2024 19:01:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GnN0UW6c";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B4E6113187
 for <igt-dev@lists.freedesktop.org>; Wed,  8 May 2024 19:01:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715194883; x=1746730883;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=rNIPdCajPXLAvvpS+IQRgOQHYgB29xiXzSWtg+AtIjc=;
 b=GnN0UW6cxvk/uro8lJJKHPWb37y768To/JDYfyXRs5yfabwZX3HWAg4H
 bqpF9E+EE6VIVCmDSHt8TJFTjATKR4FtUnVHcaR3x2X0trqLYmMd6RKDQ
 MQRvtsVc9H8ojNgCPd6IKrUvLpi7SQgegSLK7gR6H/KBT/DXM5/Xh5azX
 zRIowSERJI43u59Xwa4sv8EWn4jKcq5/V1Dd8SvFneovxIoVpUL29lyxt
 onJJoSq+NbzN3GhsGcK3b8/l5rfnESR2YoeeS8XUMjoIda8nV0oakYrP7
 wlnQYZuM/BsJ8ZnafV8UYVUT8gpR1H10+2NswDFA5ZdJCpwHf5ItZBjoj g==;
X-CSE-ConnectionGUID: dznSzQlJT6iu4aMXJJS1Ww==
X-CSE-MsgGUID: 4iAGxQ/NS8G+AtMwu6EmBg==
X-IronPort-AV: E=McAfee;i="6600,9927,11067"; a="11432968"
X-IronPort-AV: E=Sophos;i="6.08,145,1712646000"; d="scan'208";a="11432968"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 May 2024 12:01:22 -0700
X-CSE-ConnectionGUID: ei7qN2fcS3yftiT4Mdtf9Q==
X-CSE-MsgGUID: 3ZVrhWQlReqyRY6WNbaxKg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,145,1712646000"; d="scan'208";a="29512228"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orviesa007.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 08 May 2024 12:01:22 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 8 May 2024 12:01:21 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 8 May 2024 12:01:20 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 8 May 2024 12:01:20 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.168)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 8 May 2024 12:01:20 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UpSfBoxqr8sF5x+I9eMbCx7Jf4pQPpE/RmPff1KcMGfSkuuaWF0cxbx8jPCfOMKxfSy5wFzKj4P5F1qHPV+Vt4BWHPl8stEzDqA+2FBl2atZk50oJRAfz2VV4UX0OJorXT16T9iiW3SotsbcxNPqoZBR/xgt0eVmBhPS/sCV/QWjpnWAPzqp0jClZkasQI3rLxgUlCJcHSDnjPb5WSNlm02FsbU3NsQg0DswRFLG1eWN2Adg5SOTweD/GEJjr3rwSihS5maPzcFDAMa1ZU5VsdOjitxTSWS0oFlWh+nKyXzabwe96CayuPoxAt8HzHDHYekEBHyq7Q6D/a2VcDgwLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gmQVmrCftmwVO3qnNKx+ZVpQEx3eg7pdubqD4L2PK/8=;
 b=oDBY5auuJxqtW2ofOpK7EfNhiRYIB7tF/EOX7Brt+DdapRo1L9IpBHdca8o61Mvyp2We8VPZ/uqOaYwK4YgFT+Sm+aRG4cYONWpRlzgNNko7cxzXfAxCLnLES3mME2rGp2QpuCTqHmOfYGQVltUKpcjtMKrtk4VLlIXZLaaMV/W4Ogvm1MB/I7Lnlv4aSDS9jUfgl9xQzR4cBlIN5xCBYFK4TMpG7Y+vngBhibjk/APawC4im61T4oGlRhV2hb8DT8i9LCt+va3mS86sF+3Lcw6pC3ApSdF6J3TwTb7RRGRlUSMbedpLR9WroJBR3se+3aFJD7JALlra/22vZC9PSw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7408.namprd11.prod.outlook.com (2603:10b6:8:136::15)
 by SA0PR11MB4718.namprd11.prod.outlook.com (2603:10b6:806:98::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.46; Wed, 8 May
 2024 19:01:16 +0000
Received: from DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::24f2:8bf0:3dbd:dc8c]) by DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::24f2:8bf0:3dbd:dc8c%3]) with mapi id 15.20.7544.041; Wed, 8 May 2024
 19:01:16 +0000
Date: Wed, 8 May 2024 12:01:09 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
CC: <igt-dev@lists.freedesktop.org>, Tvrtko Ursulin <tursulin@ursulin.net>
Subject: Re: [PATCH i-g-t v3 12/13] lib/igt_drm_clients: Record total cycles
Message-ID: <ZjvL9YI1889za0qT@orsosgc001>
References: <20240504064643.25863-1-lucas.demarchi@intel.com>
 <20240504064643.25863-13-lucas.demarchi@intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
In-Reply-To: <20240504064643.25863-13-lucas.demarchi@intel.com>
X-ClientProxiedBy: MW4PR03CA0220.namprd03.prod.outlook.com
 (2603:10b6:303:b9::15) To DS0PR11MB7408.namprd11.prod.outlook.com
 (2603:10b6:8:136::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7408:EE_|SA0PR11MB4718:EE_
X-MS-Office365-Filtering-Correlation-Id: 0f3b78c3-db55-490d-3543-08dc6f913d07
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|376005|366007|1800799015;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MVZHTHVoWTdMSzIvZUF2YlVBVDdYQjhEYWRyY09kRUM2ZWd2emlMbXFmblV1?=
 =?utf-8?B?cFBhS2Q3SGRBb3B4dHR2Zmo3N3J6dUhmNUtkVGVXRHpIVmRwSkQyZmFIcVdV?=
 =?utf-8?B?ZDBqQTJ6OG5QK09RNFUveXdSd1NqUTZoRml1UlEzV1dmbzRzTHVjZHNLODh1?=
 =?utf-8?B?SkxuR08wM0N4OVB5ODYvNjRVK3BSc2xjNWU3bmFmSDFVQktndE9PTTNvb0h0?=
 =?utf-8?B?WUV0cVJlb3BPaEZlMnRBSzllNlQwYkxTUGt3V0toLzl5Ui81N0c2WmwxTlBR?=
 =?utf-8?B?ZEZuSTZidXdQU2FrT0o4UXZuZ2ErZVFlYTBqMGxyd1p2ZHR1aFF6T1Ewamtl?=
 =?utf-8?B?Njg1d05HRFpNUWIyc0FWcVQyWGh1S09Udk5qNVdEL0s5dnNJWXE0L0h6RWhv?=
 =?utf-8?B?c2lwV1hwZmpqaHd3U2pNc0NLZU9wNE1jSTk1bmhtdW5BTGxkU1pHcHByRjFn?=
 =?utf-8?B?dXhlMU1nQWhtTTFLOGZmYjFlQ0wwdUFyc1BNZkp5VUxCSnFBaXcxSVZhVUdJ?=
 =?utf-8?B?S2FxM0YyZTFqL01uK09PMGRDSGR6SjZvQkxHK2lmbWJXWGUvUFE2Z1d0dEIx?=
 =?utf-8?B?aVV3cDdsdlpkWnlDbWF4NXFUT0JtNFJyeEliaThQVnRUSDFsTGRtZURvQlJj?=
 =?utf-8?B?RUVOZmN4eGMzM1lLaE5sWnFwalFFUGlNWkw5MlI4Uys5aklOMFpBNHFqUWZH?=
 =?utf-8?B?M3ZweHJwaTh5MGF5N2FIazhZNHE4UnFReW5IbmFXWEd4bjlHb1gxR3NZdG95?=
 =?utf-8?B?K0w5MVc4cyt1a3NzbVJrSGw5eWlvRjFmM1g3U3B0bTV2U1dZTEx0OU1ZZnNQ?=
 =?utf-8?B?aFJqaVhZSlhPUmQwZmloTDA3ZEhVU0Z2U0NOWVBlR2dlanZrcWw0SHpMcEhW?=
 =?utf-8?B?N1RCR2tBSG0vM1FVL2NabG4weXNzMnV2MGcrajNKUktHTnlONjZGa0oxS2ZR?=
 =?utf-8?B?MjhZWkFlV0ExcDFUaWtIWU1EK0h0NXc4UDBqbUJpdHBaTDV3OGFTYzJoeTh6?=
 =?utf-8?B?SDRRTnhsMTB0MEtVNHlIWnNTMzM2RTBYdGNsUkt5NFRSNlhXTXlvS21Oakhp?=
 =?utf-8?B?UU9vcnRyMHNwYkNZTWowV21tY2ZmMHI5T1pvTXYzcEJKR0dSU3NzSTBXN1BO?=
 =?utf-8?B?YXdJcSt6VGVIc2hmYnIyR2hNZkczby9WN2VyNmtkK0xxbkMxZklXeFlXb2xD?=
 =?utf-8?B?NTNpZFIzbW1aK0JRR3J6M2NJL1c2c0p4SzVqNUJKMTAzWWRjaEFHRDJoeHlj?=
 =?utf-8?B?ZXdOTTJQbVpzZHVIcVJvSXNmVGFTYW8yMHlwUDFMUVUvN21lU2ZDemhWYk9n?=
 =?utf-8?B?WXZGWERoN3pnYlJjcjdyT1FPNDhla1VQbUVEeldQcEg0TzNXSktQV1h1c2NL?=
 =?utf-8?B?QU94UkZxZDVDQ1hHcTBLeW1uMWlLa0E1WWMzSzlycFk0NVIrd2g3U3F4SDNO?=
 =?utf-8?B?UEZHRENvaHo3aGN6bUQvc1RyQVBYdG42VVFJdU5jRTVreGVmVXRiclJoN1Nh?=
 =?utf-8?B?SGFwMm03UzRXaWJjcU1YcnVTa0NPRlN0aVM1QjJsUHpZZm52TDVTbWw1SDRr?=
 =?utf-8?B?K1JVcEdpVGFUa1Rmbk1haWZJdVhjL0ZWRzhsSllnZU1oOC9FSkkweTAxa210?=
 =?utf-8?B?bUFJajZpNmNWZ0tvWjBiOUZiT2hWRDlRSk9jRlFKMUI1aVo0Y1k0M1luYjBw?=
 =?utf-8?B?ZTJKeUc4SmMrR1lrMW9lRFZzbHFKSVA5RkoxRXZKS2NsYXJvbU1pdDd3PT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7408.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(366007)(1800799015); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cVlWbnVPWmxiSE5Md2RWTERkUEFBRGZ1UWdJS3VUdlhBQVNpZFlzUkh6bHI3?=
 =?utf-8?B?QnVJeGZDUFZuRFc3RTgyV3UwZ2creHlMWkVoS093VDdBK0JxLytIQWxRNVNF?=
 =?utf-8?B?ckZBekE2cFppczZSRmVWaHBmcDhybGlVL3UxY0t2TFYrNG93OFN3UXlBOCt6?=
 =?utf-8?B?REJBUXMrVzV0dFlXc3cyU0tkSXdUL3V4OVhHaVYrdlpxTUQ0Z1QzR2Yrbzls?=
 =?utf-8?B?ZGsvMzBPVU0wMm5iNXRLMGdGc1ZvOTBTQTZObGZkbFVmU2NZemp4eWtVQXl2?=
 =?utf-8?B?MGJnTVdPWk83Zm1xUytlOHc3ci9yOXArSDg0R0JxWTYvMGRlLzJCWVlDVFlP?=
 =?utf-8?B?Tzk3d042ZytEaENGSUVZdzYrNXExV0hTdlhLU2VTbmZhcVA0eC9ZZnM1ZmNL?=
 =?utf-8?B?aGZ1NXpwd3FIREtZVUM3V1dab25nVUY1ZnlXc0ZRQXNNeU91V1hibnVEZ3hO?=
 =?utf-8?B?bEdvcDRSU3lNeFd0UmF3TW0zSkZKSEh3akpibjBybTRjY2VlQ3VtOWdGTUV1?=
 =?utf-8?B?cjQvK0NnZ2IzTlU2VDcramVpUXZZcmduakYrcFlsOXFRZlBqN3l3Y3c0QjBI?=
 =?utf-8?B?TUJMMFFVdHBRdFBSQTBicVk2ckRLT3lYTHBjN2NIRjNKNDdudnFxTTkzNlcw?=
 =?utf-8?B?YWZldTVtUGpFVitUOEc3b2VhZkhqai9rRk5pd3dGRnNuZ0lGdXBnYmE2ZEd6?=
 =?utf-8?B?Rlk0U0lxWnZWV0xIRlMvS3JseWdWNHYvZGNxTTRpTmVYMXlHOGJkM0NXNGsr?=
 =?utf-8?B?VFhnWHM3WERoNi9HbU9hZmhCN1c3ekRtS1YyMzJPWVhFNStqSmxtMnVoZ3pk?=
 =?utf-8?B?UERyS0hCdGRnVHM2MVNLVEhtSEtXYTlsUG9mZXIvNXNtb0J0Z0VHajFhZkhH?=
 =?utf-8?B?NWsyOTA3K3YvNjB2Mll4MW5RcklUeDlRM2xtY1pnaTRJYzZQV0hGTXJORVIw?=
 =?utf-8?B?ME1SYnVSbXBINlFtT1hOdGhsb0pjeGt3eXBhVFpSTm1Cbm1JeEw4dy90MnRo?=
 =?utf-8?B?RnN2cXViR3VHcWlnbnpBeEhZSGRqZ25XTHc3aUZwNDkyZFJZb1dibENIVVBs?=
 =?utf-8?B?Z3paOW9jT2hEUGhUVGRobmYrYk5Hc2YwZG9NRGFqdDhldFVJb0hzay9hUGlB?=
 =?utf-8?B?VEFycUxqbUk0a2NUS2MxUExIa1JJd0FGQjNxdUlWM0UvbzFRK1JSSHI2eGVI?=
 =?utf-8?B?V2xCS1d0UmJVM1Y3SmFycWlkZTBKZDZ6ZUVlWHJIbWNXL0RhOUZiWVdzU3RG?=
 =?utf-8?B?NWJBbm9oOEdKV0FBcU91VXlvUHdyMk94TGFNdS9PYk5TK3V3TGl3V3dmQUVM?=
 =?utf-8?B?TnEzNmVKMlIxdjczYWEwbExZZ1JEOUR3SFp1VENnWHl2MWpxdWRWSG5MQWhT?=
 =?utf-8?B?YXZUa2hKdy9GZEZMUVZod29ZMnBtSUhWdkdybmtrbUM2TjJJK0N5RlA5Szht?=
 =?utf-8?B?VGdEdko1RUVKb0hkN2NUWFEwQXBzSTZqUE81QWRWODdVUEhTc09tZzJ4UGtj?=
 =?utf-8?B?c0lVRklxYkNIaVh6a2QvcFYyN1cwd0g1eWtnVW9XbU1QSUlUVXdxVXJOZ1Rh?=
 =?utf-8?B?dXJwSXk0cmxQUS8zU0MyTkZabms2T2tERFd3aGRBZStkUEVaMVZBWjRxSlp2?=
 =?utf-8?B?ekJBeW9LU1JiYWZEL3B4bTFCUnd4d3ZHclFjZ2Z5VEVEVFFnN2VLRXpJRjVH?=
 =?utf-8?B?YUdPajNLNEJFOVozV0xDOUNUdmxRTjRFcVd5MDdDb3RRdUZ5UGIxanI4REhk?=
 =?utf-8?B?RjAvUVJyZVk1d3c5V2FoNzFkNGMvZkNOMUc2VVAyM2dFRmRVNWI5SkVUb05Q?=
 =?utf-8?B?TWRuZG5mZGZnQ0JGRmNweUFsRGhuSm1KYWdiNWUzTnFvOXNqeGt6end3Nzd1?=
 =?utf-8?B?VWxkK09DVW9wSExRWVhndFRDQXVRaUYxMGFmWUxZQ3VCOWJqbmEyWlNFZWMy?=
 =?utf-8?B?MnRtTldHUDRpQW9zalFMeXdQdmZnQ0ZNSE4xMUwrYWxqd0tnUTVHd2I4Ym9s?=
 =?utf-8?B?VThFVGU2WGVGYzYzR3lFNmZ2Ti96elJmRWFrY1hTRFJiaWF6dlg5cnhvU0Vu?=
 =?utf-8?B?cmh3MzE3V210Y2Z1YlkvYThONjIrdVdTcnU0cjJMQmNTbUNKYUdWNTA2SWp1?=
 =?utf-8?B?SjQxL0VOYk9HaFlXdnMvMXltR3F4Ly85MTRTd3IwSUpoTnliSkRLSUY5MWVK?=
 =?utf-8?Q?lywqPlSndAW8sh5xOkhhlFw=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0f3b78c3-db55-490d-3543-08dc6f913d07
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7408.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 May 2024 19:01:16.6027 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: f7rG/SKRsjJMeRfr+PvdsCjmeOPmY3F1FZ6+WqyC9gMaLFToWDsgjNU9fHyxvElmDyrptZUbExBFSbyY1kEiV5AQYVL44lKzsi+MYoCGYmM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4718
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

On Fri, May 03, 2024 at 11:46:42PM -0700, Lucas De Marchi wrote:
>If the fdinfo data indicates there's drm-total-cycles, use it to
>propagate the engine utilization. Also add an assert in intel_gpu_top
>since it only knows how to deal with with engine time busyness.
>
>Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
>---
> lib/igt_drm_clients.c | 13 +++++++++++++
> lib/igt_drm_clients.h |  5 +++++
> 2 files changed, 18 insertions(+)
>
>diff --git a/lib/igt_drm_clients.c b/lib/igt_drm_clients.c
>index fbbb763f7..105c7d298 100644
>--- a/lib/igt_drm_clients.c
>+++ b/lib/igt_drm_clients.c
>@@ -107,10 +107,13 @@ igt_drm_client_update(struct igt_drm_client *c, unsigned int pid, char *name,
> 	c->total_engine_time = 0;
> 	c->agg_delta_cycles = 0;
> 	c->total_cycles = 0;
>+	c->agg_delta_total_cycles = 0;
>+	c->total_total_cycles = 0;
>
> 	for (i = 0; i <= c->engines->max_engine_id; i++) {
> 		assert(i < ARRAY_SIZE(info->engine_time));
> 		assert(i < ARRAY_SIZE(info->cycles));
>+		assert(i < ARRAY_SIZE(info->total_cycles));

same comment as before - maybe just ensure array sizes are the same.

>
> 		if (info->utilization_mask & DRM_FDINFO_UTILIZATION_ENGINE_TIME &&
> 		    info->engine_time[i] >= c->utilization[i].last_engine_time) {
>@@ -131,6 +134,16 @@ igt_drm_client_update(struct igt_drm_client *c, unsigned int pid, char *name,
> 			c->agg_delta_cycles += c->utilization[i].delta_cycles;
> 			c->utilization[i].last_cycles = info->cycles[i];
> 		}
>+
>+		if (info->utilization_mask & DRM_FDINFO_UTILIZATION_CYCLES &&

This should be

s/DRM_FDINFO_UTILIZATION_CYCLES/DRM_FDINFO_UTILIZATION_TOTAL_CYCLES/

or a new name if you decide to change things based on below comment.

>+		    info->total_cycles[i] >= c->utilization[i].last_total_cycles) {
>+			c->utilization_mask |= IGT_DRM_CLIENT_UTILIZATION_TOTAL_CYCLES;
>+			c->total_total_cycles += info->total_cycles[i];
>+			c->utilization[i].delta_total_cycles =
>+				info->total_cycles[i] - c->utilization[i].last_total_cycles;
>+			c->agg_delta_total_cycles += c->utilization[i].delta_total_cycles;
>+			c->utilization[i].last_total_cycles = info->total_cycles[i];
>+		}
> 	}
>
> 	/* Memory regions */
>diff --git a/lib/igt_drm_clients.h b/lib/igt_drm_clients.h
>index 514c09e71..946d709de 100644
>--- a/lib/igt_drm_clients.h
>+++ b/lib/igt_drm_clients.h
>@@ -36,6 +36,7 @@ enum igt_drm_client_status {
> enum igt_drm_client_utilization_type {
> 	IGT_DRM_CLIENT_UTILIZATION_ENGINE_TIME	= 1U << 0,
> 	IGT_DRM_CLIENT_UTILIZATION_CYCLES	= 1U << 1,
>+	IGT_DRM_CLIENT_UTILIZATION_TOTAL_CYCLES	= 1U << 2,
> };
>
> struct igt_drm_client_engines {
>@@ -74,11 +75,15 @@ struct igt_drm_client {
> 	unsigned long agg_delta_engine_time; /* Aggregate of @utilization.delta_engine_time, i.e. engine time on all engines since previous scan. */
> 	unsigned long total_cycles; /* Aggregate of @utilization.agg_delta_cycles, i.e. engine time on all engines since client start. */
> 	unsigned long agg_delta_cycles; /* Aggregate of @utilization.delta_cycles, i.e. engine time on all engines since previous scan. */
>+	unsigned long total_total_cycles; /* Aggregate of @utilization.agg_delta_total_cycles, i.e. engine time on all engines since client start. */

total_total_cycles :). I can understand that since I am looking at the 
patches in order, but there might be room for another rename, maybe:

s/c->total_cycles/c->total_engine_cycles/ (since this is how may cycles 
the client ran on the engine)

s/c->total_total_cycles/c->total_<something>_cycles/ (where <something> 
could be - "available" or "gpu".

Regards,
Umesh

>+	unsigned long agg_delta_total_cycles; /* Aggregate of @utilization.delta_total_cycles, i.e. engine time on all engines since previous scan. */
> 	struct igt_drm_client_utilization {
> 		unsigned long delta_engine_time; /* Engine time data, relative to previous scan. */
> 		unsigned long delta_cycles; /* Engine cycles data, relative to previous scan. */
>+		unsigned long delta_total_cycles; /* Engine total cycles data, relative to previous scan. */
> 		uint64_t last_engine_time; /* Engine time data as parsed from fdinfo. */
> 		uint64_t last_cycles; /* Engine cycles data as parsed from fdinfo. */
>+		uint64_t last_total_cycles; /* Engine total cycles data as parsed from fdinfo. */
> 	} *utilization; /* Array of engine utilization */
>
> 	struct drm_client_meminfo *memory; /* Array of region memory utilisation as parsed from fdinfo. */
>-- 
>2.43.0
>
