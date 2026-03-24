Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FB84FEC0EB
	for <igt-dev@archiver.kernel.org>; Tue, 24 Mar 2026 18:02:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 17AB910E617;
	Tue, 24 Mar 2026 18:02:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="IYs/On2r";
	dkim-atps=neutral
Received: from CY3PR05CU001.outbound.protection.outlook.com
 (mail-westcentralusazon11013061.outbound.protection.outlook.com
 [40.93.201.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE9AE10E617
 for <igt-dev@lists.freedesktop.org>; Tue, 24 Mar 2026 18:02:22 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LYdYtz864VcWEmaLEdmrUlJWY38795mJP5Zc1iecClyubqz7YA6ih5M6pc9U4dISsqDPaR2SY6KNfVJthp+44yYiN36Y0MBY/vqis+uLV8g/sH9V8nVZ8XTv7+nU5A4BbNMzS9OthuRC8KFDvqR+7MonxhcVLJ9gTGC3g7z+4E+ol4g9/S54Kf2LQkrCBlieE+MgAeFXjOWjvmTRieykRkv4bc/go3OrUap6ktMINf2HDo0VAhpUnCeRh07kct2IE9JFDLzzavLFIL8/1On4Dk8YjKI6zQbqVZtG5ZK/Nnh8gkAlox5sPuPtOlQZhA4/Eoj+EE1S/Gmf8+obHVGpug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rbNws7DPasF8bZY2j8rfJ6FF0nBbT1yNotj1x66dna8=;
 b=Y2STz1TJvtRZk1zRV95DjZKVBKGxOZ6yxGfAPXGViIKd80asaWTfnSbEhVAo25jJCwevYkiz2doGVdi9mNA7g7JgTDP1szuDalpgNl3PGZ+uTTkMAsxVjclrvJeaVGWHdxXbGcUlE0dfzHZ23XPSkyCXwcxC7yq0dq+Ds2zjokmgwODLG7Z718jrxS9CooMUA2BcxlFlXJYh9KZbFMd091Z3bqhJ/acuak220v2Xs+h7xLot548Ah9j2sNgV4X+rOQyrRHnWxit7YB/CbYbX73opYD9Pyt+cNDJLjSR26h//MkzWNMANPbJ2XfCi2VtubaS/dExIBsipv0sdZWUucg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rbNws7DPasF8bZY2j8rfJ6FF0nBbT1yNotj1x66dna8=;
 b=IYs/On2r26wgRQtI2Mvuxt/GDsInM02v323M9f9qzQ/S9vY3wVc4nDuDDw1UmjbHXkWNsXPwdKE0HeJfYt2K4EJcbHk6xpK4PoFXOef0m8phqq/TU2suiTRtXAYD7hD7T6Maq8vt60W0JYFRlDSeAyFKfDDFCmn7xQMV0onoDrQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB8476.namprd12.prod.outlook.com (2603:10b6:8:17e::15)
 by IA1PR12MB9466.namprd12.prod.outlook.com (2603:10b6:208:595::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.20; Tue, 24 Mar
 2026 18:02:19 +0000
Received: from DM4PR12MB8476.namprd12.prod.outlook.com
 ([fe80::2d79:122f:c62b:1cd8]) by DM4PR12MB8476.namprd12.prod.outlook.com
 ([fe80::2d79:122f:c62b:1cd8%6]) with mapi id 15.20.9745.019; Tue, 24 Mar 2026
 18:02:19 +0000
Message-ID: <b7fabb0e-308b-4e96-900a-f7212bff6128@amd.com>
Date: Tue, 24 Mar 2026 12:02:17 -0600
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 0/7] tests: lots of s/crtc->pipe/crtc->crtc_index/
To: Jani Nikula <jani.nikula@intel.com>, igt-dev@lists.freedesktop.org
Cc: Aurabindo Pillai <aurabindo.pillai@amd.com>,
 Harry Wentland <harry.wentland@amd.com>,
 Vitaly Prosyak <vitaly.prosyak@amd.com>
References: <cover.1774005763.git.jani.nikula@intel.com>
 <73471ab7-347a-473f-a238-5129bf297200@amd.com>
 <efb8a4969ce1ca90890f98b04c4038b6fc95c72f@intel.com>
Content-Language: en-US
From: Alex Hung <alex.hung@amd.com>
In-Reply-To: <efb8a4969ce1ca90890f98b04c4038b6fc95c72f@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR03CA0143.namprd03.prod.outlook.com
 (2603:10b6:303:8c::28) To DM4PR12MB8476.namprd12.prod.outlook.com
 (2603:10b6:8:17e::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB8476:EE_|IA1PR12MB9466:EE_
X-MS-Office365-Filtering-Correlation-Id: c97db0f7-8fa9-479d-55e7-08de89cf7da1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|56012099003|22082099003|18002099003; 
X-Microsoft-Antispam-Message-Info: zxoeMic40Htz25yDkeTN/Z0XmnY+BC8Tr3vrTbelfYHhoNUfJxTWx6iVfq4WvAx5zP1sxhWAUpDCBfkm3dT7cGUnGupOLjUG0zt9jp/4uZBvGPY+p0CHjO5LQLVYhXbonX6bZZvhHdT0S2cfWycOYDyFLMWeSIGGuVspkV7t1DMIkN/PbHCJVsEd7l+uq93raPb1kIRc7en36Z3NC8bLySM9nBGhhwgN0MGI6NNRO2kWsoilFS3yohR5TxLf70ieuC+hK4zkYS5JJVMX1BcT4PSRkh3fc089akj7INY171iLdHEum/r4seVWYhXiqKzjdf14xHRnyotnMK1rmbGCiTZxV+4UFx7KorsYiLhK6sUcaKxWQ2hNYtTCaRsvdsq9uGLpwK3DoDLPocLnzFgZSyipTWKBmO0fkiYUqGOvc7BArXBhuNSslxI7nlfZ5ABTs3jU5zCYC+oGdt2XRg5+XEcuSAlvJCgdVz+3DLNU8TU+ciMLncpkg9EL0+760w3uBVX2Ag4BowILUBwfHvMBrH8RKX1bjS0JQjOOYr2NUraxHqYSEldcyOIHavLVKorP3SZbjStDFkZSa5SIdTriJwUeCwqxZDY73UFgdnyD5ZZ+sayRU4pVbzM3GLk1Qc30JKUwjQEKqEUBRGnXf6xe5wjnHlPItibTH+kVdl7TGJQt0gXwklVKzcxhUyyMEDrOaSnZibN7iSiAPftK9VTgLR4u842n2RuA1gfqJUhS60I=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB8476.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(56012099003)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Vi9wNGovNEh6amNCK3lTOTRxbGovYlo3ZnNZa1ZaOXF2bDYyVWcrb1l3VFdE?=
 =?utf-8?B?aVVuZjBSUjFwcVd0dGZuYVZQYVBoMTRmVUluSXdiM2FnNjhEWHJCVy9meTdB?=
 =?utf-8?B?TEtUeWVuK3dkcXo2bTRiYjFNeWgxVmplVVE5dHNzRXQxK1FRTjhEdWI1NXUr?=
 =?utf-8?B?NjNydXVtWk5LMUdCaFljc2EyenYvbXNIcEZCQWRMRG5jUThIbnQ0R2paeHM0?=
 =?utf-8?B?ditFcFRvTXVDMWpPNGVpMDZMazBCYUVYZmJIRVdLWGNBL0dQdWdyUkVWN2cr?=
 =?utf-8?B?VUJ1OFVtdjN2Z0Y0anQwZk5kSmpjak5OWlRDWVZ5NXptS1lCZk5BRGloQy9J?=
 =?utf-8?B?a3RndjBvUTk5QVdmelVDVmd2NEFhWTlTdmZiK1JVaEtQMVVJV0ZSc2N6cFNi?=
 =?utf-8?B?My80WGN4bWpDY3dvSzc1V1JZQjlaSm9iSUREa0lYUFhNUm9jSkVudWFGdk8z?=
 =?utf-8?B?RGZETk1OWDVsMytNTHhxYTBYSUdrZnpLM29CcXB3amMwcjNKMjZDWVZrNEpD?=
 =?utf-8?B?Z2g3TDlyUmorV2dBUWVPQ3p3Z0tadVhsQVV0cHVLZG5PZVJRdFRIN21McTVy?=
 =?utf-8?B?emFNQUdrdzlET3Vob1ByVFMxekpkMkUvNFIrNmJ0NzdCYzZxT3U2Z0VQNHdG?=
 =?utf-8?B?aW1HUTFVMFZHbkp0cUNyM0Y2SmhFVTN3NldWWEh5ZjlzNkljNWV1TDNYWVlm?=
 =?utf-8?B?NGc3N2RqWTZUOHlMN3psZ3U0ZFlPVE1vVnVudEgrYmo4VVRrMXR2KzdCUEcr?=
 =?utf-8?B?bUFmNzgrbG1pZXkvZURqYUowY1RYSUZNcVUwRzFLL1BQdDZ3NGdjMEZURjR0?=
 =?utf-8?B?ZzNXcm14SE5QZXY0TDFlM0Z6enlIQ3Y3TS9GdDNCK3g0WG9DZzBSdWZ6STda?=
 =?utf-8?B?R1Y3b1RwdXU0dWxaRzdwWjE5cEV6U3YxMTFDa1Q0Wmx1WWRwd1ZiMHUzTWFD?=
 =?utf-8?B?Sk5LUzRiejBZV09CbGRlY1cwZFdNR05TVFllZUVYa3pqdTJNVzJjcHRTTFdF?=
 =?utf-8?B?M0hkQjVFSTA1Ym9XS2JjUHFmUlB2TzR0K1BCN21Yc2tJVklNOUR3N3ZjUTRw?=
 =?utf-8?B?TDhJMUcybGNmTWRyanBGaVpOcTZ0UGlvM3F3bVlIbjRsekE5a0tUOWZ4ZGFm?=
 =?utf-8?B?cXgyOFZmOEIzeTdBSFRqZEtDVFlPWWN0cERMTE52SGg1dlJxVWVCb012b2F1?=
 =?utf-8?B?VWpaWjc1TnNpRVUrMkJOTnpBQ3FONVl1ZTJBZFJNK0pXV0s4TTIwcVFkTHg1?=
 =?utf-8?B?TTVMYVZGYmw3NTB2VzZJdWplbkkzeitFTVZiMzZ6dlgwNEVQU3E4V1Z0Qkhk?=
 =?utf-8?B?WWxPTmdRRWVBV3MzWGY3ZnEwM2ZBd2p4dWZiUXJ4QkE5NmFXNW4vTENlcG12?=
 =?utf-8?B?ZjBESWFzWGxYT0NPYWY2YkFCdHdxMUdFRGE5RUpFTmRxY09BTWZtRUxienU5?=
 =?utf-8?B?K3NlbkFBMUpaSDY1cFJFTXVyK3VETTFwRndvWVBkVTJEcWxlcHIvYnZhWU55?=
 =?utf-8?B?VDh6bnJBK1RSSmhOcm1jOVlWemRwUmVmZ3Z3RXQ1QXNiRWV6cy9xMmFEeFQx?=
 =?utf-8?B?NnNXazY5bkJtZUw0OXQrbnV5WEtNandjS2F0bUNIZ0RnWEh3QWJ0ODNMME1Y?=
 =?utf-8?B?eDFrNXdKTTZxQzFUK0NIajE4VGZaa1c4Z1hFWGJDdUpscndUdG1aZmJ0Ykw1?=
 =?utf-8?B?NWpnUU1vbDlrOHNUNnNhOW5LV1VsOFl5cWZjTW9SdTdWTEl0Rm43cFhUbStW?=
 =?utf-8?B?dFpUQkgyWUs5cHMzNVVFeUIyRm9NVkVpMnZ1OEhPdm5FUnBoVkt5SEFVY0ww?=
 =?utf-8?B?R0lGQ1hwQnpyaG8yY3pjcmwzV2JPejk3OFNuLzl0eElnY214THRyWmJnZ0Ro?=
 =?utf-8?B?TGZNV05aTW91VEo4SVNxdGZ4RW5oOUFCNmgwMDQ1RFNKZ3pEMnVFK1BtREly?=
 =?utf-8?B?S09KZXhmQitIc2hOeVMrak04NjhNQlJXL0swWlFhbXNyUGEyWi8zd0NNTmJy?=
 =?utf-8?B?MEJCSWpBZ3FNNmcyZTZ0RnAxZmUwWmZZTlBrYWRKYjYvRnp1S2VxRTk1ZGlO?=
 =?utf-8?B?c1RZYm9PM0UwUjlJaEt4cUxZZUVPK2x2SEdFSWtGTUoxQXZnYk9VY0FrNmQ1?=
 =?utf-8?B?S0xvL1RaSFpidSs1YkJFZWFLajRCTU41eHlFZ2ZkcDlVVDF0bUxCdTFGWkxN?=
 =?utf-8?B?QURGVmgyK1g2WitNeXdxWDFJZ0toQUhieFRnRE0wOUZPcXNaazdSWHBFZmQy?=
 =?utf-8?B?TnhSMDZpSEx6OVNneHhlQkxiQ1ZTYlBmdTRQSEI0Ti94MnhkaGN6NlBQb0c2?=
 =?utf-8?B?V3RGcUhmY1dkeWtLQTN4N2xySmswcC9adWhtUjNNWjBwR3FET3Aydz09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c97db0f7-8fa9-479d-55e7-08de89cf7da1
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB8476.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Mar 2026 18:02:19.4191 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Vyw41GwXuCY0FDktuUNV75b02sFrK7M5GYKPRfHlP3WkeeG+MRzyoGOaCwLLPzFHWRNPlxVLcuwPJVUhfoeqTg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB9466
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



On 3/24/26 11:54, Jani Nikula wrote:
> On Tue, 24 Mar 2026, Alex Hung <alex.hung@amd.com> wrote:
>> This series is Reviewed-by: Alex Hung <alex.hung@amd.com>
> 
> Thanks a lot, pushed to master.
> 
> As a tip, putting the Reviewed-by on a line of its own helps 'b4 shazam'
> pick up the trailers from the mailing list while applying.

Got it. Thanks for the tip.

> 
> BR,
> Jani.
> 
>>
>> On 3/20/26 05:24, Jani Nikula wrote:
>>> Do a bunch of s/crtc->pipe/crtc->crtc_index/ where the crtc->pipe isn't
>>> actually needed or relevant, e.g. basically all of amdgpu tests.
>>>
>>> Cc: Aurabindo Pillai <aurabindo.pillai@amd.com>
>>> Cc: Harry Wentland <harry.wentland@amd.com>
>>> Cc: Vitaly Prosyak <vitaly.prosyak@amd.com>
>>> Cc: Alex Hung <alex.hung@amd.com>
>>>
>>> Jani Nikula (7):
>>>     tests/amdgpu/amd_plane: s/crtc->pipe/crtc->crtc_index/
>>>     tests/amdgpu/amd_dp_dsc: s/crtc->pipe/crtc->crtc_index/
>>>     tests/amdgpu/amd_subvp: s/crtc->pipe/crtc->crtc_index/
>>>     tests/amdgpu/amd_hotplug: s/crtc->pipe/crtc->crtc_index/
>>>     tests/amdgpu/amd_multidisplay_modeset: s/crtc->pipe/crtc->crtc_index/
>>>     tests/amdgpu/amd_vrr_range: s/crtc->pipe/crtc->crtc_index/
>>>     tests/kms_atomic_transition: s/crtc->pipe/crtc->crtc_index/
>>>
>>>    tests/amdgpu/amd_dp_dsc.c               | 142 ++++++++++++------------
>>>    tests/amdgpu/amd_hotplug.c              |  52 +++++----
>>>    tests/amdgpu/amd_multidisplay_modeset.c |  30 ++---
>>>    tests/amdgpu/amd_plane.c                |  27 ++---
>>>    tests/amdgpu/amd_subvp.c                |  16 +--
>>>    tests/amdgpu/amd_vrr_range.c            |   4 +-
>>>    tests/kms_atomic_transition.c           |  18 +--
>>>    7 files changed, 144 insertions(+), 145 deletions(-)
>>>
>>
> 

