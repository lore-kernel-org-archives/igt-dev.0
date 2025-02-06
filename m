Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F9B6C02199
	for <igt-dev@archiver.kernel.org>; Thu,  6 Feb 2025 18:51:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4666510E307;
	Thu,  6 Feb 2025 18:51:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Bn+5a5to";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 08F0C10E2E7
 for <igt-dev@lists.freedesktop.org>; Thu,  6 Feb 2025 18:48:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738867740; x=1770403740;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=VsLOAl0kQ7cCAZV76W8n3aB2V3rkkPTb8C+VV8a22z8=;
 b=Bn+5a5towmGKMI6g9uY9Y8jR6XKjLBpC9OL3pkqT0mCYgtTD5071hl6v
 PQXc4e/wMy58V7/CdvktcLgfJ04weZSkoeF6cM7UfwNF6x8UAYbRfP0WT
 Y6qrSShoR6QjBgbXwav/KMrs+JTeTkxBOL5lwncgqDBjw0pOhUFCdgE8g
 soyFHcUEEfsZarberNCnzqF8MQZuew4UeoKNU5BY5Vykte7FHArysU1J5
 ywPgtY9RXb7Z2IAZDR5YgHMi11Lt7sXy78Ba/IAMk02LfP5dvnT4fe02k
 Zd/kQbAQxcY11+x4f7bF4R8rdhcEG8fb/O+6dm41ua9dSioVAbALzVcyt g==;
X-CSE-ConnectionGUID: sHwsC0NlRSyNNjKNETrJqw==
X-CSE-MsgGUID: MREqoPXbRACDKf9kYZ5DHA==
X-IronPort-AV: E=McAfee;i="6700,10204,11336"; a="39513548"
X-IronPort-AV: E=Sophos;i="6.13,265,1732608000"; d="scan'208";a="39513548"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Feb 2025 10:48:59 -0800
X-CSE-ConnectionGUID: LeiWLsqyR2S2OiXuX9R1gA==
X-CSE-MsgGUID: BrRHBJbhTqqNs2Q4GJQokg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,265,1732608000"; d="scan'208";a="111909356"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa009.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 06 Feb 2025 10:48:59 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Thu, 6 Feb 2025 10:48:57 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Thu, 6 Feb 2025 10:48:57 -0800
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.168)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 6 Feb 2025 10:48:56 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=n9j9dl+c/ZwtFxCvbz7cUtmvh9EaBvYYpjlEfmSdYI+m4JzjFGW7yN8H7adJrrrdN+v23Nl5ZLSkBbY5E1r3Ok/OL52RnwVTgbQ+luslndUYyUnRY6M2l7y1wMAP8ctmn/AEqUgnFUElfCGEvjUplh5N4DazgeyrnnW9DmVe0QypaPFM0NgAWnSIiUyegwuyAf+uYt55zsPCeWvjQq7pEGtawLX55CSASblylwopzTj6d+oKbB9JPL3oS84BGNbOYV0jWlbPnhfHCUMeeBTf05FKFdcprVA+jM/EE3XMJAzaEoKU+/UokwKSSVWSVof8jOZU6qLdJ0FhSkplz6gcuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2zqQkxnerIa7ydIPEuuz/vxb74O+1e4imMng0mUHRSQ=;
 b=CQV/hgyJEa1aoZSeOj1WpJV+1zvIGnsRM19y3HAKT+QPyvcxyGOEP45ftjplF8hpTvwApVoW4m88yNWBpXmkpZOQuUYZNHOCLoDnHnoMQkSFA4hbEgzNHvvZ/fPQ26fpFWyxaqf/BEkpXfR4AzeAJ98u82kJLX1018XyUc3p7FwQ8WfzI9kfsJ+hTRN4EDlM3VitXYo8E4KpBkROclSksKBUkvGzJrf3Ha/m78Eof8JH4Wnnoj2edOc3vqTfl9NXYWnLtdXErMHHPE0LtkQ0sw2Gkrk38LYaSWbu0J1t9GHIM03amFgykC5Orf9jHWSDUKQp7IaiuGs5+MF6PPWCmA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7SPRMB0046.namprd11.prod.outlook.com (2603:10b6:510:1f6::20)
 by CY8PR11MB6988.namprd11.prod.outlook.com (2603:10b6:930:54::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.24; Thu, 6 Feb
 2025 18:48:35 +0000
Received: from PH7SPRMB0046.namprd11.prod.outlook.com
 ([fe80::5088:3f5b:9a15:61dc]) by PH7SPRMB0046.namprd11.prod.outlook.com
 ([fe80::5088:3f5b:9a15:61dc%4]) with mapi id 15.20.8398.025; Thu, 6 Feb 2025
 18:48:35 +0000
Date: Thu, 6 Feb 2025 13:48:32 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <sai.gowtham.ch@intel.com>, "Souza, Jose" <jose.souza@intel.com>
CC: <igt-dev@lists.freedesktop.org>
Subject: Re: [PATCH 1/2] lib/xe/intel_error_decode_xe: error decode support
 for xe driver
Message-ID: <Z6UEAI6HEa6YuJYR@intel.com>
References: <20250131202940.1124460-1-sai.gowtham.ch@intel.com>
 <20250131202940.1124460-2-sai.gowtham.ch@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250131202940.1124460-2-sai.gowtham.ch@intel.com>
X-ClientProxiedBy: MW4P221CA0006.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:303:8b::11) To PH7SPRMB0046.namprd11.prod.outlook.com
 (2603:10b6:510:1f6::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7SPRMB0046:EE_|CY8PR11MB6988:EE_
X-MS-Office365-Filtering-Correlation-Id: 71f2401d-afb1-4cf9-8f20-08dd46dedcb4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?yRiiioOcJE2+MH4rR3zl5mGtrPqq1vnFNtwsKMB7WxTgJg4jT+j5aWmxnm?=
 =?iso-8859-1?Q?YGDVD86emW8VTweDG0j5/ORdRlAuLM+Wj1/0xts9+YIE1hvZvW5Zl/KJLC?=
 =?iso-8859-1?Q?A+lFCGeOnYFn+lZMtt+a+Y3UEfLXhhl9Ypap7S1dii8mEKLClA7G1jBVLZ?=
 =?iso-8859-1?Q?RwuzVi7Y62QtBX/lxOXF09uhqeM7A3/DAW6TobWK/fOlGCXZvvJNjYF7VJ?=
 =?iso-8859-1?Q?287L0GEd0qPydMd8y/BuZ/tC9Lbx4HQ51J8Wo/HKzjnkfP+T8PtDM252ri?=
 =?iso-8859-1?Q?19SUZaXeg6oAgdIyjS2dialpcb5zQ5cpSYOlIiaO9m5xCR5MMJgJvkqx0F?=
 =?iso-8859-1?Q?t9/4H+oJfapW/Z1DrnGiOtLNHiyvG4fDy0FSyzOc9KtwQ+b/DYBWXyfYy7?=
 =?iso-8859-1?Q?+e+NRYDekSFGs6uwaySyU9Ju9qcf7cUTTuP7BpzoLh8KDDsRxjhea6gLXr?=
 =?iso-8859-1?Q?Dck1s3W6I7yLLUxF6ow2Hdbg01p/6hTLWKuLe48HNjHDgCDqnNyen46L1l?=
 =?iso-8859-1?Q?EJLBZXDlAHmca9Wn7Y+1cPcW+LQNKiy+6ZgqDn++hvA14VyABKvJdEwE1t?=
 =?iso-8859-1?Q?sOv+aRfu+O8QAoi4LmlJAtplyqFvls1kW3U5Wrnu2Nrin6zQLEtqpuBr/P?=
 =?iso-8859-1?Q?I84/bQdz2HxP/s6ou2RYdXiWZT8pJ44LLd0DGOxzs77mFx3GEflxmAV8QU?=
 =?iso-8859-1?Q?0qU3GThU94s4ZcgnTNNwl3Ui3/hJQxB0DWNOGYtrxaKAOBBnQQ6ZJLKFD9?=
 =?iso-8859-1?Q?XZa3nL6z4uhFoPpkqoEw8pi01BKBTUUcIrDNDL9wNVRYfR/61+FaIRkJIX?=
 =?iso-8859-1?Q?HY/AQkGbCkdidK+A9pKj65/E8QtxlvY4jGmOoiW6GBefNVUE3emsj7Ubej?=
 =?iso-8859-1?Q?SegLgmabjfVJkDroUBzaVO7KlatbXMdvRnmAxTcLntYY1tKTGM2HaOeR55?=
 =?iso-8859-1?Q?fj4jOrkFFKYe61zBzcd3m13jSIZpv8v48qiGZSf/b6s8LlibyEWTO/bHM+?=
 =?iso-8859-1?Q?5MEacOn4sSkhkcbNhGmrPXWsBX7gWomv3jH84Ofn7ssnPZ9RIS1Bf/yStX?=
 =?iso-8859-1?Q?L0CC+ca5V8WyVNLZnbjY7Vf815VG3qDbvNjz0MhT99CzrgV0utLdywRKkY?=
 =?iso-8859-1?Q?mrlQ+vEmPCt18aqBYhZuvAfOSQKwYLp7YOCplzy1yC7tIL7sdYccogh7e6?=
 =?iso-8859-1?Q?c6Pq6eVI6Dm7VgqaQ2DRwNqwxbIpQhqrra1j1sxOS4sibfcSSGNXRGRKnH?=
 =?iso-8859-1?Q?609aGlpHq5WTggrd442USW1IZo3BvhmRd2EWUJY1JAN3J9wGb4DVx0ehr/?=
 =?iso-8859-1?Q?5EaWlRABLz/+vNvr80AtJNQiO5qKP1G1paQ9V2VfDNI8ji74D6kjKOFdLT?=
 =?iso-8859-1?Q?PnaibjRVmKgp4tCSuJNqqF9Zt81AEcklYwZ5+g9GmQ3m4eoKf5ZbiZj/rd?=
 =?iso-8859-1?Q?SPCL6lWHN2G4HgSm?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7SPRMB0046.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?NI2VSFfdq4BjPS6s2tfI1tLex1mMbJcmNF8ubA9ZITucrbebMVJvOPMRgj?=
 =?iso-8859-1?Q?R+uH4SOeoFL6qc8D6VcYLIpsPAaImA4Zo0dFK8bq9XjFI5wvGWu/FIc3EP?=
 =?iso-8859-1?Q?8h7LJhkDvy0bz8tE1Mh2w7Z+LGsWiE1zEjeFVASVMa6ZPvhnvcvoZOZ1DT?=
 =?iso-8859-1?Q?LUqyJqJaU+/9rAHcnpOwnuu75LnQiS/ssbcwV02sTO0lUEeuCb4dhNe/l/?=
 =?iso-8859-1?Q?M0PXtHZlemxIgt6A0mLvqBgqc2CC2PM8AYm3ucQyrxOGXq3Jv7MgarHc6e?=
 =?iso-8859-1?Q?TKoq8VAqevD4fvGdEOacjDXohBET1Ig5BebcqxsVGcy3kbwuGRaeksuLx8?=
 =?iso-8859-1?Q?lN9GSl5wlg+y0q6c1oKqxaG46wBMINYD4k8Q0BLM7qiECrvyOA24XzbL5F?=
 =?iso-8859-1?Q?oYq5eop4/tTep7EkfZZUtnHIY1P4EgsOc3txCuzn9zkj8ntm8XneMQce/Y?=
 =?iso-8859-1?Q?c0dvH2X5zb94biFyRJIWdpnGhuyMRfERNyWoAUOuMx1tYj04M+1gzTswOc?=
 =?iso-8859-1?Q?FB+bFys51ZnfpmnKsMZk+arOIGj52d4b0vJ07V6+ZHVlTwYOrV7n2sZ+Vq?=
 =?iso-8859-1?Q?14NYwJmXUHDb5zcxR8gXIMwD0Dj9HLZ6ylpQVXAUb4TnvKLR5YGqW/d69J?=
 =?iso-8859-1?Q?DFl6jW6sa5Qp/bWeRjK5gPdrP7KYgzH0T5qFAO0YW1WS8WHVp5SSdh/uzi?=
 =?iso-8859-1?Q?ZaA5g2Scbk6Zg22h+S+mQQkZNuCVO/M3XIi9L9yBcV3KivHKhZF9I6fMBe?=
 =?iso-8859-1?Q?j5P4jZHyFnjnIx+j2ZQG0oha4Aj30ONuJoW5iX5yQr1KA0rnokprSveNiJ?=
 =?iso-8859-1?Q?ApNSjnfUeyk2UdgHSvlnzFECASMDmQYPdKgupv2ds/t24VK4ap0odzbUvp?=
 =?iso-8859-1?Q?SQy9poIcO71hhOrrhyaxb/X3PPSlkP6DQcPgD0nY2J/fFVejwG4QVG1+8d?=
 =?iso-8859-1?Q?cWnkqmz0usANaD2Hmz8WdytW8CTVD4cR3Rb6HVldJ9qwC4OWYGa6Itckwv?=
 =?iso-8859-1?Q?koIMq5nWwJ7hkmwa9GAxG7RcYJNJ0OTp2aTo1dtwCBbGjAcgBtevPbFFKC?=
 =?iso-8859-1?Q?AnOayjDpp9et5BqZCYDa2fh2jHWqOX0SCTUDL7F0W18ZNPQiWq8DaHG2sM?=
 =?iso-8859-1?Q?SWnivJo5AFFxTz2sDlV0whykMA6Ccp21MYW8QrPsdUcBn0/HaJLNp1yYL1?=
 =?iso-8859-1?Q?bA/kiFE9QoIKxhwTbze3FotSA5+XTvyNhAW5SdxfTocMLM83vS+1svMa6/?=
 =?iso-8859-1?Q?rtLZXeH3ZU/ZZTwI3fHxhOXZNB7dkdIBPVkvXDep/IV3vuuReMhVDl5Qtu?=
 =?iso-8859-1?Q?3Bbb2f//rzJtQTIsWB5S7NohHUKg5MoQ29ongrH2xqduhcGMN5RnM2Ilrw?=
 =?iso-8859-1?Q?DrkpTpqTikB1DSG26a67cVSeKElz6FckGQAyQnd2ZYdJ+Ua3sqbkd2PdM3?=
 =?iso-8859-1?Q?zlckEeWJU5hV0XGp4K+JerbZAjr0cfc3F50WbIBEU+t2x2EWnh5z3iCf7d?=
 =?iso-8859-1?Q?nmZxrX9iCyDGJ2QMYSVc6Qq/C9RmYKjko/wAVA1HyCTr2ITcAEXr4yWuh5?=
 =?iso-8859-1?Q?JFE7I4lr6Q96vCCFnNfMODAnWZmDOVBZ6kxPfMjtc7szqeh+xJ7eK8GTUi?=
 =?iso-8859-1?Q?+LU5z7Jqb7UKDSSlJacJ4hSDJTZWXKCLhS2Y2Is7PfN4pVa2xhQnYA1w?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 71f2401d-afb1-4cf9-8f20-08dd46dedcb4
X-MS-Exchange-CrossTenant-AuthSource: PH7SPRMB0046.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Feb 2025 18:48:35.8554 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: evBIYBihYNHPoJRYNmT5kbFucM3OXsl//QN4L5IqihD1He7oQFllVxYSelxrsj8BoSsvJ18YC7vagDfF03KdYw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB6988
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

On Fri, Jan 31, 2025 at 08:29:39PM +0000, sai.gowtham.ch@intel.com wrote:
> From: Sai Gowtham Ch <sai.gowtham.ch@intel.com>
> 
> Adding error decode support for xe driver, this lib support helps us to decode
> the errors generated in the dumps, this lib is enabled in the existing intel_error_decode tool
> to extend them to work for xe dev core dumps.
> 

Cc: Jose

I'd like to get Jose perspective since he implemented the Mesa decode tool.


> Signed-off-by: Sai Gowtham Ch <sai.gowtham.ch@intel.com>
> ---
>  lib/meson.build                    |   1 +
>  lib/xe/intel_error_decode_xe.c     | 287 +++++++++++++++++++++++++++++
>  lib/xe/intel_error_decode_xe_lib.h |  26 +++
>  3 files changed, 314 insertions(+)
>  create mode 100644 lib/xe/intel_error_decode_xe.c
>  create mode 100644 lib/xe/intel_error_decode_xe_lib.h
> 
> diff --git a/lib/meson.build b/lib/meson.build
> index 9fffdd3c6..c48a64a2c 100644
> --- a/lib/meson.build
> +++ b/lib/meson.build
> @@ -112,6 +112,7 @@ lib_sources = [
>  	'igt_msm.c',
>  	'igt_dsc.c',
>  	'igt_hook.c',
> +        'xe/intel_error_decode_xe.c',
>  	'xe/xe_gt.c',
>  	'xe/xe_ioctl.c',
>  	'xe/xe_mmio.c',
> diff --git a/lib/xe/intel_error_decode_xe.c b/lib/xe/intel_error_decode_xe.c
> new file mode 100644
> index 000000000..8da06775d
> --- /dev/null
> +++ b/lib/xe/intel_error_decode_xe.c

oh, so you are already in the lib/xe dir, sorry for missunderstanding the other patch.
but my comment about the name suggestion is still valid: devcoredump_decode.h ?!
or something like that...

> @@ -0,0 +1,287 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> +* Copyright © 2025 Intel Corporation
> +*
> +* Authors:
> +*    Sai Gowtham Ch <sai.gowtham.ch@intel.com>
> +*/
> +
> +#include <stdbool.h>
> +#include <stdio.h>
> +#include <stdlib.h>
> +#include <string.h>
> +#include <xe_drm.h>
> +
> +#include "drmtest.h"
> +#include "instdone.h"
> +#include "intel_chipset.h"
> +#include "intel_reg.h"
> +#include "i915/intel_decode.h"

hmmm... I really don't like that...
If we need something in common we do need to have a separate lib
at the lower level...

> +#include "xe/intel_error_decode_xe_lib.h"
> +
> +static uint32_t
> +xe_print_head(unsigned int reg)
> +{
> +	printf("    head = 0x%08x, wraps = %d\n", reg & (0x7ffff<<2), reg >> 21);
> +	return reg & (0x7ffff<<2);
> +}
> +
> +static uint32_t
> +xe_print_ctl(unsigned int reg)
> +{
> +        uint32_t ring_length =  (((reg & (0x1ff << 12)) >> 12) + 1) * 4096;
> +
> +#define BIT_STR(reg, x, on, off) ((1 << (x)) & reg) ? on : off
> +
> +        printf("    len=%d%s%s%s\n", ring_length,
> +               BIT_STR(reg, 0, ", enabled", ", disabled"),
> +               BIT_STR(reg, 10, ", semaphore wait ", ""),
> +               BIT_STR(reg, 11, ", rb wait ", "")
> +                );
> +#undef BIT_STR
> +        return ring_length;
> +}
> +
> +static void
> +xe_print_acthd(unsigned int reg, unsigned int ring_length)
> +{
> +        if ((reg & (0x7ffff << 2)) < ring_length)
> +                printf("    at ring: 0x%08x\n", reg & (0x7ffff << 2));
> +        else
> +                printf("    at batch: 0x%08x\n", reg);
> +}
> +
> +static void
> +xe_print_instdone(uint32_t devid, unsigned int instdone, unsigned int instdone1)
> +{
> +        int i;
> +        static int once;
> +
> +        if (!once) {
> +                if (!init_instdone_definitions(devid))
> +                        return;
> +                once = 1;
> +        }
> +
> +        for (i = 0; i < num_instdone_bits; i++) {
> +                int busy = 0;
> +
> +                if (instdone_bits[i].reg == INSTDONE_1) {
> +                        if (!(instdone1 & instdone_bits[i].bit))
> +                                busy = 1;
> +                } else {
> +                        if (!(instdone & instdone_bits[i].bit))
> +                                busy = 1;
> +                }
> +
> +                if (busy)
> +                        printf("    busy: %s\n", instdone_bits[i].name);
> +        }
> +}
> +
> +static uint16_t xe_get_engine_class(char *name)
> +{
> +        uint16_t class;
> +
> +        if (strcmp(name, "rcs") == 0) {
> +                class = DRM_XE_ENGINE_CLASS_RENDER;
> +        } else if (strcmp(name, "bcs") == 0) {
> +                class = DRM_XE_ENGINE_CLASS_COPY;
> +        } else if (strcmp(name, "vcs") == 0) {
> +                class = DRM_XE_ENGINE_CLASS_VIDEO_DECODE;
> +        } else if (strcmp(name, "vecs") == 0) {
> +                class = DRM_XE_ENGINE_CLASS_VIDEO_ENHANCE;
> +        } else if (strcmp(name, "ccs") == 0) {
> +                class = DRM_XE_ENGINE_CLASS_COMPUTE;
> +        }
> +
> +        return class;
> +}
> +
> +static const char *
> +read_param(const char *line, const char *param)
> +{
> +	if (!(strstr(line, param)))
> +		return NULL;
> +
> +	while (*line != ':')
> +		line++;
> +	line += 2;
> +
> +	return line;
> +}
> +
> +/* parse lines like 'batch_addr[0]: 0x0000effeffff5000 */
> +bool
> +read_error_decode_xe_u64_hex(const char *line, const char *parameter, uint64_t *value)
> +{
> +   line = read_param(line, parameter);
> +   if (!line)
> +      return false;
> +
> +   *value = (uint64_t)strtoull(line, NULL, 0);
> +   return true;
> +}
> +
> +/* parse lines like 'PCI ID: 0x9a49' */
> +bool
> +read_error_decode_xe_hex(const char *line, const char *parameter, uint32_t *value)
> +{
> +   line = read_param(line, parameter);
> +   if (!line)
> +      return false;
> +
> +   *value = (int)strtoul(line, NULL, 0);
> +   return true;
> +}
> +
> +/* parse lines like 'rcs0 (physical), logical instance=0' */
> +bool
> +read_error_decode_xe_engine_name(const char *line, char *ring_name)
> +{
> +   int i;
> +
> +   if (!strstr(line, " (physical), logical instance="))
> +      return false;
> +
> +   i = 0;
> +   for (i = 0; *line != ' '; i++, line++)
> +      ring_name[i] = *line;
> +
> +   ring_name[i] = 0;
> +   return true;
> +}
> +
> +bool
> +read_error_decode_topic(const char *line, enum xe_topic *new_topic)
> +{
> +   static const char *xe_topic_strings[] = {
> +      "**** Xe Device Coredump ****",
> +      "**** GuC CT ****",
> +      "**** Job ****",
> +      "**** HW Engines ****",
> +      "**** VM state ****",
> +   };
> +   bool topic_changed = false;
> +
> +   for (int i = 0; i < ARRAY_SIZE(xe_topic_strings); i++) {
> +      if (strncmp(xe_topic_strings[i], line, strlen(xe_topic_strings[i])) == 0) {
> +         topic_changed = true;
> +         *new_topic = i;
> +         break;
> +      }
> +   }
> +
> +   return topic_changed;
> +}
> +
> +void read_xe_data_file(FILE *file)
> +{
> +	struct {
> +		uint64_t *addrs;
> +		uint8_t len;
> +	} batch_buffers = { .addrs = NULL, .len = 0 };
> +
> +	unsigned int reg;
> +	uint32_t devid, ring_length = 0;
> +	char  *line = NULL;
> +	size_t line_size;
> +	enum xe_topic xe_topic = XE_TOPIC_INVALID;
> +
> +	while(getline(&line, &line_size, file) > 0) {
> +		bool topic_changed = false;
> +		bool print_line = true;
> +
> +		topic_changed = read_error_decode_topic(line, &xe_topic);
> +		if(topic_changed) {
> +			print_line = (xe_topic != XE_TOPIC_VM);
> +			if(print_line)
> +				fputs(line, stdout);
> +			continue;
> +		}
> +
> +		switch (xe_topic) {
> +			case XE_TOPIC_DEVICE: {
> +				uint32_t value;
> +
> +				if (read_error_decode_xe_hex(line, "PCI ID", &value)) {
> +					devid = value;
> +					printf("Detected GEN%i chipset\n", intel_gen(devid));
> +				}
> +
> +				break;
> +			}
> +			case XE_TOPIC_HW_ENGINES: {
> +				char engine_name[64];
> +				uint64_t u64_reg;
> +
> +				if (read_error_decode_xe_engine_name(line, engine_name)) {
> +					xe_get_engine_class(engine_name);
> +					break;
> +				}
> +
> +				if (read_error_decode_xe_hex(line, "RING_HEAD", &reg)) {
> +					xe_print_head(reg);
> +					break;
> +				}
> +
> +				if (read_error_decode_xe_hex(line, "RING_CTL", &reg))
> +					ring_length = xe_print_ctl(reg);
> +
> +				if (read_error_decode_xe_hex(line, "RING_INSTDONE", &reg)) {
> +					fputs(line, stdout);
> +					xe_print_instdone(devid, reg, -1);
> +					break;
> +				}
> +
> +				if (read_error_decode_xe_u64_hex(line, "ACTHD", &u64_reg)) {
> +					fputs(line, stdout);
> +					xe_print_acthd(u64_reg, ring_length);
> +					break;
> +				}
> +
> +				if (read_error_decode_xe_hex(line, "SC_INSTDONE", &reg)) {
> +					fputs(line, stdout);
> +					xe_print_instdone(devid, reg, -1);
> +					break;
> +				}
> +
> +				if (read_error_decode_xe_hex(line, "SC_INSTDONE_EXTRA", &reg)) {
> +					fputs(line, stdout);
> +					xe_print_instdone(devid, -1, reg);
> +					break;
> +				}
> +
> +				if (read_error_decode_xe_hex(line, "SAMPLER_INSTDONE", &reg)) {
> +					fputs(line, stdout);
> +					xe_print_instdone(devid, reg, -1);
> +					break;
> +				}
> +
> +				if (read_error_decode_xe_hex(line, "ROW_INSTDONE", &reg)) {
> +					fputs(line, stdout);
> +					xe_print_instdone(devid, reg, -1);
> +					break;
> +				}
> +
> +				break;
> +			}
> +			case XE_TOPIC_JOB: {
> +				uint64_t u64_value;
> +
> +				if (read_error_decode_xe_u64_hex(line, "batch_addr[", &u64_value)) {
> +					batch_buffers.addrs = realloc(batch_buffers.addrs, sizeof(uint64_t) * (batch_buffers.len + 1));
> +					batch_buffers.addrs[batch_buffers.len] = u64_value;
> +					batch_buffers.len++;
> +				}
> +
> +				break;
> +			}
> +			default:
> +				break;
> +		}
> +	}
> +
> +	free(batch_buffers.addrs);
> +	free(line);
> +}
> diff --git a/lib/xe/intel_error_decode_xe_lib.h b/lib/xe/intel_error_decode_xe_lib.h
> new file mode 100644
> index 000000000..fc69f7cce
> --- /dev/null
> +++ b/lib/xe/intel_error_decode_xe_lib.h
> @@ -0,0 +1,26 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> +* Copyright © 2025 Intel Corporation
> +*
> +* Authors:
> +*    Sai Gowtham Ch <sai.gowtham.ch@intel.com>
> +*/
> +
> +#include <stdbool.h>
> +#include <stdint.h>
> +
> +enum xe_topic {
> +   XE_TOPIC_DEVICE = 0,
> +   XE_TOPIC_GUC_CT,
> +   XE_TOPIC_JOB,
> +   XE_TOPIC_HW_ENGINES,
> +   XE_TOPIC_VM,
> +   XE_TOPIC_INVALID,
> +};
> +
> +void read_xe_data_file(FILE *file);
> +bool read_error_decode_xe_u64_hex(const char *line, const char *parameter, uint64_t *value);
> +bool read_error_decode_xe_hex(const char *line, const char *parameter, uint32_t *value);
> +bool read_error_decode_xe_engine_name(const char *line, char *ring_name);
> +
> +bool read_error_decode_topic(const char *line, enum xe_topic *new_topic);
> -- 
> 2.34.1
> 
