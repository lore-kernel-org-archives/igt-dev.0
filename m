Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DA59FEC0E6
	for <igt-dev@archiver.kernel.org>; Tue, 24 Mar 2026 17:45:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE3F010E30C;
	Tue, 24 Mar 2026 17:45:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="XJRrN80Q";
	dkim-atps=neutral
Received: from BN1PR04CU002.outbound.protection.outlook.com
 (mail-eastus2azon11010012.outbound.protection.outlook.com [52.101.56.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E241310E30C
 for <igt-dev@lists.freedesktop.org>; Tue, 24 Mar 2026 17:45:10 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QCMEtUarAD25N+460IvJXc95L/25yaGDJJtDOdEO3Xnikya7RQh6QbHHqdE145OY+iFbIChcRPToboKp3UKt1uZduTSXVQMBvvKwF1sHwUTn8Ox8c11zayYW2el7GoQApczJLz5s5A24j28Q+YNgweno9Rxj2OvcaFnav/JQKbRJNr2ULBy2fEdpnzOpVe17tL2owTOjbDbuDpNKQVBn7D6RZx4eXMBSdNJXYtbAijhfKouEhEs+iz2LuMXsosB+ZFSJNV2YJoWrCe7YwNvvRlzzt/RrbF7eMxUNbx0SEqTq1X1QGFXNfUu4j0QVFTH+beOV5/ZFuese3dy9wbqdgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GFHYrrOhLBd4d7Z2MqxtTczp1jOe069HF6QgYJ697Tw=;
 b=ozOTGEp84p+RMDpECEw3IWXeXTWbWS4mfKA/BJ5T1jwU2iLQ3jpuF8BDYoW0HlClLICscQVqkQQDcU/iQtJVPL9BnZcchQl6SuLNQ+DpXljEtdhJ1TPsU87CINkyHMpSksHmMLVd4DII1biDWOWExtWYW4Xdy7EAMGCV3DYq95/92i/Kv3v12J3Eeg/I+vecD61TxQek61nEYBEC41TuWFhDRf+Ir6mTsJEznMqbrpqilojJE0fMV1SKNRrTejGF/I01N2HUPzqrMQcBQuQvCGJb/2YxLvgmhFa8DOuiU61vQiZ80QcN8di+abWuStnEV2RGuf/2MuhJ0Ka+2saWUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GFHYrrOhLBd4d7Z2MqxtTczp1jOe069HF6QgYJ697Tw=;
 b=XJRrN80QQ7k/oKIHolATVELAFxMiks1ZEfhZyQnOrzYG+SdkTVmlh596+bzWWs7j3u6h6REDz1XBjBlof42XRg8LpD3SoWk9tXOKeoXrZGMXv9i/z2qq2CQ3wgzrGvgkWxxg36TQFuNju9tU3H+dhcvtovAKcdfEF6TyUW7cajI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB8476.namprd12.prod.outlook.com (2603:10b6:8:17e::15)
 by MW3PR12MB4412.namprd12.prod.outlook.com (2603:10b6:303:58::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.20; Tue, 24 Mar
 2026 17:45:03 +0000
Received: from DM4PR12MB8476.namprd12.prod.outlook.com
 ([fe80::2d79:122f:c62b:1cd8]) by DM4PR12MB8476.namprd12.prod.outlook.com
 ([fe80::2d79:122f:c62b:1cd8%6]) with mapi id 15.20.9745.019; Tue, 24 Mar 2026
 17:45:03 +0000
Message-ID: <73471ab7-347a-473f-a238-5129bf297200@amd.com>
Date: Tue, 24 Mar 2026 11:45:01 -0600
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 0/7] tests: lots of s/crtc->pipe/crtc->crtc_index/
To: Jani Nikula <jani.nikula@intel.com>, igt-dev@lists.freedesktop.org
Cc: Aurabindo Pillai <aurabindo.pillai@amd.com>,
 Harry Wentland <harry.wentland@amd.com>,
 Vitaly Prosyak <vitaly.prosyak@amd.com>
References: <cover.1774005763.git.jani.nikula@intel.com>
Content-Language: en-US
From: Alex Hung <alex.hung@amd.com>
In-Reply-To: <cover.1774005763.git.jani.nikula@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4P221CA0003.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:303:8b::8) To DM4PR12MB8476.namprd12.prod.outlook.com
 (2603:10b6:8:17e::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB8476:EE_|MW3PR12MB4412:EE_
X-MS-Office365-Filtering-Correlation-Id: 7af35958-feb4-421d-0135-08de89cd13ee
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|22082099003|56012099003|18002099003; 
X-Microsoft-Antispam-Message-Info: OdfcgnbEci/ymb5V5zLF0zfUIPJx1V+Ogy4q2z5Ol9McEKIyjeONKplwsD33MOwJ+MZNz7YisNkbHfvumQzS5+xtWj08Fa9b/Bg2aAYndzBok0e2fz/9RZ1cPNWq5oSgv+k9gBxVOTCGDd8pXRij/9TgVBXo/TAgguGtB6MgdseMTHz2tdUNJ07FlfWIppzBQHxkK1EUl2+PFKR74QhHSvDIj//EZWiXRNQnNk7Mf3UX0AfANatltWIBG1sXUC9x61tcQGit+dw9g+ml31zFYzfxez7lgkmn9RieL8C2gJv0li9baOvsOxhD7IeDyxW46JHF4tIBhHmi//Q6PUySQi6iEn266u/MjOe/GTtDrMC5LCFDorMTpdB3zut7MHlSRjl72abMm6+QhiduIzghNmkDckHQjsQ4wYz4wnAJPZAJjLNHE7EaclXHTjficrYST8KTNQbGihpBVlvtVYtG1Ut88AdFFuU7wrJKEFJ7ri4wmssPZjLbOD2Z7AWXQgi6QTqn/HaiN98Ih/G484RGzo/SeGcElcFsKpERBOD0dL/BJrVcSYdPUIA9xZwPDKqWcVO/xFxa962wLx6sYhbKI0U79LuhCcs/9U3RRV0Dpl6rYQSl02wmFc94JAv9I+PfLl2jq5xtfksCHTddRsdKiYe6ESg7vC+Gob6z4+9nrfpvSJJ5TrfDc1ViXjO1IKwrtJu3lEsIDpgh1TxowpxHuPz5nSyyLWAHdhk6QiWdUt0=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB8476.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(22082099003)(56012099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?L0JvdS8wUkQvT1p0SUI3MC9qWTBqN0wwSUh4M1BFM2J5ZzNaYlZNMmhTbmU3?=
 =?utf-8?B?TjhIVjZNdUV6c2RhZmppQTVBVGVyd1VVTlJPaitPRzZBR0x6d3pRc0RzemQv?=
 =?utf-8?B?REl2eW4vWnRoMnppb2loczJmU0VVYit4UWhTYWVxOEJNbkN5c2xIV3ovK0Z6?=
 =?utf-8?B?aHdzdCtLYW0rOHhPR2pyNThZSjVjekxVbnc0SjBzQUQ3SWxSd1Z3T0tsVUJm?=
 =?utf-8?B?SUFuTVFOMXAzMXk5U0NTLy9ZRkpFcElSd3RCV1FublloRmZqVm5ZQWJWbG92?=
 =?utf-8?B?SXd2bEk1ZnlhblAyN0V4UGxUdDVESU9MOWRhdUczT0hnOHJ0SXpMN3dZMVFx?=
 =?utf-8?B?QWVUYXFGdzNTVmEya1pQdnV2K3o1MU9MUmJ5eXp0b3dGK2VPeE9FN0diWS9q?=
 =?utf-8?B?aklhdEVoSjN3bVozSWlyN0VEYjlZMDB2K0FKLzBORkpRYkdkUjQwcUxRU3BV?=
 =?utf-8?B?UGpTSTBsdHVCVWRxNStCRFovOXZhQm5aVFdnQjBxemx0V3NQZkNMU0o0WDhB?=
 =?utf-8?B?MC9MNXFlMmpmVmNDK0o1NG5LKzJXWmRnRmdQVktLejBxOWdYdUtsak9NdkU1?=
 =?utf-8?B?SGE3UFBUSFVLN0xvSGI4NDdqb0tScG1CbDFzOUNxUmJxcmh4aFdWQjF3aElj?=
 =?utf-8?B?eFYxdS9QNmpCVm1DcnJTM3llRjMxcS84WXhpWjdWZndONGVyVUpyUXhDZGNU?=
 =?utf-8?B?UGdjSUNMUExpN2FYamdLTW1Qd0s0RXo5OUxIQUtxclJvS09RbXV6L3d0T1Mv?=
 =?utf-8?B?MXNmVThoZ0M5dUxtU2Fuc0FObU4rRzlObDh0MWlnNzY0L01BOW43TWp2QkNM?=
 =?utf-8?B?b1BPckp4QjIwblRXRlVUQjROYkRkWjVGaDJwbG4vVUc4NjVCOGRHMFZvZDl6?=
 =?utf-8?B?d1dadHk4SGdtZnh4dVZpRGVva1l5cDgveVhzaktPLzA1a1VOMXdBT0FPMDdL?=
 =?utf-8?B?QTlzLy9rTXpaOFFJSkcrcUt6VG5TRUgzYWtXak5COVZIRkFBcG9lZlU4dWpa?=
 =?utf-8?B?OENlVEhuZEcwaGpjSitOY3hGanNvSk0zMm0yejVyQlNTaGovdWtwR3IzcnRt?=
 =?utf-8?B?YTNYODdEMzc1ZndERjhpSXB6dU43aVZseHQ0T21MeFFvSnpSdUhuQ0prdXZX?=
 =?utf-8?B?QU00eWVia1lYQ0RwdjQ3WFA4MncyVHZkVXJhR1pRNnQ1UU5OaFkwMkRxc3ZI?=
 =?utf-8?B?S2xKbW91NUYyQXFpSW42ZlhMWGhWVU0wK2MwbVdmamFMb3Q4NEpSUnVDRXM5?=
 =?utf-8?B?QzNPYkllMXRuTzRCMkc1Y1dFU001TmwzV0R1cFBYa2NoaW1CdlpBYmpxcE5U?=
 =?utf-8?B?QkMySHJ4dzVsZkJ1NWI2V0ZKTjhVL0s1TC9KeVdVbFY3NCtrL3pqekhaV1JV?=
 =?utf-8?B?cU84SUY5c3J5ZlI1blhmejJZU2dJaHI5RHVGcmJxc2FpblJtMHhKbkpkSWdp?=
 =?utf-8?B?Qm1NTnNtS0ZyUzV2aXVJUlVDbzNnOHhDSlZpUHEwU3VWQmNwbnRPMGhiSElp?=
 =?utf-8?B?OEZaZlEya3pMbDVIanZjajloZExTd29jZ1JIREszc1c0T3JOOUhMOW1rSFlz?=
 =?utf-8?B?WmpsbTA0M20zNDI2V1EwdHJJRG9CS0lmQ1lLMEpSVTJ5L2tzQXZ0UUdmUDk3?=
 =?utf-8?B?WEFzS3JIMDEwRWRHaFdiWC9uV1QreEN3WE1VNjJVWUlMajh0bW5OZ1RzY25G?=
 =?utf-8?B?bGRHUFlkUVlzVUdPRDQ5TSt4SHZiWTNwOHJCYTQvNjlIbndxREJkajIxckFC?=
 =?utf-8?B?OWEvbDFXSHFFMHYxZTZEMGx6UXVvU0RsTzZ0eFB2VXdQMUNHZ2NhTUx3MDMy?=
 =?utf-8?B?N3pXQlFjcU1WK2NncENBWnJySng2QkZCL3RudWx4Ynl0TkNZenJYSHZOVFRL?=
 =?utf-8?B?dEZNWFlDaTZoeTNXTk45RlJZbUVwazQ1UzdMOVNCSHpwR2ZCem5qU3JjVXBz?=
 =?utf-8?B?NTg5R2tRMmIxNXcvbUd6dGxFdUgzcWQ2TzlQd01wN0VSVThLTHd2TGFxdW4r?=
 =?utf-8?B?NjNydUNCajJCNXg4R1EyaERCNlZYY3UxR3dOVURBYmNrYktRcmZ6TktFUk1p?=
 =?utf-8?B?U1RUbStzUlNZRng4TGxqU2NuaXFRUG5JcXVCWTBYbzFWVjljZ2RWZDhnMnRz?=
 =?utf-8?B?SS83czNtRWRFRzBvWkZjWXVPQ09XZHp2MG1YU0tsR3Jtd3dlNFUxNnRVU1ZI?=
 =?utf-8?B?T3dET0ZpMGF3TS8yU1k4N3RYNEdtV1FjYWFoQ2srMHBQOC9adFVlenJ0TElR?=
 =?utf-8?B?ZmVHeGZyUWlZK0tETEpMcXpMQ25vWWVtcE5VUWFZbDFLY1FVRVF0Z0t5VWVm?=
 =?utf-8?B?Q2xIUTYvZmd3VllqWXo5Vm5VRXVucm1qS3Z5L09mZjdqY2ovU0d3dz09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7af35958-feb4-421d-0135-08de89cd13ee
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB8476.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Mar 2026 17:45:03.0787 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Zd9D8gTuVSF4f8J9I6BhTDGQg9FEerDdbiWulpIUW2FtKdzFn9znP93guEN97Y1S9d/TIgZ9i1DXDmtExmOVcQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR12MB4412
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

This series is Reviewed-by: Alex Hung <alex.hung@amd.com>

On 3/20/26 05:24, Jani Nikula wrote:
> Do a bunch of s/crtc->pipe/crtc->crtc_index/ where the crtc->pipe isn't
> actually needed or relevant, e.g. basically all of amdgpu tests.
> 
> Cc: Aurabindo Pillai <aurabindo.pillai@amd.com>
> Cc: Harry Wentland <harry.wentland@amd.com>
> Cc: Vitaly Prosyak <vitaly.prosyak@amd.com>
> Cc: Alex Hung <alex.hung@amd.com>
> 
> Jani Nikula (7):
>    tests/amdgpu/amd_plane: s/crtc->pipe/crtc->crtc_index/
>    tests/amdgpu/amd_dp_dsc: s/crtc->pipe/crtc->crtc_index/
>    tests/amdgpu/amd_subvp: s/crtc->pipe/crtc->crtc_index/
>    tests/amdgpu/amd_hotplug: s/crtc->pipe/crtc->crtc_index/
>    tests/amdgpu/amd_multidisplay_modeset: s/crtc->pipe/crtc->crtc_index/
>    tests/amdgpu/amd_vrr_range: s/crtc->pipe/crtc->crtc_index/
>    tests/kms_atomic_transition: s/crtc->pipe/crtc->crtc_index/
> 
>   tests/amdgpu/amd_dp_dsc.c               | 142 ++++++++++++------------
>   tests/amdgpu/amd_hotplug.c              |  52 +++++----
>   tests/amdgpu/amd_multidisplay_modeset.c |  30 ++---
>   tests/amdgpu/amd_plane.c                |  27 ++---
>   tests/amdgpu/amd_subvp.c                |  16 +--
>   tests/amdgpu/amd_vrr_range.c            |   4 +-
>   tests/kms_atomic_transition.c           |  18 +--
>   7 files changed, 144 insertions(+), 145 deletions(-)
> 

