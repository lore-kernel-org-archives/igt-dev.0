Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82FDFC54E58
	for <igt-dev@archiver.kernel.org>; Mon, 25 Mar 2024 10:22:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F88A10E2A9;
	Mon, 25 Mar 2024 10:22:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TdkReE5P";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 624DE10E2A9
 for <igt-dev@lists.freedesktop.org>; Mon, 25 Mar 2024 10:22:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711362174; x=1742898174;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=uMuw9/kYy7jv/P5+B15xeo1q/Ix5HGBL1aA2o2CW4pw=;
 b=TdkReE5Pr6+brDhR/0aPFo2xvRmPp9VMZ1cPmi2q+UDQMX4JSIu6Dfyb
 b7kRfNMtswjt09n67CynuJ4AtrUP0numeOe7quHJOQYwwSmoAg8syB/68
 X/v44+Cd5a5S6q/cOjXZ7nReMvFLxzGYyjOmXBHQNj3eUyra5P5stFoNs
 Az4GxqjTKU0YMdNCsxavKW7BF0rmrHCRmwxZRJMwhkxfjrjXl711fvopV
 x8D7aSfHF6IqSUt28yoHAZou3PNCr9HZ5ZGU8hDKxLSGjKKkcG/7Le8Wz
 1jDE/iqW1+iA52yvbx9zuUhCgwkrFY3qtwOa+vJGhIVE7sa+sZHCLPe4G g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11023"; a="6210062"
X-IronPort-AV: E=Sophos;i="6.07,152,1708416000"; 
   d="scan'208";a="6210062"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2024 03:22:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,152,1708416000"; d="scan'208";a="15602625"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa009.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 25 Mar 2024 03:22:54 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 25 Mar 2024 03:22:53 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 25 Mar 2024 03:22:53 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.100)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 25 Mar 2024 03:22:53 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Xvq/ZsvnNMCkNZCwqy9Up6Hv2LK2vallblFl8+RzuaIw2y+iBP39jjZFHHqB6jORlqF3Y8NhE8TEyVKxpRfjjv0iNqvglGltlfBS/ldbWBBdvaItg+jY5VRpXQuBWR0leTBqWFlTd12xH2AzqwFAFUiXmjzcLOIp07x1iV0xv79wWLCcNaFmjJcOItaS/Sx1Ujr4igd2mEOZp5H0fXnqtfle8yMhmhQmi4R55pvq6ZmE1rFF6cmiS2yCfHg2ruo/WeGLxZn8F7BmZOe15AG8Q1th+1goHYijMKwql7IupMVzq39yVKsuCQDyhAuwH/+Vm5dOgKLiH8IboCJyz+wMlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nCF8uSAj8N8cu9tFw192G2bGu6aFPTiSCrZ3Dtw8ihA=;
 b=Qxy+a4legEp75UBc5MPZ6+ebga59tUeK0/rNfssSWGjHGHSRauQQtTyttq0XykgaCGRVtLppe4dbXXC9xyEMmlamPjrd71ZiD3ZsDUQXoMtc2ZvDfxUFQcKBNSFGYNqdOMoFuw7fV+L3789++M4eoLGtYUfx4IgkYwOYB/2f8uSFBmujse1AmPzEA2IHP9IVTzV4J5NEP7Q3viN3LY5GPQke2azFWbUIIspOFF6YTv8t9bqnFhICv0ftoffCUz7Oxu9mQ3UeE/p7T12jYGyiRyTU40c65GqqiuXgz4Bm66YA6qf30UfuGVirilp80qr8+oJGnb4PzXdQjXZjtQxfKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5341.namprd11.prod.outlook.com (2603:10b6:5:390::22)
 by DM4PR11MB6432.namprd11.prod.outlook.com (2603:10b6:8:ba::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7409.32; Mon, 25 Mar 2024 10:22:52 +0000
Received: from DM4PR11MB5341.namprd11.prod.outlook.com
 ([fe80::31a1:93ed:8501:f2c9]) by DM4PR11MB5341.namprd11.prod.outlook.com
 ([fe80::31a1:93ed:8501:f2c9%3]) with mapi id 15.20.7409.028; Mon, 25 Mar 2024
 10:22:52 +0000
Message-ID: <6f19fbaa-7d32-406b-8795-815d4b383393@intel.com>
Date: Mon, 25 Mar 2024 15:52:45 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 3/4] lib/igt_kms: add helper to enable/disable force
 joiner
Content-Language: en-US
To: Kunal Joshi <kunal1.joshi@intel.com>, <igt-dev@lists.freedesktop.org>
CC: Stanislav Lisovskiy <stanislav.lisovskiy@intel.com>, Karthik B S
 <karthik.b.s@intel.com>, Bhanuprakash Modem <bhanuprakash.modem@intel.com>
References: <20240321182831.1143175-1-kunal1.joshi@intel.com>
 <20240321182831.1143175-4-kunal1.joshi@intel.com>
From: "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>
In-Reply-To: <20240321182831.1143175-4-kunal1.joshi@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN3PR01CA0053.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:98::14) To DM4PR11MB5341.namprd11.prod.outlook.com
 (2603:10b6:5:390::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5341:EE_|DM4PR11MB6432:EE_
X-MS-Office365-Filtering-Correlation-Id: f36030d4-15fb-4315-d260-08dc4cb586ef
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 9B9zlRfInuxxTDqJU1APgzBlQFkON+NRidks02l+n+2bucu03l8GSrKnc0jPrJAhxEr1dBTMBy/1mfbhhCC5mPu4UF0t79hhbZs6chxDxmqxmg9clRaBEbUG4DXqaP2Ih81g+Pj0eRMRnHX7wht2X22g2NtEj4eAVQ+IGc0j41bwI4AylYIxbehs5v9K8hqcuzuPabQ/+zABsSueCB2Hj++/ec2XZw7zrkUwkrCVPfN4fsHtBgirxgkMgmV9dAzcxUAcKrsuuoBxIXbnm3re714jEIizaeBokBxa+QDU7xyH8Mm/J12qO0xJvFUqgkK6cTDLjEMgk/JD/EvO9uRBo+TBKjcM/5hqYFNrh4i2hpoSKPCdxe1T52rlVfGLXfEG6ad6HGOrb+9XHit2LfwqrMg6TUex9uq8LLiqrkYDDt1gsWuzz5xGdAdiCnc6FNP8OCTsSE/+mTF1t2a4BtZ3O6tCM9CN7IZcfICrNNiRVGAOPq1s6BlXtdO6FXSM3pbUe51cTlDSJENFP7Skoexsp3fAz2NfTLf7F9P+kK3sevEXuXWpgbNofnEciFjF5asFBLcni6kXOBChOluI5KplprOqs/Uw1wEk+lWK4yceuZZ6kHSr0sUr07ZVLjEPOJWNb/99l6FcmaSOLLorLdTRRNKysRSi/YT5qyuTg065Poc=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5341.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(1800799015)(376005); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?c05ieHlzcE9EYTVtUlFxOEdSK0IwZ2RWaUhoZFgyL3NvVi9QNk8rRmw2eUNo?=
 =?utf-8?B?UEIydklJQWU0anFXanVpQ3pySldEaEltdUltN1MveXZUTVpybklTRlROWE1v?=
 =?utf-8?B?b3oyRzR2R2RtdWNJeSs1ekNtTGRKMjdSVitEWEpVVk43Q09jTllyK1g0UjF6?=
 =?utf-8?B?TTZLYzRnMHpYMTM1UmRJMzdZVjlPMENKbEp5WHJzK0tWeWpueW1wS1oyUEg2?=
 =?utf-8?B?V2NKNDRmR0JOS3RyUzhXbVEzamZoLzlua1JVTXgxaVFlTmpRMEt3MlRKaW84?=
 =?utf-8?B?OGl0OUpmU1M0WG1taDRscVRUaC9aZC9OZlhLazh1Nzh1MXdoNmpkNXVVQ1lH?=
 =?utf-8?B?UUgrQ0JGRmRwdkZXU0NGYUlhRitkZ29oa1o2UFVnek5XRytvMUNiaHRIeU1m?=
 =?utf-8?B?RGI4MzdveHJnM0ZwQWV3RnhCNmhXRTM4bEF0aGZUZytpZERiZEFXelNPVnFL?=
 =?utf-8?B?OVJHa1VTZ1o3Y2N5RHBzVDB6Sy9aRGY1ZnZzUXNRa1owWlk4TUQ4ZGtsWjEz?=
 =?utf-8?B?bGx1WG41OXpnS0RSU3N1dCtkZkZGdGFkY2VqMGxpM1g1VFdFbkx4RDcrcHgz?=
 =?utf-8?B?N0dmVCttZFFqMllWRGFDSU9SSEUzU2d6VHZMNnkwUk1HR05qam9NWWkzSzF3?=
 =?utf-8?B?SU5qUXNVbGdMU0hPblZ4cHdwQ1ZjUTJlQ0I3VmxFYlUzRGJsekxyMWtVeS9F?=
 =?utf-8?B?QlhMTjc3ZFZnS0ZwMHB2TXo0WXFHM1ZDdkJwQ2M3YlNCQmtlVlJPSVR6c1lw?=
 =?utf-8?B?T1F3amIwS0RrZUJueG4vZTBQenQ3dURza3dFMkt4bUswR0x4aTNUL2VlU2I3?=
 =?utf-8?B?WGZlaVdNSzZHWldjWWVLbXhpcHp2a1FzV3p2bVBNZTRDdEpyZHcwODNjc1F4?=
 =?utf-8?B?UENuRFBUVFRrV3dBU3ozd0NRK0lKbEkxT3RRcnRFRXc4YWdzaFVjM3VOT0hw?=
 =?utf-8?B?Y1ZXM0I4SGtYRWpxOXVUWlZDaU5DamY4MklrZHVHQzdxSVZ0YnFEemtWZU1Z?=
 =?utf-8?B?T3RaSm12YzBqdFlGZ1Nwend5UnJJTVN5K0lpZ3g5bW1jV3VkV2huNVFibjJQ?=
 =?utf-8?B?T0daUXRtZlFvV2tta3JZa1ljM3RwSThMNDZ4YmpDRURXVlplZEkva1gzcVhw?=
 =?utf-8?B?L1JWZXN6ancyZlJMSkd5Mk5TZk1kd1pTalJoQTJ5eVBhM1F4THNpUy92bGxM?=
 =?utf-8?B?MWlpMGRycHRDb0FQNzgwNWxTRk1qRC9pd3RwSTVlYjkrOUtWMEpjVlJGQ2o1?=
 =?utf-8?B?MkJNMmR2bDB0SlphMDJ4VTBZT3F1NXE5NU0xLzVIeVlmMlhoSXRaL09MSGpD?=
 =?utf-8?B?Y3F5OGhxMTZPWHo0RmxJczBGcDdaRzBzbWJLcVFtWHJMTStDdXoyNStURmt0?=
 =?utf-8?B?SzQrS082TUE0U2tGdkVsNC96eUhaajJvbWlSbVZWdUIwYStoNmcrVUdzN1pL?=
 =?utf-8?B?dUZPeENHd2hFV3RWMlhNR1ZsQ3JYYTNuY3ZadjZxb05lVkhRbmY3MTZYdDlI?=
 =?utf-8?B?blhhTFRqWmw1OGVJZ0pqMFBDbFcvUkFFNXRtOEh2dVRwMXBidEIzMVQ5QzZw?=
 =?utf-8?B?NmVoUTFKZ2w1ZHpzUUIybUEyQkFaYjlDUXZ5THpOVWYyWlhhS0lScGIxak1U?=
 =?utf-8?B?YWY4L082YXd4bXkxVVNQTnFFVEVndmVIU2hYdFdKWlBpdU80TGMvUmp3aWVl?=
 =?utf-8?B?TlpLZW12dkFSLzV2ZHV4SCt2NUNuYVFFVVgzb0xIaVBSVEtXd2dQbnlzdUJ6?=
 =?utf-8?B?all4UjBVWXBtVlJrRmxtaitNbm11bDJ6YW5iL2FSWmNNdWI2dko4aWFxY1cy?=
 =?utf-8?B?bmhuWVV0TVQ0QXRTeGRaV01DMGxzY1RsU2RtNGszTkd0L0NKbVRGalRmQVdo?=
 =?utf-8?B?N2hsSVg2WjlBMDlVWCtoRzU5OHBGejErYWR1OFZiM2hZeGhLWllhdDdWQTI5?=
 =?utf-8?B?UTdVWnA0emRUdE5QVjB5dTgyZjhJMFQ2YXV1cHN0NW83NndUSHB4S3Y1ZjJN?=
 =?utf-8?B?cVA5STd0RG1RVnJLR0ZqbGJ0aXh2NnJkNmlyVmN5K2NpMndHNWw0RlAwVGlp?=
 =?utf-8?B?WGxWeFZjZVBYdFNQNGt2VXN5NzNIR2dWVFk4L1ZoQ0E4ZmM4N2NBSGtEaml1?=
 =?utf-8?B?c2VCS1VvajR1UEpyTUIxVUdOOThSVDZQejRXMThDbEhsWFZrdjZIS0VRUjBa?=
 =?utf-8?B?REE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f36030d4-15fb-4315-d260-08dc4cb586ef
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5341.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Mar 2024 10:22:51.9794 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tGerz4D990H8JbGSDqU5fJAfiT+vYKHtVImKdfukuQVrfBfhsFX4K7tQvxz5xPegduA1pgtp2ozjc4ixlr7NG8U/SflCvs007+xwOnuVpbQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6432
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


On 3/21/2024 11:58 PM, Kunal Joshi wrote:
> v2: Add documentation and rename (Ankit)
>      Combine enable/disable and status check (Ankit)
>      Don't assert in igt_has_force_joiner_debugfs (Ankit)
>
> add helpers to check whether force joiner debugfs exists
> and to enable/disable force joiner for a specific connector.
>
> Cc: Stanislav Lisovskiy <stanislav.lisovskiy@intel.com>
> Cc: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
> Cc: Karthik B S <karthik.b.s@intel.com>
> Cc: Bhanuprakash Modem <bhanuprakash.modem@intel.com>


Missing Signed-off-by

With SOB added, this is:

Reviewed-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>


> ---
>   lib/igt_kms.c | 51 +++++++++++++++++++++++++++++++++++++++++++++++++++
>   lib/igt_kms.h |  2 ++
>   2 files changed, 53 insertions(+)
>
> diff --git a/lib/igt_kms.c b/lib/igt_kms.c
> index ff08b0eda..3d9796529 100644
> --- a/lib/igt_kms.c
> +++ b/lib/igt_kms.c
> @@ -6171,6 +6171,57 @@ bool bigjoiner_mode_found(int drm_fd, drmModeConnector *connector,
>   	return found;
>   }
>   
> +/**
> + * Checks if the force big joiner debugfs is available
> + * for a specific connector.
> + *
> + * @drmfd: file descriptor of the DRM device.
> + * @output: output to check.
> + * Returns:
> + *  true if the debugfs is available, false otherwise.
> + */
> +bool igt_has_force_joiner_debugfs(int drmfd, igt_output_t *output)
> +{
> +	char buf[512];
> +	int debugfs_fd, ret;
> +
> +	igt_assert_f(output->name, "Connector name cannot be NULL\n");
> +	debugfs_fd = igt_debugfs_connector_dir(drmfd, output->name, O_RDONLY);
> +	if (debugfs_fd < 0)
> +		return false;
> +	ret = igt_debugfs_simple_read(debugfs_fd, "i915_bigjoiner_force_enable", buf, sizeof(buf));
> +	close(debugfs_fd);
> +	return ret >= 0;
> +}
> +
> +/**
> + * Forces the enable/disable state of big joiner for a specific connector.
> + *
> + * @drmfd The file descriptor of the DRM device.
> + * @connector_name The name of the connector.
> + * @enable The desired state of big joiner (true for enable, false for disable).
> + * Returns:
> + *  true if writing the debugfs was successful
> + *  and the state was set as requested, false otherwise.
> + */
> +bool igt_force_and_check_bigjoiner_status(int drmfd, char *connector_name, bool enable)
> +{
> +    int debugfs_fd, ret;
> +    char buf[512];
> +
> +    igt_assert_f(connector_name, "Connector name cannot be NULL\n");
> +    debugfs_fd = igt_debugfs_connector_dir(drmfd, connector_name, O_DIRECTORY);
> +    igt_assert_f(debugfs_fd >= 0, "Could not open debugfs for connector %s\n", connector_name);
> +    ret = igt_sysfs_write(debugfs_fd, "i915_bigjoiner_force_enable", enable ? "1" : "0", 1);
> +    igt_assert_f(ret > 0, "Could not write i915_bigjoiner_force_enable for connector %s\n", connector_name);
> +    ret = igt_debugfs_simple_read(debugfs_fd, "i915_bigjoiner_force_enable", buf, sizeof(buf));
> +    close(debugfs_fd);
> +    igt_assert_f(ret > 0, "Could not read i915_bigjoiner_force_enable for connector %s\n", connector_name);
> +
> +    return enable ? strstr(buf, "Bigjoiner enable: 1") :
> +                    strstr(buf, "Bigjoiner enable: 0");
> +}
> +
>   /**
>    * igt_check_bigjoiner_support:
>    * @display: a pointer to an #igt_display_t structure
> diff --git a/lib/igt_kms.h b/lib/igt_kms.h
> index 0fa7a2ea1..6d13e5851 100644
> --- a/lib/igt_kms.h
> +++ b/lib/igt_kms.h
> @@ -1214,6 +1214,8 @@ int igt_get_max_dotclock(int fd);
>   bool igt_bigjoiner_possible(drmModeModeInfo *mode, int max_dotclock);
>   bool bigjoiner_mode_found(int drm_fd, drmModeConnector *connector,
>   			  int max_dotclock, drmModeModeInfo *mode);
> +bool igt_has_force_joiner_debugfs(int drmfd, igt_output_t *output);
> +bool igt_force_and_check_bigjoiner_status(int drmfd, char *connector_name, bool enable);
>   bool igt_check_bigjoiner_support(igt_display_t *display);
>   bool igt_parse_mode_string(const char *mode_string, drmModeModeInfo *mode);
>   bool intel_pipe_output_combo_valid(igt_display_t *display);
