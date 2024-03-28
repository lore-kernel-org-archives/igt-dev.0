Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B08AEC54E67
	for <igt-dev@archiver.kernel.org>; Thu, 28 Mar 2024 02:03:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3EDBE112299;
	Thu, 28 Mar 2024 02:03:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mABb+sIy";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A2910112299
 for <igt-dev@lists.freedesktop.org>; Thu, 28 Mar 2024 02:03:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711591383; x=1743127383;
 h=content-transfer-encoding:in-reply-to:references:subject:
 from:cc:to:date:message-id:mime-version;
 bh=hVrSTYMbmPNdBdhun74eyslh4D2kL5NBcx55ye1RCu4=;
 b=mABb+sIyFaxJdJrCaCVXJMToDkBYwnYZRxEEdy1Vg9ZxI7wTWZVPlQzU
 J+KBVoHp9ZuyFHIA5Kt0FfN8sE4XVuC+oVC0VTGkLsuKB5ZhwMhBSbifw
 jKJL0sobuTha2ET+BUTD0BjPoX+7BhSDaJw/F3PuKnL07ghiCVRd7tWqk
 00Xhcp9Agziwq/7eG8VkhEH2J7S345RXJxVc8vnRXWNmY3+3FAJ6QGFv3
 HA3RFX5a5ry5o7JzVkjbVIuwMGERIueqfu9K0xcKCD9+IndaQRs+zmPTA
 TNuHDdmK6C/X9YEm+hOqYzjysQup4OznmzaQEOpZkSRQz2UASI45KeuDE w==;
X-CSE-ConnectionGUID: QmS8AtlWShWWQ3tsl89pvg==
X-CSE-MsgGUID: mkSmii5jRZiQ1QEIp3+4ag==
X-IronPort-AV: E=McAfee;i="6600,9927,11026"; a="6589892"
X-IronPort-AV: E=Sophos;i="6.07,160,1708416000"; 
   d="scan'208";a="6589892"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Mar 2024 19:03:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,160,1708416000"; d="scan'208";a="17112712"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orviesa008.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 27 Mar 2024 19:03:01 -0700
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 27 Mar 2024 19:02:59 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 27 Mar 2024 19:02:59 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.169)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 27 Mar 2024 19:02:59 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OkubipmTKHQ1Kw7rD6bWCwXLNwv5xSGFc7o0hJIljwiROo8iOCxbnvahKY/tOAqMtOyLmD3FaVafdrk3UMaMwDsckmKfrIGXJ19L2d09y2EHzTPspNWnIIjXBdBTxMZO9YwPNPBGOXZoC3UxAHhDRmCpTni0yVZ6m6l9G15qyBHyXU4VWBYQhzepsRhvFB7mkLC8eBzhDVpNLfNxveVQjYmSFZxeHb7SQ4xYUf8r6JmAbdav77ZftKRm61/ZNt/GAsOEYSWirAGHSNrfZIhzu5OyU8djLXWSyN9l9kDOPqOHQ5r8FIc3/ksmnq+QOePD8Y2H+1TcQQ0Lybr7S9jGIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Pfx0mDQGpev+YxXJMJzSQIQ7+Ze4J/jg2OssO8hdj7Y=;
 b=XGklAwogsrMYO7Uy1q0K/QTb8meNhBIhOpSNJ07fhVPXXb/pr495IaBGMApn5T0R/8EdU44hdIG9anU9HCfxTKV6M4kw5net3GA8vf/u/+AG9E81I+XfowxVP0cSE18ff4u+F8EuTCcOIJ33DDVar0UhSSdy55QxCyRuP2g4GExFvEMYs3v5hO6CUB1j+1Ji8AWar/BpeZ70Tt3EDT5Q4Hx8T78LacSthlD3PpKUIkN2PfqRr0780S9WvZM/IyOBUCjsF6ZdECq84VyAmGi+G8FYJiCbpdaWUsj+Sik9vZdZQ+lS4WWJhs4E7suArxTVj3xmkq+Ylr5WWGWhMTcBaA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8287.namprd11.prod.outlook.com (2603:10b6:510:1c7::14)
 by MW5PR11MB5884.namprd11.prod.outlook.com (2603:10b6:303:1a0::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.31; Thu, 28 Mar
 2024 02:02:53 +0000
Received: from PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::3191:4863:ad54:bdb1]) by PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::3191:4863:ad54:bdb1%4]) with mapi id 15.20.7409.028; Thu, 28 Mar 2024
 02:02:53 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20240327234732.GF1332995@mdroper-desk1.amr.corp.intel.com>
References: <20240322221908.857024-1-matthew.d.roper@intel.com>
 <171154886764.4174.2317120354856149525@gjsousa-mobl2>
 <20240327234732.GF1332995@mdroper-desk1.amr.corp.intel.com>
Subject: Re: [PATCH i-g-t] tests/xe_compute: Don't require ccs_mode on every GT
From: Gustavo Sousa <gustavo.sousa@intel.com>
CC: <igt-dev@lists.freedesktop.org>, Niranjana Vishwanathapura
 <niranjana.vishwanathapura@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>
Date: Wed, 27 Mar 2024 23:02:47 -0300
Message-ID: <171159136738.2300.12315030317124177867@gjsousa-mobl2>
User-Agent: alot/0.10
X-ClientProxiedBy: SJ0PR03CA0131.namprd03.prod.outlook.com
 (2603:10b6:a03:33c::16) To PH8PR11MB8287.namprd11.prod.outlook.com
 (2603:10b6:510:1c7::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8287:EE_|MW5PR11MB5884:EE_
X-MS-Office365-Filtering-Correlation-Id: 0a1b64dd-d3ef-421a-9f3f-08dc4ecb2d3f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: aDoxRYT9HLfka26+nciTrMh8Xi3NfAhG/X64sJXiYIFluYFnWK+xFtTHJDx29suFzLITDqzWzMtIcgMUncjULTcsP4ukfgQXWl+eMbe+k/2yg8xCuMssaM4WzgLYMCNnXs2VJMmmzWnvzjkpzf5NKp94UiiSlz2g/6pss+BWUbQqCaa2p2LG/codPf9r2WCaW7ttvjAg20LX9kqxffBkIc3VPns9jxpZfcEK1urQS5SmXQmOr+OoQI48Kh5JZvN2x6W2cDCTj9qZ8wYd9L/e/efMSlLWVDOB0gNnv4px38YHx3ntS1Il3wyYUdvzCQA0vphYqoEOMFy+AkeEqzz+c3IGPAXtJIZCijYrppnlW+qgzXNn2Js+I0RT5mSkJ98RB7hTGOAp6JxTlkPeWElPx55f/FLvWaxa3poodt0uyrcMucnP2p+cW3ZfqDKDNP3hA5dp3DKdtqmBj7SrM2afHc2Jl/6Bt4ApyR08Bab8FfHucvInlf1LEv1ekCmuGU7fYiwheTF8K0ZJf6xHVwEi6yQFCBm1NwuFR0++Dj7vK2fw31LVUkYn2rgdoSdPZW+SPX18HwEx16hhXpzfFYBts0mLkCsHCagc3qhj0O710MH22Kzf2PEgaEKmm2L0GhTGOqyKm2M81Dw78nUrWaId1yzzBFdWnf8geo3yAdduG1E=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB8287.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(376005)(1800799015); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dE1Yd2pVNFBlQzZzV0cxWlo1VDUyRXpmM2pxcWpJeFRHbFhWTUtaZXVYaE1P?=
 =?utf-8?B?M3MvMENRYkovd1RxSTJEdEQxeU03TmgwUCtTYXdLanZIYkV2clE3czZUdXV6?=
 =?utf-8?B?cG9OMFRjem1jZUllVVhlMm1qa3ZBMmxzTHRKLzBZcW81c0xBcGZZRU5UOWZD?=
 =?utf-8?B?SERKamhZQ1ZkTjVOeXpNUmVhLzh6b2Y4SzE3dWIvenVBY1JtM3RaWURaZHVi?=
 =?utf-8?B?ZFpOMmxsY0tVK1h2QnRDTUlOVUZKWmR3akM2M0kzZ3EyY0RlVGFvNWZVb0I2?=
 =?utf-8?B?eFhmNEdvUnBPNnh4NVUveFBXKzhRVlZIYVNpTnAwek1acGliMkgxR1ZCY3Zk?=
 =?utf-8?B?OFExbE5pdmpUKzdNeElEa1o5UGgwVWhkWFdwVWw1Ym1rZXdZcjhKRnhZR3hq?=
 =?utf-8?B?VW4vdHpMaExHUWNTU2FyT1hkNmVNeldFOUVOUmVEZVFzaStkSlB1RWZXY2Fh?=
 =?utf-8?B?YVIwOVlPLzByM1RzN3lzSkQ4ZmJ4UFBaVGY0Y2VKNExXRThnT0huUFd6d0VR?=
 =?utf-8?B?SExzUGorcHJON2V4MGd6ZEpXOGd2MVRwT3R1K1p2VkYrYzR0eWVmMTdYa2hx?=
 =?utf-8?B?dDg5YVp1cnQxVEFmZll4ZUYwOEJpMlB0MXFZNXNYeG16WW1vN1lIanlhM0V2?=
 =?utf-8?B?UWdORDFrK3pJbXQzazFoR1RuL2pXQnh5QllXb3dmbFB2d29SN1MyTnhsUXRj?=
 =?utf-8?B?bDZ2ZG13MXdQNHhyU3JIM1dHMTdJZUhSTFdVZ1diVmJ5b2poa0NubGo0UGcz?=
 =?utf-8?B?MDJjbGxNWEN6cTJhckdZWlROTUlvVVl0OFBaSVdSd2RIRGl0bElyelJsTmZj?=
 =?utf-8?B?RlZwS3F0LzNWUjVLcFRaMjhpUFgrYmNMMWlobWIxTVMyK0NBTEJZaUttamxL?=
 =?utf-8?B?UHJxR3JqL1hTR05HRlE2UVp5RzhxZVo1aVlIakh4cWhnWTNwdUJRZFJSTnR3?=
 =?utf-8?B?UjQ0cHBiRHdWUDFLUWl6cDM5K0RkTWlpUGlGRjVmZDVYeHZUa2dQL1prT2c1?=
 =?utf-8?B?K3BhelNoZ3FOS1pqTlhrOEtKTHBuNjUwdUgvMUh0ODhyYnFraHluVGdRdFRX?=
 =?utf-8?B?dlVTVVNDQi9ueUZkcW9ZYUFrNDYvSTZDT2k2WFRrSk5TdFBYTjhsNjIzU0V5?=
 =?utf-8?B?eVBuNmxXeXlGRHVJQXBKZFhENVNiTnlGaVM0TEtoUzE1eC9ydVplVUlNVmxq?=
 =?utf-8?B?SDBDUHp2a09Vb3p6R3cvT2YxUzg3WEI5aUJ3RmZLQThoVEs1YVUyN056ZjRT?=
 =?utf-8?B?TldNYVZBaDNLRkxQNmg4b2V6bnpZSlllS0I3eEpRbFlHTWd3Mk0rUnNkVFov?=
 =?utf-8?B?ckNqam84VStLYXhpbytscFZnUGxkaUN4M3lqOElxU1ZEWkJBSjhUVFQ1QWNP?=
 =?utf-8?B?SndueFpoZnRQR052dC95NTR1WXdJQlJSSEVBZmdmYldaSW40NXVkTjFzQmFn?=
 =?utf-8?B?eFI3RFZkVHd0eGw1WlVWV1JQWDVyckhZNUNLc1JRTVE1NTZlbUFHN1RrQXd3?=
 =?utf-8?B?dzhOY3IvenM4ZWltYk5Udm05V0V2T1dvalFmMjBPdCt1c0NTdWsxaEZUdllX?=
 =?utf-8?B?dXNGYlVaTE0xaDNUVUN4TzVMVVlWczhML3h0eGtsSmpBVmpmeHpCN3hnWEFp?=
 =?utf-8?B?aWlUaHVKdVhNQlRzcVF3RW5wUHVrWk1uVDlieWdxV3ZLNG5ZWVNJZnNQRU1Y?=
 =?utf-8?B?aGdsZ1pVZXhEQWZhYWRmWTNMaE5ONUthZnVPN0xLTm5aZnZ3VGtmV1k0ckx6?=
 =?utf-8?B?OGFrMkN4WUNsS1hjN3hPR1hEeEdTb3Iyb2pUUHR1SE94MHFoSnJGU21rdUJm?=
 =?utf-8?B?blZtZVdPQytJaEt0SFpTdUtZMVo4ODN0RHJUN0tIeW1jUVQzRG5rdU9GK01W?=
 =?utf-8?B?UEV2bVc4UkNWZGFXQXRjOENleXQ3bEdOanExZFRnUXBYUHNkUG5pb2pQbzVC?=
 =?utf-8?B?RXdKc1ZHQWtLRkFWdVN5RldLclJCcm9LNWtsc2V6TVVjMFpZQUF0WEM0ZTZO?=
 =?utf-8?B?Z0NDYTFsTUhPL2VrWk9EdzlqT256MkVJZkFGRGxKQW5Pa0JkdEhGa1VVbXc5?=
 =?utf-8?B?YzBoRkpCZnJzV0IwUCthN0pZbkxYZkVtM0hhNVFvcS9yZnJHV1lZRDllU1Nu?=
 =?utf-8?B?SDV1T1FrN28zQWpkL2ZLSUFYSnRrMXkrRnZOZVJYelJCRG44TWY5ZEZ5eERi?=
 =?utf-8?B?ckE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0a1b64dd-d3ef-421a-9f3f-08dc4ecb2d3f
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8287.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Mar 2024 02:02:52.8955 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uI6kDVV/UfMdIbhUyccLGi6yO7QdOFn3j+t+CBWeYJJp1rYrW3HyjwfH8mUCEMpRbolWmS3WrFiNTShQhOToNQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR11MB5884
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

Quoting Matt Roper (2024-03-27 20:47:47-03:00)
>On Wed, Mar 27, 2024 at 11:14:27AM -0300, Gustavo Sousa wrote:
>> Quoting Matt Roper (2024-03-22 19:19:08-03:00)
>> >On platforms with standalone media, we expect some GTs to have CCS
>> >engines (meaning ccs_mode can be tested if there's more than one CCS),
>> >but the media GT will never have any CCS engines and will never expose
>> >ccs_mode.  Move the igt_require() out of the loop so that we don't
>> >declare the whole test a skip upon encountering the media GT when the
>> >test already executed successfully on the primary GT.
>> >
>> >Cc: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
>> >Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
>> >---
>> > tests/intel/xe_compute.c | 8 ++++++--
>> > 1 file changed, 6 insertions(+), 2 deletions(-)
>> >
>> >diff --git a/tests/intel/xe_compute.c b/tests/intel/xe_compute.c
>> >index 42f42ca0c..fffcfa08e 100644
>> >--- a/tests/intel/xe_compute.c
>> >+++ b/tests/intel/xe_compute.c
>> >@@ -51,13 +51,15 @@ test_ccs_mode(int num_gt)
>>=20
>> Looks like we also need to fix test_compute_kernel_with_ccs_mode()?
>>=20
>> > {
>> >         struct drm_xe_engine_class_instance *hwe;
>> >         u32 gt, m, ccs_mode, vm, q, num_slices;
>> >-        int fd, gt_fd;
>> >+        int fd, gt_fd, num_gt_with_ccs_mode =3D 0;
>> >=20
>> >         for (gt =3D 0; gt < num_gt; gt++) {
>> >-                igt_require(get_num_cslices(gt, &num_slices));
>> >+                if (get_num_cslices(gt, &num_slices) =3D=3D 0)
>>=20
>> This next comment is not really related to this specific patch, but I
>> wonder if `igt_require(get_num_cslices(gt, &num_slices))` should have
>> been `igt_require(get_num_cslices(gt, &num_slices) > 0)`, since ccs_mode
>> is only exposed in that case.
>
>get_num_cslices() actually returns a boolean success/fail for whether it
>was able to read a value at all rather than the number of cslices it
>discovered (the number of cslices is instead returned via the num_slices
>parameter that gets passed by reference).  So I think the check should
>be correct (fail means we couldn't read the sysfs, usually because it
>didn't exist on this GT).  In v2 I'll clarify by checking for
>!get_num_cslices() rather than "get_num_cslices() =3D=3D 0" since that's
>more appropriate for testing a bool value anyway.

Yep. Thanks for clarifying! :-)

My bad on not reading the code carefully.

>
>The two sysfs nodes this test uses (num_cslices and ccs_mode) only get
>created if the GT has two or more cslices.  Arguably we could improve
>the test a bit by adding some assertions that we never read a value of 0
>or 1 from the num_cslices sysfs (since the sysfs shouldn't have existed
>in that case), but that's getting a bit away from the goal of this
>specific patch.

Alright. Makes sense.

--
Gustavo Sousa

>
>
>Matt
>
>>=20
>> If so, then maybe add a follow up patch replacing `get_num_cslices(gt,
>> &num_slices) =3D=3D 0` with `get_num_cslices(gt, &num_slices) <=3D 1` in=
 the
>> condition above?
>>=20
>> --
>> Gustavo Sousa
>>=20
>> >+                        continue;
>> >=20
>> >                 gt_fd =3D gt_sysfs_open(gt);
>> >                 igt_assert(igt_sysfs_printf(gt_fd, "ccs_mode", "%u", 0=
) < 0);
>> >+                num_gt_with_ccs_mode++;
>> >                 for (m =3D 1; m <=3D num_slices; m++) {
>> >                         /* compute slices are to be equally distribute=
d among enabled engines */
>> >                         if (num_slices % m) {
>> >@@ -105,6 +107,8 @@ test_ccs_mode(int num_gt)
>> >=20
>> >                 close(gt_fd);
>> >         }
>> >+
>> >+        igt_require(num_gt_with_ccs_mode > 0);
>> > }
>> >=20
>> > /**
>> >--=20
>> >2.43.0
>> >
>
>--=20
>Matt Roper
>Graphics Software Engineer
>Linux GPU Platform Enablement
>Intel Corporation
