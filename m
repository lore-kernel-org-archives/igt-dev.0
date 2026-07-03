Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D50AC43458
	for <igt-dev@archiver.kernel.org>; Fri,  3 Jul 2026 14:30:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3122B10F820;
	Fri,  3 Jul 2026 14:30:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cwcTDeIO";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F42E10E2E7
 for <igt-dev@lists.freedesktop.org>; Fri,  3 Jul 2026 14:29:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1783088940; x=1814624940;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=hV3c53i88DhM1QOCOe7lkMcm82UICviXLUqkX2g/fJA=;
 b=cwcTDeIOEzxOvnMG43iSkKf+0W8/My8VuBJIb2w7oMcTv8WrFw+UTQJH
 jxikX/9jPZB390q73pLnJ4m36onsAPVLTDXafl1nQB4MzY5RZ4EwCtLbK
 HxZQ2xHkX0ixetiSK1Yi7uzDAkF7hFaotyyRmfVMe/oUnPgWgzbiExEGN
 MwFYu1QK1Yw62J1Q88djGjWIei+cakYFUUcRDexJF7pKXg295QnGrn1W/
 W6akjEBgyljIkv0Yal8B1VlJzq8Eu/0HkJdHJFO56XYVkRV9fpixpcIQK
 vaSE8TiAmw320D6jSQjc1gUiz2QbtoEFpsMzCM+qpkrbtY/ILOJwMbXPE Q==;
X-CSE-ConnectionGUID: 6lIFbQlBSga1mTwoh51Jiw==
X-CSE-MsgGUID: uK/m8xmJS/ip8adJoA4ZZw==
X-IronPort-AV: E=McAfee;i="6800,10657,11835"; a="83877916"
X-IronPort-AV: E=Sophos;i="6.25,145,1779174000"; d="scan'208";a="83877916"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jul 2026 07:29:00 -0700
X-CSE-ConnectionGUID: /keQv4KVSne8KVvez/DYXA==
X-CSE-MsgGUID: kdj0sN2PTjCNnIZlIeGumQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,145,1779174000"; d="scan'208";a="258019336"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jul 2026 07:29:00 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Fri, 3 Jul 2026 07:28:59 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Fri, 3 Jul 2026 07:28:59 -0700
Received: from BYAPR05CU005.outbound.protection.outlook.com (52.101.85.69) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Fri, 3 Jul 2026 07:28:59 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vCpBkd8q9GtQvGw+YYp/7eFVav+ohJndql9+PoiRlKYBYMGncNeLyGK0DB6xDZzndR+D8JXrN+XTixAe77eUWbT4PtCybK+/t1O7Ae3O1FQMSXyx+qmjaAOPs8tpxJwlkooaZ9WC1lu+sBrxkddrHH7TictGzQ4eXEOb1/a0dXGANwytX0mCj+etvR9MLune3uyPaZpkWjmEHuPuH0eJpt3UhX7b/p3aeXnZDasoR2ayDOkXSYdHtYMwSn+WmjhP4iBL+tCnRV2wN/IzWN0mnhdrXwBBkRdVsOExGoy/vWHh4S2sFUDT+FYWjfxv0+DmdxkAWjkbzGuB3l6lOa12AQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=r2pxzFmhBceY6Nqb+JzIhPQLcyL38GAh9RHyCOxqkas=;
 b=U+J3yC1j4cdQeSCIh+fqUB+Z4cqC3YUyk6S28ViV5l4+m9Pappjb9r9o3EmprR7uu6RHgl0otyroy77DihERxM32gZfFo6JlIfNqA7SgoYVLT/5BV70Vo/kUX0Yqu0ozwfHn9uj8x3dfSusoRfjqHrhHgugLzmrxndJtJWQfjIpYCABQ2XrY+LlRleFoiB/Tt3UUl8XBjhed6gL6rg4klFtx2CaBxG1On5Y8zeGHB+IUR61KHNjoQjfQJ8trm0euDl4l+VOf4n2EU8LDn+XtwpFaYguNaudm/iibNLh7aVnt7mgNpqpnRyroRmCpN3MWmf5aRXzNrRx+Tl0rro+wnA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4SPRMB0067.namprd11.prod.outlook.com (2603:10b6:303:221::22)
 by SA0PR11MB4525.namprd11.prod.outlook.com (2603:10b6:806:9d::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.11; Fri, 3 Jul
 2026 14:28:57 +0000
Received: from MW4SPRMB0067.namprd11.prod.outlook.com
 ([fe80::3605:4f97:fbe7:2c4a]) by MW4SPRMB0067.namprd11.prod.outlook.com
 ([fe80::3605:4f97:fbe7:2c4a%3]) with mapi id 15.21.0159.018; Fri, 3 Jul 2026
 14:28:57 +0000
From: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
To: <igt-dev@lists.freedesktop.org>
CC: Sebastian Brzezinka <sebastian.brzezinka@intel.com>,
 <kamil.konieczny@linux.intel.com>, <krzysztof.karas@intel.com>,
 <krzysztof.niemiec@intel.com>, Ashutosh Dixit <ashutosh.dixit@intel.com>
Subject: [PATCH i-g-t v2 10/31] lib/i915/intel_decode: introduce static
 sub-library for tools
Date: Fri, 3 Jul 2026 16:28:44 +0200
Message-ID: <4bee48342f508ec461801a10f25f850e8a908473.1783088106.git.sebastian.brzezinka@intel.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1783088106.git.sebastian.brzezinka@intel.com>
References: <cover.1783088106.git.sebastian.brzezinka@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: DU2PR04CA0169.eurprd04.prod.outlook.com
 (2603:10a6:10:2b0::24) To MW4SPRMB0067.namprd11.prod.outlook.com
 (2603:10b6:303:221::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4SPRMB0067:EE_|SA0PR11MB4525:EE_
X-MS-Office365-Filtering-Correlation-Id: 0312d285-7b1b-435e-8d61-08ded90f6ab0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|23010399003|376014|22082099003|18002099003|6133799003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info: wF2NnXRwN5POnX+d1uHGoQYhdJXjQ2KnFwJe/7BF3rjCAcK/uojMJvjlLUXL9mJt9CxJOLGjUWkxdxSeLmDlaIr2QI8dGFZSlgf+O9CcvPxl1QLxQSiAO+EFvpsjHpz8iqZDrfDODygy26qES5gGieDAU3PqkM314NM+rYidYSLfEQ0RuK75W2I6KX6eYz+JnuHyMJoJMQXS0khJjJs9g+E3mAiEhFZZcvc5OjGORYQOmHRSCS+VgGKrKJgrQ5/d0kbZSeX5u8dBZs2msi50HeC0fPJRebk/fOOS0JNS+6Uzp8LHHWgiONnwfF7SvFdxg18MkrmJLjBiqY0Ku0JSTq7+FybqfA1g9XdM4kIpJEJtWSct6TfgeExy7GgCMMtLJXlAz3ZN+OQDqT41VuJF09QqR4q+sDjnzSU/UCSkT6OOIugDihWn0O9wRb809fEfxYXnVfCwxoxuYI3XSdt81kGimxCYb4L54UT55r80scWxDsZEJmQygT2ogRdSOI+PUx1xmgn29+/VfBYD2l6wujA6raLmiGCSkYVdKs6t0WoenICZ1lguDUj9EJHEK42jND9WuQTQEvqdQyKqUkJfzXQclGY9eWYqywimHZ+YqzGLDM14ECqaoyBt2EE2oz4jz4sF97DG7iVooLAAz3E+Q0UhX2fFPH6G8+63deEEs+4=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4SPRMB0067.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(23010399003)(376014)(22082099003)(18002099003)(6133799003)(56012099006)(11063799006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?cBc2ZKYlhCJ74YlNbx6G9DqrKu3QKpx9/R2/NDIofHtHBAoyc/jQM2o0OENz?=
 =?us-ascii?Q?Vx7mX/o8Mtwa2bV/xmhYN7fkNOmUd5Xpb5uOTpOphXOf4p0+uqi9NYr9XoAv?=
 =?us-ascii?Q?yQAFZ6mKg2X8zpcIurt8/Dxk0+jAAzJ59t3UtvYInEcOXs0sil1vRzEDVBY0?=
 =?us-ascii?Q?Ar8aYNwJ/gqYLilzOnfSliSelqZ4EtrB97lXvlG2p6QPn0WbbAeFi5z9zMwL?=
 =?us-ascii?Q?A529JpEYPtow4cCGKeTwNZn4acBg7xuZyGH+903rqtKkD6ry3YJYFZdB51Ye?=
 =?us-ascii?Q?aRPjE1OnvPt3sQkUD3Rvxqmrfj3uv0WsfynvZ2kwHIx4o/O7A9ryI+JnSLl7?=
 =?us-ascii?Q?WjhBWspQtzILYueR/tYjwXkv+grn+8Lqcr9bbkE/wdyKuEGd06OzYOgXGFnw?=
 =?us-ascii?Q?qx0DCsAQzV3OATYaouEcngILq/lYYok+kHah8evnrzYtlZz3ScxU3gdj02JL?=
 =?us-ascii?Q?Ory8UAqlbKwy7s+revFbcDDmUz8R2lQJ5m3yb//3Xdfy1FnSh/W4afYJKpDA?=
 =?us-ascii?Q?zfyDaGjGPydmv6iCdR6fbo1kYLkDnq1W0jl+t1oJVq159nWs7hRG1F1ab5Zl?=
 =?us-ascii?Q?oPP/7kFqZaa1VcsKBGAa8TC9UNu8mIpHlKXC8cO1qN+qJsU5K7+x73nwANit?=
 =?us-ascii?Q?bVeuuV1G3EXQyvcRPV0tQl+DXVYcCUVTLsxaOcyHpgzrerHJfTV9EfKzVDBs?=
 =?us-ascii?Q?wXzK5ekXvMeOZtv8sSOpVfG+ukb/m5LhdZ1iek90sPd4N/uMuIlqYcD82HOn?=
 =?us-ascii?Q?9R6qUPe8pbmhekqZLP2TQZfaOsDU3uaqiB25tfefYdYtALmJDhACeRIEC4W2?=
 =?us-ascii?Q?a39OaoUa0oaxX57gtHVoaaSrzNhb3KStIVcxPvl7JWI7t1dJlNJC6CfaUxQj?=
 =?us-ascii?Q?M17KV5KnMI9YnPj2zWRpITv9zieitgvms2sTSr0sd4l6xyFvzOrMcEeHWNLS?=
 =?us-ascii?Q?iCl8qAXHrMNUF7cZlxw6twJslTB8aIEshnSOy6zZvImeBu80ESvLjubrPMFj?=
 =?us-ascii?Q?kNdZWb9EuQjP8vPJfQBnDReyY0JY1tQwLVnOMuapj7h5tLMaNjpVaCKfjQnv?=
 =?us-ascii?Q?+N0aoxrV20LmvqgxgPO58/gusDJ35CDCmuwbnwXlbc59K8SK2axen6dHquul?=
 =?us-ascii?Q?MLKVyEoWzKzbpqJxeaCizIq+1jkPo+OPJduRI8z7zD6LOFZo0Eu9eJOe3HnZ?=
 =?us-ascii?Q?7bkdGI3AeWgLi22gAd40FA8/rElOi6NICo2oIuaUuVCMsi/yLJDG1TI2nYHo?=
 =?us-ascii?Q?/Ywo60QPZT5VESYhaWuIAHelF8/uj8QWKs5c0jHxpOKZHkiceyQrxMVI5XFF?=
 =?us-ascii?Q?lf3egynITEE+WKgm5fcPK/hEWs+42F7nUqyZBStWP+uV33RqYW0XbjJ5sNwa?=
 =?us-ascii?Q?dF9a3zZaR5qZQ0XZLDjcXlUgPpXx11cKK3VnMkrqNAFO9Xj79NGlsJVLfaLr?=
 =?us-ascii?Q?JPc0kInyug4mq/atd0+5N2zPauFPhLMABJXU4jretZukN+xNrZyAV/XGJRMt?=
 =?us-ascii?Q?L4AVqYVb9LPwySn1YHFGafFQeBJC0OzdEF+jnM8ePNJQ82HhRWsC5gspLF0D?=
 =?us-ascii?Q?rF0zFj7mdixSJEz6XABYTd8RNlvmnEwjlxq26KADzUwx3Pnr43kAJ6zsNl5L?=
 =?us-ascii?Q?x1n/VWL26q3VQJQbBys0M3TIidm33M3EssgRC77iBp2CglYlFvM3Kv/iRAyu?=
 =?us-ascii?Q?QuKbt4l/LhYb3B3gs9tZR/rasQ4vDV95Yhl4kWfU0Q7v7WQjIrN5YIMczNBZ?=
 =?us-ascii?Q?PEsPwT87vPLAIJzJE/Qn57BAQ2F0YU0=3D?=
X-Exchange-RoutingPolicyChecked: XSW61zK4GzywsabqZJWxXgs1XtwwkBLpNVIa1FhOrKjfxHISaV4aAxKRSRtuJFJcBN47d/9YPOeqCpoydIY6kpD2sakeh/MphGh/MjWVWhd+KRqYPeGj5BKSVxm5F5G3H2girlbx9kH+ed+/vuSk6rORMJw9jnNGqmhsjFomaVT1DCX28C1SqITTxPT+W0RZ6JU9qQbR8wm0WJKLM+8gnJQVfFGTMd11OKU67n9jzW0RBE+SIYugoZMpVMT+Byzw21vT/izqkNlJUn1BDz73NwI4HJLg1USPfKccXOXB0+SftgrAk5LHcnsWiBVal4zIm9HyKs0iUum2AawkV3p/jA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 0312d285-7b1b-435e-8d61-08ded90f6ab0
X-MS-Exchange-CrossTenant-AuthSource: MW4SPRMB0067.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jul 2026 14:28:57.3390 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KwZLvCoIcIexBpu9m+E6NKGm/4Yol1TH7IC3WmyYrjV5vkcYcMWyufOuQG5PC4vinvNhyh3dQlm5GOkDezdxsjghO+jxVYp3G9Cvn+8lnMY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4525
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

Add lib_i915_decode built from i915/intel_decode.c and instdone.c.
This lets tools like intel_error_decode link only the decode logic
without pulling in the full libigt.so.

Signed-off-by: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
Acked-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
---
 lib/meson.build | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/lib/meson.build b/lib/meson.build
index 93db217f8..ba4ece3a2 100644
--- a/lib/meson.build
+++ b/lib/meson.build
@@ -423,6 +423,18 @@ lib_igt_halffloat = declare_dependency(link_with : lib_igt_halffloat_build,
 				       dependencies : [math],
 				       include_directories : inc)
 
+lib_i915_decode_build = static_library('i915_decode',
+	['i915/intel_decode.c',
+	 'instdone.c',
+	],
+	dependencies : [lib_igt_chipset],
+	include_directories : inc)
+
+lib_i915_decode = declare_dependency(link_with : lib_i915_decode_build,
+				     dependencies : [lib_igt_chipset,
+				                     lib_igt_tools_stub],
+				     include_directories : inc)
+
 i915_perf_files = [
   'igt_list.c',
   'i915/perf.c',
-- 
2.53.0

