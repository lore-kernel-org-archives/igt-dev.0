Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA5ABEB7ECD
	for <igt-dev@archiver.kernel.org>; Wed,  4 Mar 2026 11:18:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C13210E9B5;
	Wed,  4 Mar 2026 11:18:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eTGvMdg+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 82E1E10E9B5
 for <igt-dev@lists.freedesktop.org>; Wed,  4 Mar 2026 11:18:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772623133; x=1804159133;
 h=content-transfer-encoding:date:message-id:cc:subject:
 from:to:references:in-reply-to:mime-version;
 bh=SCqnYAESJ74hmqVLyh0THw+sgYmyxvmBLczHVPAkZJo=;
 b=eTGvMdg+vYGnCxsGW1WhmtDqmKQtBJkKBtq9MnlqL70oaiyj/WiVfcb1
 fqf5lz+Bue44omg2yR4EzJPjrpYaGAHL3aA3GBc5qx59xnpvhfVT1b0c9
 iXWc11Z9YSDNqGteFxm9or5q0pLOQOD8qTSWDnihKfqJ2ntN+klxh2t0W
 XtxnVe77uk+3dqRhElZya17/du5vw5vyIdS5vaGL8bKK6VR12lrdDWOrY
 KA10v0zU6KUH5aTieQfDEZrGh/XPRKyWrsuUXrCx0GAIZu7hzcsKUqlQN
 AcT2InjXqPjn275MNWAjxpCArgVRwbMYEVCzD4eGiZNlF7MsKkcNpC9JW w==;
X-CSE-ConnectionGUID: 3XdcMDtXT1qnJLdwaHM7Wg==
X-CSE-MsgGUID: qkXnNXeQRvO4086E/9dwyg==
X-IronPort-AV: E=McAfee;i="6800,10657,11718"; a="73380274"
X-IronPort-AV: E=Sophos;i="6.21,323,1763452800"; d="scan'208";a="73380274"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Mar 2026 03:18:52 -0800
X-CSE-ConnectionGUID: F5VCksnfQtOtqJ6PyeBLCg==
X-CSE-MsgGUID: CjPq/8dOTGij6z4v/yJlsg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,323,1763452800"; d="scan'208";a="222980954"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Mar 2026 03:18:52 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 4 Mar 2026 03:18:51 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 4 Mar 2026 03:18:51 -0800
Received: from PH7PR06CU001.outbound.protection.outlook.com (52.101.201.7) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 4 Mar 2026 03:18:51 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BtH6BqSOwAYS5EX3kT7srg+Bg8rVs9GU0dHgIM/iZXFSM+IiJmuomgq+8+S16pPfQVDsK0lc99RDudpbAuaBMsFNfJL9VZDYq2qk0n2MUNsIhUt4YzR1lKYXGT1juWXHjdcTEbWxDg7waMGkivdg+s5lvmYuzybkZxN41ek86n0SAH2fIOkD7ODBlo5Yf0Ibn6wlatzi2yTY7VqdJaDKFfZsgn33nAKUgHHnAWEfKVUS0dPTWss+/8ssIRDxNtbOo3SxxEbcopY8HltG42oC/wmH2AFisVcu+6FN0rkrbaQGAubOKUUVfIrRHnhM35F5DE+hGunt4L7PNl18C8w4ew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SCqnYAESJ74hmqVLyh0THw+sgYmyxvmBLczHVPAkZJo=;
 b=mIR89rZUU+aAmCAbQFGUtCPpszHXHN70X+akaDSVZ+1ztb5B3olxDQ/qHumLJwFbYi0TV9AGihqmACNlsOvzqYBJOfrsEOqP2VQ72rjY6SzLmryAY1R4gxyLEGW7BAjCHkp+lNi20elpUd3IzMClsBV6vSsRTxEkAOxnoAmglc5X4nymFll4dyqKsHdkrVXR58n+ZDwAmjQFeGrNP+A0GKAfBNo8tl72ZMC+FmfoV53YlqRxUsuasAyqqrEJSnXftrfLokB/CrSGlLzbkBc7P7gUAVUmnO/7bjlRFtd+Gi31SfKlSNUBj84trlilg4/501lvEaQciFK36JMllUhz6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB6909.namprd11.prod.outlook.com (2603:10b6:303:224::12)
 by LV1PR11MB8843.namprd11.prod.outlook.com (2603:10b6:408:2b5::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.22; Wed, 4 Mar
 2026 11:18:49 +0000
Received: from MW4PR11MB6909.namprd11.prod.outlook.com
 ([fe80::9eab:962:806:3794]) by MW4PR11MB6909.namprd11.prod.outlook.com
 ([fe80::9eab:962:806:3794%4]) with mapi id 15.20.9632.017; Wed, 4 Mar 2026
 11:18:49 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Date: Wed, 4 Mar 2026 12:19:22 +0100
Message-ID: <DGTYGUU0VE90.LDNB0J6POGFZ@intel.com>
CC: <jeevan.b@intel.com>, <kunal1.joshi@intel.com>,
 <sebastian.brzezinka@intel.com>
Subject: Re: [PATCH v1 1/2] tests/chamelium/audio: Fix ALSA handle leak on
 skipped audio config
From: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
To: Mohammed Bilal <mohammed.bilal@intel.com>, <igt-dev@lists.freedesktop.org>
X-Mailer: aerc 0.21.0
References: <20260304100553.3075443-1-mohammed.bilal@intel.com>
 <20260304100553.3075443-2-mohammed.bilal@intel.com>
In-Reply-To: <20260304100553.3075443-2-mohammed.bilal@intel.com>
X-ClientProxiedBy: WA2P291CA0014.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1e::25) To MW4PR11MB6909.namprd11.prod.outlook.com
 (2603:10b6:303:224::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB6909:EE_|LV1PR11MB8843:EE_
X-MS-Office365-Filtering-Correlation-Id: bb6e6fcc-d653-4272-be33-08de79dfceeb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: AvwtS6mR2d/yNKgBxKW0yWmu7CaqmkpZMoTJszoTbsbDzqii8/AleOpXyYH7w9NhWTA51UyenjhYONYiGRHq6kRLdBamJrA0JlKLJEb9NN980fje2rVIuUlmnEre1M8jUxDt3Drqpo3FS5chydo9Ra9zPCfg0AlJ+MPCzOjTvS69F8F/LfPCR0Jdt96stp1f/ZA6g3hqMRTb5TR/MxqJbTpG4mVAHLsia2FPBBdtRsn+M28XxAKO7BG3Beg77nHizPoDbGBjeIXvdkwMVwUDpNHXbaxHhVtax/dGTn1iTIHvbSGfJjdgInW9FMLI37rXKPdpbcyEDhUi+m1qhYmCJD5TGulP5x7JJBA+eGgxNQRzgO0kV/DkwTX51NazTtt3YP5JrwTC/HJqjfnz/Xj6/xLLcziC1B2sjDGAsK7YOyicuiczHhIyM8vdNIW5w94WIEjuQoQUi88kq4gVIbk79kz0joSFFvu36TdoSwSpGGhE3jKGCFXm6fohVPttPtTccvk8xBgvu7M8W9U/7rjYZlUCHm0MBJeLtwr8gzf+e9tpDpHRMoOhVXkDLkMartt8pqumBxI3J8hJvWel7Zw0uTrJdG9xyRXwSIFw/DE3C/36bZK2LePyTA2pHIleRUxywswOA+MrWvMeBA8mAlPo6zG7gW4LlSPzZtYpTvRGCbUIeLC+8YdI8cfDFtF6HAKsjcVY0H4fl+6q5qNqurcvbNCGrVdW7/Flvt/dZG7Qh7o=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB6909.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?L3RTTGQ3OTFsdUMzZHUyTjYvSWs5alplWkh6UkxpcjlMdzhOY3lpSW1SdEM2?=
 =?utf-8?B?bExqUjlYWWhWQVhDaHFrcUM1OGtrWFFndGVDY2R4UnJTVW1hT3V1U2hHZFdR?=
 =?utf-8?B?QThJQXYvQkoxWVUyWmRwUFhXWk5GcStjR0NUcmJxdi9VZmVOdmgzK0V2eHIv?=
 =?utf-8?B?R1p2K2dJYy9tR2hNcmgrNHRXbUNVa3F2OHRIMTZNK1R4YkZYck9KTFNzUWZZ?=
 =?utf-8?B?a0w4YmhlOVlpVG9VK1dnRUQwZlhKaS9RZkw2WU44eWxIUDhpN09ZL0pOMzVV?=
 =?utf-8?B?dEdvTDJzQ2s0TzcySmpCZUxHMHlMUlhaNDJyNVlKVFc3ZEZ2VWk1dTRNSHA2?=
 =?utf-8?B?YWV1K0NVTEgxRTdJdVFpQjZIZDh0Z1Bma3lweWh3bEhoMmZiVXk4bkdva2ha?=
 =?utf-8?B?bzBpMGxMaTRrS0ZMNVlyM0pwSjVCMkduUE5nYWJ0a29zQXVTaWxJSEZPSDZR?=
 =?utf-8?B?QmdLMVJvbFhmSGdzRHBDSTkzajhTUFJZbU0weFFtVmlxOENGbytjWHQ2MTFW?=
 =?utf-8?B?eG9NS1E0cEF4SzZ0TW9TaisxSGZsYmszRHVUVTBwWXZNSVpKNmFkeVdPTm5p?=
 =?utf-8?B?K3hUZUoxaHRoQUxjRnFOYkRDSG5xeEVseTdZdytZNFN0bWZsRWh6aklrRThu?=
 =?utf-8?B?TEEvaFc5Y3Y5L0xXZGFmTjZCa0IxSzhZMWJzTWdkVmxkdldBTE9DWDZjTU5R?=
 =?utf-8?B?ZGxPS2pFSkpON0huY0I0bmxqNDl2WC91QVRLQkpTbEhQeUQwY0xnOGNpQXNQ?=
 =?utf-8?B?U01Md2w5ZlRYeFNBaEZGZUhneHdkU1d4a1MzaUQveWkrMitsanVOWkNDRWhP?=
 =?utf-8?B?LzdQRFYycTFVcjhWMUg2K0UyMW9wMkYvMHVnYlVFUkZDOWd3OEpKSkNwekJB?=
 =?utf-8?B?SnFYQXFubWVlVHBOdmhBcCtMUnQydGhYTkVVME40MjN6aU5EUzZXcXlnZ1FT?=
 =?utf-8?B?Ynkycm5sRE1jNDN4dU9BQkdsVU1JZHJ2Z1g2RVBoNzhUMjhrSjZnNm5sZWIv?=
 =?utf-8?B?SkZFdmNhbjJQOTlZVElKY0RobWhYMUZaOEpCNEppSVAvY3hTV3pVSDdjVTlj?=
 =?utf-8?B?OGhJQ2twbk40THVlTVF2OTQxTDFSUEZBdkpnQ2JaVXU3UVNyUm9nK09ReGor?=
 =?utf-8?B?bjFkcmNoZFl3dnhLekluaCtHTzJUU2dsdzB5ZVRNTWhzSytEcGtQQTl1S0tl?=
 =?utf-8?B?dXRkWXJuWDVxYTI5UTJkWjk0Vms1cDNOY3pFSFU2WTFnMkVGZnZpOFdmV2pq?=
 =?utf-8?B?KzU3d3JyRVZ2NWc4eU1sUmhReXNNaDN1ajhJY2hpMy82ZWt0QnlKd0h4bFRr?=
 =?utf-8?B?N0JyRVNFMG53bkcwaWc0bU9BdjNEMi9XLzJWNDgraTVZZ0lxb1BWR3lGaU1l?=
 =?utf-8?B?S3FNOEdkTXhFZ3d0bHNsN1lsR0xxREhiVTdJaTJDeEFrWkZtY3hKdk0wZzR3?=
 =?utf-8?B?dXNOaGxlRWk2aEhXcXYrWVhReUI4a2NNY0N4TTZEbTR5RUo2N3NuWjBhY1dz?=
 =?utf-8?B?WXF0YWlMaEdiZzcyTncxN1dkVGo3ZVJ5RmhkYTNBS2w2a3h1Q0tWM0VUWGhU?=
 =?utf-8?B?Y01MekhBeE9KT01jRFNvQytVbFpWek01emYreEtCeWpzbGJkbSs0RHBGeGFo?=
 =?utf-8?B?RGVkc0R1bGEwcklEUnMvRnFISE5QQklWL0ljRzVZcjlqME4zYVNsWjNjWHEv?=
 =?utf-8?B?Qk91c2xpc0NuQTdwM3hQallQTk15d0E5eFkvWXprTm0vcmNVWG9VdnRZOHBI?=
 =?utf-8?B?c2FoeW1PUGdycG9td1NYQVJhaXVCMmthdDNaS05VUlZsQm9YbHR4bHFocHZz?=
 =?utf-8?B?WkgxOVg2MDYvNXZMbEUvanc0MTR5bVg5WUxwL1pma3diVFZWNmtGNXNjMDl5?=
 =?utf-8?B?S2F0cENzWWQzSGNTT1AyQ01QbkUvaFprdFd0ZnZaQWVSNndEaTFYYzdEZWdr?=
 =?utf-8?B?Z0dVOWdXQkxjdzQ4cEFYUlBXenFoaDdES1RDZzVubS9GNWxjUFFneWJsdDJR?=
 =?utf-8?B?N1I5Y3NFQ01YaUNNd09GZ1VlUDM4VXZ0Y3hwOVVmNEpFQmlXSTdVRjl0VUEv?=
 =?utf-8?B?WVd3ZnRwYkhubnIra1NVQUVpZXlVWmpkdVk2RzZETzZ1eHcxZXQwaE5ZVlFu?=
 =?utf-8?B?R0oxaE5HK3IyWS9aWDJHemF3OTJtZXM4aFczZk9jcEd1MVBCYVZOOFhwcC9k?=
 =?utf-8?B?QndnREVwaysramFZbGI4ajU3SlFURTN2RExtTWNuejFicjVFVWRncmR6Y0Q1?=
 =?utf-8?B?bVdKb3hXZHloN2ZkMUZBTDEvaDdlWW5MbXZPK1BPSFowK2VtUFB1L2FMYmh5?=
 =?utf-8?B?d0ppSjZmam43NjYyZDdvaWovcG80R0NmTnM0cjBNSmkzbDNuTFFvckdlSVRU?=
 =?utf-8?Q?iK4wmC9PS8Sy9uP8=3D?=
X-Exchange-RoutingPolicyChecked: cqLD3VMw93gT6UhiLJpvkdCLlN4NOqQp/dECZzUI2i77y+55uC2OXunc1a6AcQeyPAUZPavgaVhumSuTfMwI+94pBSK293rFYVjXNZu/NQDxzhEqKH/vRr9Rt3bJp96BeHvg8cWUhYfoebpRKHlDIoBcUCjXKQ+ubNXoT9CzgPYPUDd9Mgx8Cu9/8zzzCImzJKwq+8PNLqPNIebI6mplLIw8I1CUTcwLlUr3j10b7ML4lpkIdWABlRdyOSO6ALjImv7m+novzA+CUTKl3yFgss11ac9uBSSmqPISl437gn0YuwExs0YZdBH5cqEiE62dznqqUo0FyAMdyQ1NYrnvfg==
X-MS-Exchange-CrossTenant-Network-Message-Id: bb6e6fcc-d653-4272-be33-08de79dfceeb
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB6909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Mar 2026 11:18:49.0528 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fG6pDlMoPyLM3qoHfA8OMB/b7NxH2WG5OkrIgPF4sg4CVYOd1bVeFtpIIM5t1Ahzb7+iIaAzAb7oqrt7EyRhZHhRz2HN4lMWk13QOV768n0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV1PR11MB8843
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

Hi Mohammed,

On Wed Mar 4, 2026 at 11:05 AM CET, Mohammed Bilal wrote:
> When the audio configuration check fails, the loop continues without
> closing previously opened ALSA handles. This leads to handle leaks
> across iterations and may eventually cause file descriptor exhaustion
> or configuration failures.
>
> Fix by ensuring the handles are closed before continuing.
>
> Signed-off-by: Mohammed Bilal <mohammed.bilal@intel.com>
> ---
This is a clean fix, I have no concerns.

Reviewed-by: Sebastian Brzezinka <sebastian.brzezinka@intel.com>

--=20
Best regards,
Sebastian

