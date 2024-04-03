Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B8D2CD1288
	for <igt-dev@archiver.kernel.org>; Wed,  3 Apr 2024 15:39:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A8B0112748;
	Wed,  3 Apr 2024 15:39:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JeOI6xj4";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C4FB112748
 for <igt-dev@lists.freedesktop.org>; Wed,  3 Apr 2024 15:39:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712158782; x=1743694782;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=hRhFftcxs5Y2cbp22JVGg1Tkd4l5Evgr4EuSIQ3QVq8=;
 b=JeOI6xj4rx2/ye9xrLiViOZ+9Wb/6cNOk/Nybxf+FNZpTaxRhjbHjWQL
 sOoFU+WoG27d6F+1QoZ11FOQ5F74BgVMJWN7H8VFrToDABn/Qc9IkMhFG
 iC2w2TPAqKiiKTnxQ4ONqUPAlDpQ4C9//D5/bJbzM+dSMd+OHfawRABfH
 CzsHINeKBM0GH8eHDtbmC+uarMJXXXhH+LsVRZGS67kHno+Gj3f4u0BjG
 c8RKXC3T3m8xU9FxrzxkPd/R5Gyet6SPGIy541VqVuS57t0jv3SNJSF08
 B1KSXV2m7+NTupZX05x5ghbSZV3SnLRWcUfgz6MwrP30AVxX7OdgVcuNg Q==;
X-CSE-ConnectionGUID: dHsBHtQiQXuykV9TV4ukmw==
X-CSE-MsgGUID: PfKZ6l6sS4Wh9Rz38Zxlbw==
X-IronPort-AV: E=McAfee;i="6600,9927,11033"; a="18849515"
X-IronPort-AV: E=Sophos;i="6.07,177,1708416000"; d="scan'208";a="18849515"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Apr 2024 08:39:42 -0700
X-CSE-ConnectionGUID: DeOL8n+lQMaNI5ux7AkpEA==
X-CSE-MsgGUID: YosZWIK9SDGCSKUZgNBsug==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,177,1708416000"; d="scan'208";a="49442255"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orviesa002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 03 Apr 2024 08:39:42 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 3 Apr 2024 08:39:41 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 3 Apr 2024 08:39:41 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.169)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 3 Apr 2024 08:39:41 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kEg/yGtjYoKL6EeCf0WtuflzeiUWF0CWg0zwa9RFyvHpgoR3VLRZ2+hUt8pD06yt4TQkJE3fG8Q6KcaslCqxVj3SSghtfW12kX/Fzt3j+Ya75w3lyx43c0dHiEMFN/2g1frOJKoKrv4v4OGaSTF0eh+3ZDA2U3hu/V151o++5rbTbvIZSqgkrvNccU0rv8piAqTw3AoOGinWJODg5jL3vaSPb8FmudzyYigEtaYC36oaz5sOZMhp7QdfcppgzwrYFTGHHK0YSBEgRm/xh8rzUuASOKd/0mmkk3aX/eZQHIf3QUBiFJtyi+eheuF5smJaM6ogcvNClmokUqRP2avf1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/6qDbRrzYec59wapD0tonUipBTE3t80OSc4bJk0bbSA=;
 b=mUtMcMqkm5EI3v9cdP+PEqI57bFiwUHkfFSBgXLGM3leUVFwMmHdVo+JKuL6s0a/TRPfkTMBfTsvWipNJhP67V1mHAxMbEW8qbgjUobggTgXCg0y9L6O7usXAcb6J88BH4FEPadIZ2cz+7TeZCvyQhT4XYEn/ZDmNG7vip0c7hP/ldNKsK2bUnkmgifE+h40gb7XmQeGQ6pQpB/3svmQ4d4ddzEibdPWVwvLpdSo+4gHlQdyYaBZVM6q3M6jDaUycq2iM7nxC2uzdQP9cLnSRFFn8B651mqliHTatYyUH1yvCP5ICo0q9RGqbVQhd+Cp/eIPjtXyVhiRlLMCGhJL5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DS0PR11MB7408.namprd11.prod.outlook.com (2603:10b6:8:136::15)
 by SA1PR11MB8445.namprd11.prod.outlook.com (2603:10b6:806:3a9::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7452.25; Wed, 3 Apr
 2024 15:39:38 +0000
Received: from DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::cc14:a507:b02c:b551]) by DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::cc14:a507:b02c:b551%7]) with mapi id 15.20.7452.017; Wed, 3 Apr 2024
 15:39:37 +0000
Date: Wed, 3 Apr 2024 08:39:27 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
CC: <igt-dev@lists.freedesktop.org>, Tvrtko Ursulin <tursulin@ursulin.net>
Subject: Re: [PATCH i-g-t 3/8] lib/igt_drm_clients: Fix leaks
Message-ID: <Zg14L548QkvFBddf@unerlige-ril>
References: <20240402221716.1840148-1-lucas.demarchi@intel.com>
 <20240402221716.1840148-4-lucas.demarchi@intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
In-Reply-To: <20240402221716.1840148-4-lucas.demarchi@intel.com>
X-ClientProxiedBy: MW2PR2101CA0001.namprd21.prod.outlook.com
 (2603:10b6:302:1::14) To DS0PR11MB7408.namprd11.prod.outlook.com
 (2603:10b6:8:136::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7408:EE_|SA1PR11MB8445:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: R9gtKtHvRJlB9xs8/DyynyOr+1YipZwOSmmIjF67/usSUGutybnzC1eNlCxRlXKso15CPBjlGlucq9KByIbL3kPlJQK7TPZSSG8kYq9asHRxvRFL9MqdYaWc9zd5fnfR3i8eetQiPMp/MQSGV10RWGgMIp0LpYSQXmbVrGT+0kZP1SW9KXwiw2dD+jqzN1CXCBTl0aX7wSOVqBZffgblqHiuVzmUxbCutODLP2yRDm2GtpiHL9EcrtsfQV7Zr592ukL8xKIPpHsTO3gpXgQMqFIOwqYP9mubXv6C5Tm1bjzaSqJWmfr4TQ4MHJgQfILww9A4JwcP7zbT/DNb6YhuMTVLPoXRoTjSsLEfuV+/3UhPkEr7w7EsUCY0j1vKTQUoicZ8VrcpYy+ztmbXhZDBRXiry9pMIupb4rs2ONzKvAbjjkkYNOrFRBALnhPR7VUEplidz4pMzl8XSYeJK4awDRU4PfA8hp87vZ1zvlwPeKN5O6mNl5B7lCnd09R3unz+LLW4Pb4k4SB/hj/u0q3ri5ky1fJC1bta+8nSzpIhvO9+ooEBCSVf5ulDk9PLqIMOpl76tOq1Ds7HBPqKuQY3GCRaev3O2A69wqs6+O4X78aXTLfE/gG0hBjDi77RPfFdZ8G4timHqGrdX5/w7WQnUYc+rleGUUkS5RoYnQrvlD8=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7408.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(366007)(1800799015); DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZFVpWFJDeDVOV2txMEY3R1dsc3BtMHp2VUZQZGUveVVZZ0pUbXFaOVNmWEp2?=
 =?utf-8?B?L2s5YlVTVDZJOUlwTWJQSXZhZEwyTWttcDd4WmJZb1krN3U2R2gxR0VYMDdU?=
 =?utf-8?B?TDFJVXdDWCtpci9GaXZVd1U0elc3NVlucnlFUGRWVC9obC8yRWRxa2tLSTdi?=
 =?utf-8?B?Tk5KNmFldVlueVlNaFpnUXM3MjhNZWI5TzFNREVYSWFHelJhOGwya1Z3NDQy?=
 =?utf-8?B?aFpyUCtJOE9GZGRmeEhnVVFPelAzdDhVS1FwbWN1ZzdBYjNxT0l3WWdVbm5t?=
 =?utf-8?B?dVpZVkNlNTc5RExUTUQyMlgzZVFuRlpWeUE2SDZFdGxyRXhoWUpJeFNURjJP?=
 =?utf-8?B?V1VacmxOSW94cDBqT2g4M2lheDF6eEt2WkVlaHNYM1VSVTR0OTR3VzZNZWVy?=
 =?utf-8?B?dkxnRHlpMWVQQnNUWnV0V3dUQWllSlNhaTF2UlBYaHV6RWI1ek9KUFdSd0l0?=
 =?utf-8?B?NnF5UW83ZVVJbTZ1UWJsNnRQQmI5WFpuUnBEVVI0L20vbzFpZlhVNXp2bVdI?=
 =?utf-8?B?MEZKa3ltOXpqUkllYVE2aXpSUE9YRHFsSmFuWVVMRms3bUFDRE13VjVwQndr?=
 =?utf-8?B?K2xaSDkxd1VCSHk4NWNkZ1d1RTc2ZDgxT1cxN0NQaTZEaWRKUlRHQzEycERB?=
 =?utf-8?B?bWhTV3JzWmlucVdCd0MwTUNqUm5lazg0dDg2bWJkeFpvbDVWdEs4cUFCaThx?=
 =?utf-8?B?STRYcU5TUUFEMWxYSTNFZm11Y2F0Z3JYS0hVRU5tZDZSZ2llTnJJTTY4amZ3?=
 =?utf-8?B?aFRHb3p3WnQ1azRQV2d0cGh3bjZyK1JGMWlkeXNhQ0h0WGsza21UNHhxb1JY?=
 =?utf-8?B?N0ZqS29hRG0rdTBJQUovSW14NDNjdkpKK0dINFlpV0UrdG9VSFJoc0orVFJh?=
 =?utf-8?B?UGd6WkU5L3JqcnI4T1JiMmxhbUxmNWM2Y3NtNHZJYko2V3prbE5oa1ZrVHBn?=
 =?utf-8?B?eGZzYTdNMWlDK2QrYXJNbHNKZThTUjBCOGhZN08vTWdJUnIxaWFtVHFTdTd0?=
 =?utf-8?B?eTlnOURaajhBejRLVG4zRG9EcmNuQklZMVZ0RWtTWVRzcHpDZXhVUkt5bmNK?=
 =?utf-8?B?MzdKc2ZyOFptaFB5Nm9DNmF0c3NvZlNMQVczbHVtaXFITlcyNTZCQzdUUDN5?=
 =?utf-8?B?cW5aaTU4MnVIVHRCdlEydkNLRGJTL05wRGliWTBjL2hQKzlISE9YaFNsdnVq?=
 =?utf-8?B?R2FudTJSUkpvRGVWckJCcEMrK3ZHckRJUW5NbkFEbHlkUVZLekVyZ1FDT3pz?=
 =?utf-8?B?N1hYM20wY0kwQlJUWU9tZ0ZwVU5tUkNTbm05WXkxUjA2Q200bzkwOGNNMzJN?=
 =?utf-8?B?N3lsWmZrRHlzUUd5UjVrcmJVQ0JPS3BPTE5tbm5zYWptQUdnWE9NOGs2czYr?=
 =?utf-8?B?cnF4cXkzRlJwaTk0MVhLU0FyMFFwend3eHg3bityYldmT1loLzZkZHNNOGNo?=
 =?utf-8?B?QXQzL05IekVhdXVOQktheFRmUXRCY0NUOGEwRzl3cU9iQ1pyMEpTTC9QQ25N?=
 =?utf-8?B?TG5yY3ZJNWQ3eGlJbjYrT0xHc3N0c0FlNGFNNENUeWlGZUZ5U1BoN25nSGV5?=
 =?utf-8?B?Zmczc0N5dnZSdkNDcTF6Q3JBREZjRFZibHc5ZVQrM25lVitRUDl4MjBwMUdR?=
 =?utf-8?B?T3NsUmRiTjk5c0RzVmV3YlRMZU1abXkzZHR6Q1h6eHByM0Myd1NxV21rSWNy?=
 =?utf-8?B?cEJzTloyK2l5ODJKRzdjMWFWMVBaYlZURU96N2tkc2JxSzZxYjJrZ3JiT3ZZ?=
 =?utf-8?B?cmhLVjNwd1V5QjdiU2lqbG03YjFiMGExd2hTQmJGYVJlcTVoOUVSS21jcUFr?=
 =?utf-8?B?dWRwbDNQTnloMlg5RVpYbFV6WnE0YnQ0Ti9CQ3ZrSXJpQkh1R3A0bWhlU3BQ?=
 =?utf-8?B?MDdOS005a1RvMGk2VzNhYTM1VnN2WlIyYnl1MnVtY0w2UkJkU0tIaFdmU0Zm?=
 =?utf-8?B?WEdZU3U3cVZqN0J2VUU4MUJLVzlPampqdDdtckJNMlBLZ1VkMlVmN1RBaldx?=
 =?utf-8?B?cXJkT1RSby9CVG1ZemtTNHMvOW9Ca3JoTnpJVGF3T2lIek5jR2Z4cStNcUZB?=
 =?utf-8?B?SGZEZzVGN3FzOVkyWVpoWTh6WGxzOHdWOWRnZ2U1MVpRZ0MzSmdycWt5L2VT?=
 =?utf-8?B?MnpUTGFGdkxHSDR1K1J5bDIvS3h0dTVSRUxaTVM0RnppT0hIWjRJK0RQR3NM?=
 =?utf-8?Q?mvfEzSkxIo9Ro5uKJvyY7VU=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7661b149-70cc-47ef-ac51-08dc53f444ba
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7408.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Apr 2024 15:39:37.1362 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VQsiYRgmpUKGObowrudc0nrxcW329zyJrHfTxXDrwCo8LCXaNt4D8+RjOARf6q0tYkE4eHYpyjFDPE/JTGZPuZzOxZmUiqmnKJGRSe267v4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB8445
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

On Tue, Apr 02, 2024 at 03:17:11PM -0700, Lucas De Marchi wrote:
>Stop leaking memory-related fields.
>
>Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
>---
> lib/igt_drm_clients.c | 10 ++++++++++
> 1 file changed, 10 insertions(+)
>
>diff --git a/lib/igt_drm_clients.c b/lib/igt_drm_clients.c
>index c8dc21d6a..c174c96ab 100644
>--- a/lib/igt_drm_clients.c
>+++ b/lib/igt_drm_clients.c
>@@ -221,9 +221,19 @@ void igt_drm_client_free(struct igt_drm_client *c, bool clear)
> 		free(c->engines->names);
> 	}
> 	free(c->engines);
>+
> 	free(c->val);
> 	free(c->last);
>
>+	if (c->regions) {
>+		for (i = 0; i <= c->regions->max_region_id; i++)
>+			free(c->regions->names[i]);
>+		free(c->regions->names);
>+	}
>+	free(c->regions);
>+
>+	free(c->memory);
>+

Looks correct as I don't see this being freed elsewhere.

Reviewed-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>

> 	if (clear)
> 		memset(c, 0, sizeof(*c));
> }
>-- 
>2.43.0
>
