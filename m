Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64501C3ABDA
	for <igt-dev@archiver.kernel.org>; Wed, 14 May 2025 21:26:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9AF7A10E025;
	Wed, 14 May 2025 21:26:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jmG61pXt";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F53210E025
 for <igt-dev@lists.freedesktop.org>; Wed, 14 May 2025 21:26:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747258011; x=1778794011;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=j4fGiDuwtU5ZnqOrp0dcR9LXfCy2d/eTKiVqVE1qm+g=;
 b=jmG61pXtuIoVyyV9U2gnirRxeP+kSy4njnwFgjIX4GhrrUlvQhlaGwHr
 bIe248v0UHRAeaWHRO6bxqUBH/pbBcd5BsDbMSCRJFEYrElKobM6AX1Qc
 86+T6zdrrse1RnoX5QhW78OJB59PGVQ2Vq1+3j5DS9JdG1YOxKy/Mx4gX
 3/zydGbacrmRUUzmi3MgKW2JtSRyQUwcaOFJhwO6CVQAoBt/HRSD0g9yN
 lJNbsMqPszPqIfrXI65YQbFDapC6M2VseuoYASyQH/sBIUAWMCvR474DN
 ShTTDR76P6aE2sU1yfJecmqH/oIiPwHSvJKQSwUM5MmKAKuIxVMqaf0jD A==;
X-CSE-ConnectionGUID: 3ZccyuHYR8yEtII4WuOAGQ==
X-CSE-MsgGUID: UADgNysQSp6d8rjCp8yaaQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11433"; a="49293345"
X-IronPort-AV: E=Sophos;i="6.15,289,1739865600"; d="scan'208";a="49293345"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 May 2025 14:26:50 -0700
X-CSE-ConnectionGUID: /7nP9aZVRxySUAINQkk6FQ==
X-CSE-MsgGUID: xW19YmojQ3O4rlkeDjxOMA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,289,1739865600"; d="scan'208";a="143127404"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 May 2025 14:26:50 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Wed, 14 May 2025 14:26:49 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Wed, 14 May 2025 14:26:49 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.177)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 14 May 2025 14:26:47 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KwFXZepKi7tzCO9w6Sj/DizJtpl9g/aghdeI8jQpKPTSUgpU9Pol9zsQ79hDYw23NBU5Z1Ir2+HqKwjkzXqjT/2Xw+PBczqBGY/rsCEd4ZmGqImEkHnP8/j34lc8dqd9GwnftKHhpH1WA6/ogazpS1itOPopnNN708jmHLYToymaG8gd4L0oT8afhFT6tinq4MGRJlihUQqI+mAUWsdC4iL+ZEpAHAddZx1qJJRuVG/DCjKKpoFS2L3MnTmwyral7T3Sv5G7MCvpKWnEdkQs411yF5tnXChd4h03oHsFAgi1bGo20qrAYlrSEELzlCWT4fWdLlTKZEW/+xneRbbXzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=F7eQu0NXlWB4OUoqLsiOoJ47rzeuoOD3CBl52PqZCbA=;
 b=ALbTNnTQHh1eWDNOLUKTFWn+G96XoGKNnOKzDBrpeuzxS+sc0ftqL0LmUaA8W5uJCnc1qgPUU71yGd/Xf0NboxU6GhXQlsbojI944CysAooYz3WYTCKYdJYDJm9gTfhpcdS0fm7DUYIllvUyEemoKWxfSKJdn5T/fMRsgBbGOSwQ/vG39Eh7/QtLaEQxmE7MmRfyt1wVvtCUK/spKAJBqw0sdxc6IYvdDuaSK006so/7+ECJNlXk6ESsEzRQhjlAi0s9rNGoK+bH5tYoo20+ELnRKN1XGpu5Yg+NuCNc8mhibdJzLsgpBojsPBkO8fDWm/WKEaEtMWPCA959SAJR5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5373.namprd11.prod.outlook.com (2603:10b6:5:394::7) by
 DS4PPF7CCC4B437.namprd11.prod.outlook.com (2603:10b6:f:fc02::34) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.27; Wed, 14 May
 2025 21:26:32 +0000
Received: from DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::927a:9c08:26f7:5b39]) by DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::927a:9c08:26f7:5b39%5]) with mapi id 15.20.8722.027; Wed, 14 May 2025
 21:26:32 +0000
Date: Wed, 14 May 2025 23:26:28 +0200
From: =?utf-8?Q?Micha=C5=82?= Winiarski <michal.winiarski@intel.com>
To: Peter Senna Tschudin <peter.senna@linux.intel.com>
CC: <igt-dev@lists.freedesktop.org>, <rodrigo.vivi@intel.com>
Subject: Re: [RFC v4 i-g-t] tests/intel/xe_sec_exec_queue_timeslice:
 Timeslice Abuse on Exec Queues
Message-ID: <duolwvitkqaqpcojm4yxkew3dsirqb4cawok6ahwrddgxjnhsr@pxaxnkx2geal>
References: <20250507104111.446923-1-peter.senna@linux.intel.com>
 <20250508085145.566623-1-peter.senna@linux.intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250508085145.566623-1-peter.senna@linux.intel.com>
X-ClientProxiedBy: VI1PR0102CA0045.eurprd01.prod.exchangelabs.com
 (2603:10a6:803::22) To DM4PR11MB5373.namprd11.prod.outlook.com
 (2603:10b6:5:394::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5373:EE_|DS4PPF7CCC4B437:EE_
X-MS-Office365-Filtering-Correlation-Id: 76f122a9-be03-4d24-25f3-08dd932dff01
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NHl1TFdhb0h4QUtIWWoyVVZqY1dKRWlPOXcrK0JHZmdBNXlIOE9JeTNjL21m?=
 =?utf-8?B?d1pqekwvYlFGSUsybGxSbnAwOWFZSktiMjVFN3h0K2RhcjVZZVpjVFJzZ0tw?=
 =?utf-8?B?bFIzaXdldGdrSUFpaFZacWttTW1VVElaVWtLbFptaWVLNTh6MTc4ajBJWHAy?=
 =?utf-8?B?WERCTkFYOG5STXdnVlZsaHYwUEQ5VmtES3dZNFdoY0ZFR29ZNGtWVzlTa0dW?=
 =?utf-8?B?UFU5NkdUQlRjN2xUdVNuaVRzWS9jMmRzakdCK0ZFQWswWTR5VjRLWHNPc0lJ?=
 =?utf-8?B?b3pPU25USFhGdGZmQTlYK25Hd3FDS1RjbytFb1lsMjVXaDMybFUva001RHpq?=
 =?utf-8?B?TUROaERPME9tbmttbndPQUlad0VXTzJEallOQ1lEcHNQZXR3QlF1dkY3SENa?=
 =?utf-8?B?ZUF3RitoUU9VUUpyMklFL1YzcEtxKzlpQnZBaThOOTNXbGQ4YndKb0tXeE1L?=
 =?utf-8?B?KytJYkhzOUN6eHFBZVplREluRksxczcyYXZkeHplZjZTVExoRXNpMkR0K3Ry?=
 =?utf-8?B?MWZpM2R4YzVUNFBINnFoNUJRZ3N5QlN0MTV4eXNZUXphalI0NnhsWi9wOTZX?=
 =?utf-8?B?RVVHdDRiZFUrZ0FZdTE5NEJ3cUtkekswQy9yT3IwYllES21Rd05YWXVyWXZM?=
 =?utf-8?B?dVBYeHVzdDJnbXhwdG40U09kVlpoUXZMbHdndXFwSUt6NnF6ZytHaTJ0VlFC?=
 =?utf-8?B?SU9sZDJQRk1tRFBXd3gvNG5ubmZsc2VxQXF5cnU4QmVIQlZsQVgvNExONThD?=
 =?utf-8?B?dmU5WXA5Y2NYRWNabkdRRmlOeHBtdzRvOGhRQklOcWoyMVFaN2J4V2t0NlB4?=
 =?utf-8?B?d2JVUUNZZlBIRnpWUEJMQVFQVzRQbG5DZld6NDllUDRuOVN2N3JZNnhqb0ho?=
 =?utf-8?B?ZnlLS2UwZHdrOHRmSU9aY2d6NjRLcmlrbGQzYUJPbXNLektHbVFyU2F6c3Zo?=
 =?utf-8?B?ejNxWGt6QzJCZUFoSEYxUm9WZFI5YWR4cDhSRm54Ym9pVXc0d0xXcnhtaEZi?=
 =?utf-8?B?MW02TmlYcWJXSTJockp4TjgzUFBCblhBS25sTGVXalMvWUVNcTNSVG5jUzIv?=
 =?utf-8?B?RndzcExaaE1JUTFJU1NCcXhMN2taWlh5eUFQZzVVUU02TVQxU250bWlvaFJS?=
 =?utf-8?B?MjZ0Wko3NGVGNlMzRW0rcW13TDhYK2d0aEJ4S3ljNjhzUGpUdDNFbElXSE83?=
 =?utf-8?B?T1N6d3ZSNzU2cWlmWC9qQ1BQQkNnTFJrenppWlVqSTVEOHpDYk03dXhkWkhs?=
 =?utf-8?B?ci96WVlxa2hZTDdSaDVYeFd5cEpFS0dkbVJMQUZ6U240RnFLaWhmYmlZeHFD?=
 =?utf-8?B?cGpvMFFyUk01ZlhHT0g2TTMrM1owL21zeG5UYVY5bXAvamhnTVdBWkRQNGdH?=
 =?utf-8?B?SUxQYlp2cWZGMHpJb1pSSlFwUW5EemFhRFZTMnkzbFJZTmZqc2pZeE9UMjBX?=
 =?utf-8?B?Q1ppUkE5cE01YnQ0UlZkbWVDZm9xc3BBUDVIaGxBd2Y2Nis3a0RkVDgyN3p4?=
 =?utf-8?B?M09vN2s0SXV6THNkUnlaR2ZCeE9qVUZKb2ptalpqdFgvZFFzSG5ERFd3L0Ra?=
 =?utf-8?B?dmVsZ0pHUTVKVTZaYW0rOFhsYTNpZnhieFcxUVltT3h5Y1BnK21zRE1ncito?=
 =?utf-8?B?b3JoY0Q3RE8vS0FWSHBQcklmOGQ3b08ybmNNa25Xc01sa0ZJR3c2dWdoYVV3?=
 =?utf-8?B?QkpxNDgvd05ucis5cTA0Mk82eXNkcnZkTVlBL1d4YWxpVjZRVUEvWFM0NHNn?=
 =?utf-8?B?SDQ3QkhzTXRycmJ0KzVqblFBOC92TFhFQWhhcTJLQ3FjK3NWc1o4Qnk4WFdF?=
 =?utf-8?B?cmlsTmNaNTl5UlR6R0xiUnUxSWN4VWVuVjE5VkdwQVByZklsd1FVSjYvOFlu?=
 =?utf-8?B?UzB4Z21JQXRhaTl1QzE1VHBYWVlLSFE2SVloUkIwbVlmN3dDRkNiK2pCSWdD?=
 =?utf-8?Q?c1UbN7XmiOU=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5373.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YU9OY3hvUXF6cjMyM3lXdXNVZFEydm5VbzlYMDdMNW1DdTlsc1BpbXIxRFBC?=
 =?utf-8?B?dnBPck1Hdkw4ZXpqdEd4UTJyOS9xNHduWlJ4VXcrKzl6MFduOWtUSUsxcHVK?=
 =?utf-8?B?N29ocloxejJGOTJjTmhLN2NDVVZpdW5QUDBSNU5BU28xTThUTjM5SzF6bk9i?=
 =?utf-8?B?Zk1PVm8wNGlGWWduM0RNVHR4b211cHJVZ3BWUVl1Z3c4YXVNMldXa0tFWXVX?=
 =?utf-8?B?ZlJRRU1tOUZMN2dCemdjcys1R0YxYWxtcjZETm9jaXJaTllYdm5LL1U3dnEy?=
 =?utf-8?B?aVY2K01XNHhBWHYrS0NXbHBHRnhoZnQ4d2dDcGk3UkhTSmlCS20rREVFd25j?=
 =?utf-8?B?bllBVkNCMDVLWTFXc0F5NzF3UlVrUHVRTm5OVFlyRVltZ1o2NExZMkhIMDFR?=
 =?utf-8?B?VWczZXdFU1REbThtVjdWazFzUk5ERFVwa3cvb3VXUDBpZG91bGxyNFlsU2hE?=
 =?utf-8?B?MXVYaGRna203M2NqRzFEUkhaQkFPMWlZYkpOc0lWUWZkZjdkYkRGdGNhZ0wy?=
 =?utf-8?B?VkM4UEgzdHppMEQ2V25WWWhpbHI0R0Y3Uk8xNzVad3Bka3FkV3Vjd04vakRu?=
 =?utf-8?B?QlM0bERZSGEycjVydVB2R0ZVM1N0VVY4c2dRbE5nSGFnbmtWYzBKVW4rQ2tS?=
 =?utf-8?B?YXVPenRDbC9rRU5rUjcxbzVBcDkzNmErYjBmR1YvTTIvUkh6MEFmSmJncEZG?=
 =?utf-8?B?L0xDN0ZZem02NUJsUTl5bTRpNEFMYUtFeTFIdEI2T1NMcDVIeEtNZ2l3WnNF?=
 =?utf-8?B?bHdyV3gxSlp2STgwVnh5eFh3NWVjUUlJeGlMaVNFdDhmTXA3M2MzSmdmYWFJ?=
 =?utf-8?B?anQ2TUVjOGVzd0dDNmEzSnlxSWJsNVo0OWIvQSsvaEpUYkU1b092YkIybk13?=
 =?utf-8?B?MC8xVkcwQUpRVWVhTnc3YlFrZG90Qkl1MHdoYkVtNUNxeXd1dys0dXVJVjN4?=
 =?utf-8?B?ZEVjMkJMSXRtalhZQ1JRdmtscFFGTGtxZEZGYWZ2K2RJZXUrb3lUT0NEWGpu?=
 =?utf-8?B?WlFEajZoTFZldjA5VDk2VUpOOUQvRC9KcHNKZWJPdmdNOE5PR2VNQUc1Mmox?=
 =?utf-8?B?NHNLeEpMYnAzWDJMbThsR05WVUNhQTR1ajhYdUFrMlZPWFF6L1Q2c2NIUEQ5?=
 =?utf-8?B?WTBNeWhRT0VTWTBlTnNWQnAwbENsaTJzYjJyeG1DODhzVGlGWWtNeHo0alkr?=
 =?utf-8?B?NGppQ0RLNFlLM1dmdXNEUDlpcy8wRnFjbWxveXB1WHVNVVVjSWhKaW1wYkNl?=
 =?utf-8?B?RFF2Z1VzdURkWTZSeWVzSlBQMllaMmlhK24xSEovRlgwZjF5OGpTLzFsRndX?=
 =?utf-8?B?QmRjWFVZUEczSnpROS9Dbm5mVTYyWjM3eWhoMkFCS0s5TlE0WFN4ZXhrbkh0?=
 =?utf-8?B?TG96ZmJXbS9xNTVGaGJpRjZpUmVFRGFkWXA0eHVFM2x2SGtzc3pzZ0J2aFVl?=
 =?utf-8?B?V3c4RE5kY3VSMzh5ZXEvdGpqVWtaUkMwd1cxVjBET3BmbHBkR3BKMGlmcGhu?=
 =?utf-8?B?dlJYVFp0dFJmSnJnRE9VdmY1MExWZFMzL29tODBqa2dGcC8wcm4rUElxeTBH?=
 =?utf-8?B?M1lGUlMrb0paem9lQWUyeUJjOW45ekdoUXhTLzk0WlNRVDVqMldGZkJTczls?=
 =?utf-8?B?eFpwMUJ1VXUzMVN3bHVMZ2JOSTFUTXo5cFluVzFwRUpqdXJHdUpZa3FjRVdB?=
 =?utf-8?B?a2lKdFNwUld5NS9YZ01TeUphbzFTMWxob2h4UDJJRmcxMmFmdFY2L2lVVkJY?=
 =?utf-8?B?aXBHdkxiOWt6TTJCVzFIdkNBR2Y0RVNrVE54ekJEZE1rM3c5YSs4SDNaYXpx?=
 =?utf-8?B?akcyRVVVVkxKVTBzYVh5am1yQk1QMXk5ZTBlNWFYM3M0dzd2d1dlUUs3aTda?=
 =?utf-8?B?VnAvMGw4U1BQN0JUZDNoM21DL0lwOHVMcExQeFl2Y0lYT0J5cytVczlLUUoy?=
 =?utf-8?B?SisvOU92WlZIZS9GZjBlUFNySlFRc3g0QjBLYllSaDZNZklFNVArZGVZN2JX?=
 =?utf-8?B?QytyTUZEWHBscGRPRG9HVkNmZ3NOOGNNS3FBWDFnNzd4dUlGWXU0UVZzT1VR?=
 =?utf-8?B?cTduNzhLd3J1QXA0dVBUVm1KbFlHaXRGZXdjVHAzdWRkZnRsNkMxWncrLzF2?=
 =?utf-8?B?Z1ZxTmlsOU1DZFVDVmVyVjNhUmVMOXdkbWtsR3F6NmlGM0w1LzF3K1AzcGZ0?=
 =?utf-8?B?SVE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 76f122a9-be03-4d24-25f3-08dd932dff01
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5373.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 May 2025 21:26:32.0187 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XFMNmXl3ZwoohAs9burwk0Y/huSdfCuvo4XBc2Dj4XN89f+e1kD6r10vcFAgOZPraVPOA57fx42YVEnDGQXLSgelZBJuKCH1NTs8CXWr6a8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PPF7CCC4B437
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

On Thu, May 08, 2025 at 10:51:43AM +0200, Peter Senna Tschudin wrote:
> The objective is to test the behavior of the GPU scheduler under
> conditions where one execution queue ("attacker") is configured with an
> abnormally large timeslice, potentially disrupting the normal execution
> of another queue ("attacked"). The explicit attack point is the ioctl
> DRM_XE_EXEC_QUEUE_EXTENSION_SET_PROPERTY.
> 
> This disables drm and xe logging to prevent it from slowing down and
> serializing the tests using igt_drm_debug_level_update() that installs
> an exit handler to restore the logging to its previous value.
> 
> This RFC implements the first step that is reading timeslice values for
> each engine and run the following tests on timeslice limits:
>  - Boundary Value Analysis: Focuses on testing at the boundaries of
>    input values with values such as max - 1, max, max + 1.

That should already be covered by xe_exec_queue_property test, right?

>  - Equivalence Partitioning:  Divide values into partitions where all
>    values behave similarly and test one value from each partition.

I don't understand this one - but looking at actual implementation, it
looks pretty similar to boundary value analysis (except with min - 1,
min).

>  - Fuzz Testing: Basic fuzz tester for
>       - Large numbers
>       - Empty value
>       - '\0'

But those are all constants. And empty value is just 0 :)
I fail to see what we're "fuzzing" by trying same constants multiple
times (again looks more like invalid values, similar to boundary value
checks).

>       - 1M u64 random values
>  - Fuzz stress test: Create 50k threads for the fuzzing test with 500
>    random numbers each taking about 30 seconds to run

Perhaps we can extend the xe_exec_queue_property test? If we want to go
beyond boundary testing? We could then hit other properties as well.

> 
> The proposed steps are (this patch goes until 2a):
> 
> 1. Determine the values for the following parameters:
>         - `timeslice_duration_us`: Default timeslice duration in
>            microseconds.
>         - `timeslice_duration_min`: Minimum allowable timeslice duration.
>         - `timeslice_duration_max`: Maximum allowable timeslice duration.
> 
> 2. Create two execution queues with the following configurations:
>         - `attacked`: Queue with standard/default settings.
>         - `attacker`: Queue configured with an extended timeslice
>                       duration. The goal is to:
>                 a) Try to set timeslice to invalid values. This is
>                    expected to fail.
> 
>                 b) Create the attacker queue setting the timeslice to
>                    `timeslice_duration_max`.
> 
> 3. Submit tasks to both queues:
>         - Submit a workload to the `attacked` queue with normal
>            operations.
>         - Submit a workload to the `attacker` queue designed to
>           maximize its timeslice and potentially disrupt the GPU
>           scheduler.
> 
> 4. Verify the behavior of the `attacked` queue:
>         - Ensure that tasks in the `attacked` queue execute within the
>           expected time constraints and are not delayed or blocked due
>           to the extended timeslice of the `attacker` queue.
>         - Specifically, confirm that tasks in the `attacked` queue do
>           not exceed `timeslice_duration_max` in terms of execution
>           delays or interruptions.

I think we should separate functional timeslice testing (which is
verifying whether Xe driver is indeed respecting what was set as a valid 
timeslice by the user, and is a proposed future extension of this test),
from checking uAPI abuse attempts (which is what this test is currently
doing).

Thanks,
-Michał
