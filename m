Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D83CC44501
	for <igt-dev@archiver.kernel.org>; Wed, 15 Jul 2026 12:16:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D95010E194;
	Wed, 15 Jul 2026 12:16:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WLtM7YEK";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 813DD10F023
 for <igt-dev@lists.freedesktop.org>; Wed, 15 Jul 2026 12:15:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1784117729; x=1815653729;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=mqUhPj9Qf/zVTiyFA2Tg9tInpdhbKPsMHJQKMrLK7qM=;
 b=WLtM7YEK3VUe7A756+7Dse4LkpiEe9jKe64jX+aON9HWU66pVuiPd9yQ
 /bP51ESrJDbr28pTFDis63/X7Nkimb12Th6/yNLJnHWmdSrjGDZVtnJse
 anNUS5I3RJOfOn2g+ObSqbjsqdxTHk4XqVptl1XHYEqgjm1woNYwTNeVL
 zJiIpvZfbBF9NR5jaP6LqpQOzX9fB5hPh6DKUW6x/MEzEs8z+upwd+nyS
 cQ0TOVxIAhDVltt6VTCbDnmpkZEzggMN/Wn9D11KJJfsWK5T9AMBc8kw6
 TeZKbT6xKQHKv4j6XSjEYRLkZrkQz/d6lmd4tswEUZK2qAaRNRnOB+xt7 A==;
X-CSE-ConnectionGUID: 7fKOqkvIS8StOsYPCEF5XA==
X-CSE-MsgGUID: 7a6N9c/KSKSRQJrPJ0slLw==
X-IronPort-AV: E=McAfee;i="6800,10657,11847"; a="83872625"
X-IronPort-AV: E=Sophos;i="6.25,165,1779174000"; d="scan'208";a="83872625"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jul 2026 05:15:28 -0700
X-CSE-ConnectionGUID: kBwoxmxoRnyKd+ynJZnRcA==
X-CSE-MsgGUID: S3Ip9ZODQxq5uAzNlr/ihg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,165,1779174000"; d="scan'208";a="255046088"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jul 2026 05:15:28 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Wed, 15 Jul 2026 05:15:27 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Wed, 15 Jul 2026 05:15:27 -0700
Received: from PH8PR06CU001.outbound.protection.outlook.com (40.107.209.52) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Wed, 15 Jul 2026 05:15:27 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=F83/ctZtPUwhDGpByXVnFuu642b1RCJKT1iOn3LvVw8QjIWmPBCVoNn1JxWk9v4b0mnj0q3q0UBE3xdn8cNvHBXcIuP72Tq5qN98VeQ2p2rVNkbMZbxWkpX/yvTD9Xh+r5fNkRlzmcUSRwpOTWBBkVTL8UcOOHdqYDWctBWw451pg8m13Yz3ZHdTFdAVwHr+jWzqQAYP59i+VPC2b4yrYTV2nFRVQyLNUSP61XuaOJMOn5UwbjhchCjBMzg5KZLbVQ/tD631cOY/Qeqf9m4v8reFSfJh9o/ZXC2EhqB8YVIVQWevArMvZg6KYdXQktZ35sV71TEREwpIkLH/O6p5RA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Pe9/4iXp+ATqglGzRc3YPmEJBBUQSRDUg1Kutnv89fk=;
 b=J8NSk4VSWGSzR68dOdbciLTZtP3Jwxf61S32kGrC43YcyyduIw1D3uQlPvYPWor3YWpsx9hucOeI5x3ezIz6DnR2ZLAkwMULJk27iFJ/9TPujrNXEC7MBODRu1thzcjle6rKm904x//rCn7uBQ9fwBOwJ0wt7DcA1KL4Y1IN/W56h+Wwqe/7ga4H693yrLWSGe1kTfy+KRm6pNDcvWw6uT/8zcCEdUhx5nqGk9f/TsNsI7RezAO6ZxsErvORuvCKfnJlVjZCvuzvqXB5ea7Eqb/vzkvZzFcBYrc5fAs3WzIetn6C1XFEqCF7zVTEHZP1XVm3Zc5RUCGsPpgF9S+MgA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB6909.namprd11.prod.outlook.com (2603:10b6:303:224::12)
 by CH3PR11MB8096.namprd11.prod.outlook.com (2603:10b6:610:155::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.10; Wed, 15 Jul
 2026 12:15:24 +0000
Received: from MW4PR11MB6909.namprd11.prod.outlook.com
 ([fe80::9eab:962:806:3794]) by MW4PR11MB6909.namprd11.prod.outlook.com
 ([fe80::9eab:962:806:3794%4]) with mapi id 15.21.0223.008; Wed, 15 Jul 2026
 12:15:24 +0000
From: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
To: <igt-dev@lists.freedesktop.org>
CC: Sebastian Brzezinka <sebastian.brzezinka@intel.com>,
 <kamil.konieczny@linux.intel.com>, <krzysztof.karas@intel.com>,
 <krzysztof.niemiec@intel.com>, Ashutosh Dixit <ashutosh.dixit@intel.com>
Subject: [PATCH i-g-t v3 13/31] tools/intel_gpu_frequency: link with minimal
 sub-libraries
Date: Wed, 15 Jul 2026 14:15:23 +0200
Message-ID: <e70c0920805053f3255a1a1a3784b76958aa895d.1784117512.git.sebastian.brzezinka@intel.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1784117512.git.sebastian.brzezinka@intel.com>
References: <cover.1784117512.git.sebastian.brzezinka@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: DUZPR01CA0035.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:468::13) To MW4PR11MB6909.namprd11.prod.outlook.com
 (2603:10b6:303:224::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB6909:EE_|CH3PR11MB8096:EE_
X-MS-Office365-Filtering-Correlation-Id: 45486567-1528-4428-53e2-08dee26abe4b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|23010399003|1800799024|366016|11063799006|22082099003|18002099003|56012099006|6133799003|10067099003;
X-Microsoft-Antispam-Message-Info: mCRbSv2bDrmbPYyuTUetMTv6JsfWo6S2nNEHkSjxxFqAhzLWFlfXcL+s4ezQIxR7h7UMqdSMWapLjk09CKWHqqBE1ZLCP2q+fW5Ui4xo25n73tx9SVCN1AzD4rZ3wVWAcR3yf3FJSmSVoWqo1HzShnd3wLNK3FW8+qIipHSzWZyoemej4vTLuVeCV+kXvZ08It/rqxjVBQHS2oRDlQaNZ8ZdJDcvWQbpWLu9V3N82jmldtMxFpXqFMfyvvuTgjmh321NpJtQO1V7T87WqtUkQH8iaXJ/ai3rRmvTb1y4FuKOkD0EmuBJdZGSCPwyTWV13xT0XTPKAiBVG40XClfVVIBTB5X4lZGm3UZJlUSXgpwQZ11zRdKrSYukxYqENhC4+nZ15ZwosfjNzaWqg1tAVdJIHF+e9tlVwY4VEklaq9704xCzMnwNOaaiVIp0x1JVssAnww4GxVd0cK9hX1hwoo2oeMnQAGN5PsBBylwihhQsDg+kp9W5AlUKPLlo5ud+SJy5gwaexMBgUCcC4igUPPwE1AJfKAfofNJEgXlNKhXRUdbvp/UOi3ACzkUWM+XhiNRoV+YrTzYpARqFut9ZuDz9udDs90pRCPYhy3iYO+YFBkhuPyUS6gYwPdaaT6GCWaGXa7SjpSPN0U3z95wvV9P0gw74qdzpkV2OgBHAlro=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB6909.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(23010399003)(1800799024)(366016)(11063799006)(22082099003)(18002099003)(56012099006)(6133799003)(10067099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?l9XJD40l8kl/gNSQE0UpX7q59QRUBjrVcXnO1tGOjY2oiKN49sgBpHDoMluj?=
 =?us-ascii?Q?IxlMS0QQIbaLzjLqNvb4K99d/YVQSTMjYdjn3XVgO39GP0+ebOf6AxntO1Wd?=
 =?us-ascii?Q?H5VBTCVBq9uwsvuSTyxNLhQkx2QGkaswV9wNSsDvJkKm0SxxpBB8qQCEnxjD?=
 =?us-ascii?Q?hgds+XdM0HLrf07FuOfzzfarX5txKldB5BDdFeMXhe9xou5YavKPgnPsNW5Y?=
 =?us-ascii?Q?bvDz/zne33sX4I8Xl9i2FyWQpsiwTtnTwK4JHfWc2VgFwmr/cYRI/crPTqT6?=
 =?us-ascii?Q?A/LRBZGGGQz82HXBZXQBjI4a6X0el2tpAwjlKtnnXbQ+g80U0xnszkco+0qb?=
 =?us-ascii?Q?3+78z0+k+JyigF10m23AMO6MNEPXmSzlbJw2EGPZI+maq07RyRj5jbxF2qrJ?=
 =?us-ascii?Q?DqqbgQmGktXsnPEzyXoJH6g2VusgmzdY8GMwe3SFcmdqFsxNK0PkT3RqQnGt?=
 =?us-ascii?Q?Gbj7/Jvem5zXw4U4wsatMAlvEdf3IxSSSYXU08OlxQC2yrpATgrepFRWvBic?=
 =?us-ascii?Q?Pa44ISg0MR+osXBKjPw+HASyH9AfvkK4NDvnMVfBg+N90szmKdBZms+cBtLd?=
 =?us-ascii?Q?63Lp8xD0nEZ6DRBtV8ZQzGxTCVvuyEirL5tWL9gUmY4fQvV2OPjDi1xkMNIk?=
 =?us-ascii?Q?gmjnxMCYWTPTFKo5DaCS52BW2P9dD6G+zd/pmE17Tkf9Gfhlke/ANn+qmiQL?=
 =?us-ascii?Q?kf8hsl6U5Gn+zBBuX8IskokQDEz/gkEbau+Che+9G2RJ2u9cGxVoibPNsRD/?=
 =?us-ascii?Q?Wu8LrxlCv2s7mRrOEqHdpNWIALv4t/xrAhjgK1ZH5QtND35NekquBxctIalr?=
 =?us-ascii?Q?YL4wR8qjswCz7HNCqQ3XI85GEUe6EMbXvSzeEkfgxRbSUlgMK0twEkPL/LrX?=
 =?us-ascii?Q?mDCUh6CNnv1boaGdINgFQFgS2HOLj+YcK1M3p/6xLFUStKAUY2AUSD4EX52T?=
 =?us-ascii?Q?ij670gxaFUZUDnhFWILJBWyrgwnY2hNmjFzcx/LeL2XZrE6nTCjQwJL5PK7e?=
 =?us-ascii?Q?36ukFXP0x8y70qltKnmcDl+TxiYZDDgoVKEO1P7YzoKWHSz+ISCGzpCT6TC8?=
 =?us-ascii?Q?pfWEXYmE6MpiKTHU69NYjJYvKYyNfA4uRp86OMKQCYAL19pT5dRorbKsocpy?=
 =?us-ascii?Q?5CYvANyVLaKPkPRqQhtFsgufdM80S+FxdV1PRsdmxUrW41H7ShkNlGCaeeE6?=
 =?us-ascii?Q?ZGEwi7jHLFGIo0Jr/5EgRGA5RjDFy0UtDM43q11ygLsEjkQWld/7GwzvIJZI?=
 =?us-ascii?Q?U0RP7IVleElAawuUr2+GVAUzhlNJyYHypJhcVpDLSYDUS/sJt+WUuS/ZUe9q?=
 =?us-ascii?Q?P+fXMXJSCgV8LO57jWdp9DOHGfJct+XWlXKoAio0FL5bQlnLdXsdrouTUbZ9?=
 =?us-ascii?Q?6exGA0uvpTpVCZa2K3UctFO8LBwpagDQP2AwZyManmyLYzQpPiF/+klkNWyx?=
 =?us-ascii?Q?eT0DPOOMl1mf+RAoGskPVcy8/kdKpq/eCRxIsi5ubwoIjb8eEsU1pl5NGzTl?=
 =?us-ascii?Q?aX/2uUA6xeD6kqIeCBa0lP7GpReIhcQSvrOSkEQneU/dL8xEMy5N7got0sJ0?=
 =?us-ascii?Q?szI1iv7OPDxdt5x1V15BPrwTK1tC35LEqM7RLVij7dhao5B2kCqR+B/1HNGD?=
 =?us-ascii?Q?UhL1JJhEoTo4gPdiwmcHWx/PArNhYLjCJVkTW185iCdnXxILoNkSbWYRqxwR?=
 =?us-ascii?Q?vbWLb1GC8Qxdd8MrSCdkQracgnqB2D0FHMnAw6XaBlqb8+/6fngvF5zGyNms?=
 =?us-ascii?Q?R40fWMGGbag/bOs1tn+MPcynUvTSY88=3D?=
X-Exchange-RoutingPolicyChecked: SCHgaGdqi1WuUl+qecnzYE8E19YefSbGyo1m8OaiZV8TjYm7hqdK/b46Rt/ouhwDNHX6A3dXcEr3V5xgv9ca9yjXLZZ+3/dvylibhVOQU3+a6NWCUutqlplCt0CVVJLJsmDVY8kxscSZLGqhKAwLm+mo5N7wjUxnkpgQ9HW8buZS/83xut+PQhJWybqWnFRfS0uZRpfd8h/Z3HEOHHIcx/iI2y7YBTruQGopFcGS3sDPa6gJK5UP76A00ZjpAb3GcGfWmhYJZk/SDvveC7xT565mbMMRFpFWoXlCuHil4z+JKYcS3r2Mj4llNCtu8MygtO15T9CwuqV5kpuBMJ+KHA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 45486567-1528-4428-53e2-08dee26abe4b
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB6909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jul 2026 12:15:22.2437 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: g8y7Z8k485k7jwVNdZm5QxVf2WYYktXCZQya9CMSo/rHFsAp7yj8W9VLs7IpBbKjt+tcAMaGJL5uzAEC/CK5yy3H3+BFpDMACGJm3LnPtaE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8096
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

intel_gpu_frequency needs only intel_gen/devid helpers and a DRM device
opener to query the GPU frequency.  Link it against lib_igt_chipset for
the devid helpers and lib_igt_drm_stub for driver detection and device
opening, instead of the full libigt.so stack.

ldd before: 35  (ldd intel_gpu_frequency | wc -l)
ldd after:   5  (ldd intel_gpu_frequency | wc -l)

Signed-off-by: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
Acked-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
Reviewed-by: Krzysztof Niemiec <krzysztof.niemiec@intel.com>
---
 tools/meson.build | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/tools/meson.build b/tools/meson.build
index 53aa31056..01400f53e 100644
--- a/tools/meson.build
+++ b/tools/meson.build
@@ -23,7 +23,6 @@ tools_progs = [
 	'intel_dump_decode',
 	'intel_error_decode',
 	'intel_forcewaked',
-	'intel_gpu_frequency',
 	'intel_framebuffer_dump',
 	'intel_gpu_time',
 	'intel_gtt',
@@ -66,6 +65,11 @@ executable('intel_firmware_decode', 'intel_firmware_decode.c',
 	   install_rpath : bindir_rpathdir,
 	   install : true)
 
+executable('intel_gpu_frequency', 'intel_gpu_frequency.c',
+	   dependencies : [lib_igt_chipset, lib_igt_tools_stub, lib_igt_drm_stub],
+	   install_rpath : bindir_rpathdir,
+	   install : true)
+
 if libudev.found()
 	intel_dp_compliance_src = [
 		'intel_dp_compliance.c',
-- 
2.53.0

