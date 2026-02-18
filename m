Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84821E9A03B
	for <igt-dev@archiver.kernel.org>; Wed, 18 Feb 2026 12:34:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E76710E127;
	Wed, 18 Feb 2026 12:34:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Oc5g1kwN";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC33810E127
 for <igt-dev@lists.freedesktop.org>; Wed, 18 Feb 2026 12:34:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771418041; x=1802954041;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=SGGIQL0H5DCCvgFNoalzQlQCOISzK2QzBzQ9U+rdd6o=;
 b=Oc5g1kwNM+qxrNy+rFe5yfZ0ZMXnKl/LYLOUMwZPY2pVx9FSHBkv8AFj
 /vzOqEcJFclp/FwwH+0IjkA37mpY0hDOzplAx+fApu+yorwjVz5BQ4H7R
 ZRQM7Vo8Be1nJZn3RHHF5F79F/ykXdXFTR+ixQowHZSDI3ZsZwKsmKtaz
 +bVdz1i98uXYItl/WLLA3je9LgkgiS+Bx9dLOIP6dfsV/1fjQyh80d2jU
 kHibSlyJRqSnj0KJ6JQVKD5UnE5FiI7H7DpcauxgztZjc1I9MPdPikLj+
 rECXgR8LbDf2sZ1+rrRqAlNYE3J/lu17HvbILm0nckg9AiAXkJH5DGBVX g==;
X-CSE-ConnectionGUID: OX4UqmPyTu+bpizQsd1WVg==
X-CSE-MsgGUID: TvZu1pTSQ728frdvmWRoNQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11704"; a="83116114"
X-IronPort-AV: E=Sophos;i="6.21,298,1763452800"; d="scan'208";a="83116114"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Feb 2026 04:34:00 -0800
X-CSE-ConnectionGUID: JP3+ZROLTySKDcwFfGjcbQ==
X-CSE-MsgGUID: 5c5PjQn4S325IpNbEQhEgg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,298,1763452800"; d="scan'208";a="219175870"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Feb 2026 04:34:01 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Wed, 18 Feb 2026 04:34:00 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Wed, 18 Feb 2026 04:33:59 -0800
Received: from SN4PR0501CU005.outbound.protection.outlook.com (40.93.194.31)
 by edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Wed, 18 Feb 2026 04:33:59 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=q3R4nbbyQQOgwYLe5r6PG5uEnBjg6AjwHaAxBe7RGyeR6EVfmf3uWMH+ZI74BEd/4ey8oZWCGZrzxzwwdPmfODpm4xrafJdNulAbVZrPcYZTZa5rtSb+mBY8bpsOByA6ghWCJwvwoUSH9gepuAQVRM9nwrL+rH184NWHOEI6ArTNpwsGEkWInatETOTZnSFox9+HxnKawqv+bIzKtvKO8buspP4wvizxLPOJlBaLj9Y5LKZVc0B3Ljem+eLrx5AlENGSfyIo9yg+RKW9NuYDf8JkJB0utOWnC8BCJx6ZOfCxS98yjP13YIszhypGWXO0ATX4PekMF5iVnsHAHyM7eQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vQ7JLNAdhmNf33hjDkHBI4FGv1f9E7g8hsFAX61SONs=;
 b=m/yEDJP/oh/VIx2W5YDzOthFVVDj7RWFXRJ3x5Mi/ckgX+Px5AubnamHiRGY6WdI58tMbu9j/7TfHBMTp4JjcoLRJkWzP32WIzSbNxZ8qanzS3NOox6im6MqG7hqdcykgkQiXpRY2qs2dhJE1Wx2R4OE8obv6g0b0pu9oNEF0TqU4RTlBnQjbyJTOiFOhZzrLZPiHsGP5Cfp+8ZsnYxSxNtYSQJsGyazWnAgZ2DtCBpCgbBqGvkh8kCotIY1lznl4bGlmkZjXNVS5dGhZqxspLub/TkiDymT/JTaLFZWIlTzR/gQGrM0R5T+1ageD+R18DDubS4HzF0HRqTqRpbGew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB6909.namprd11.prod.outlook.com (2603:10b6:303:224::12)
 by CY5PR11MB6187.namprd11.prod.outlook.com (2603:10b6:930:25::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.14; Wed, 18 Feb
 2026 12:33:56 +0000
Received: from MW4PR11MB6909.namprd11.prod.outlook.com
 ([fe80::9eab:962:806:3794]) by MW4PR11MB6909.namprd11.prod.outlook.com
 ([fe80::9eab:962:806:3794%4]) with mapi id 15.20.9632.010; Wed, 18 Feb 2026
 12:33:56 +0000
From: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
To: <igt-dev@lists.freedesktop.org>
CC: <kamil.konieczny@linux.intel.com>, <krzysztof.karas@intel.com>, "Sebastian
 Brzezinka" <sebastian.brzezinka@intel.com>
Subject: [PATCH v2 i-g-t 3/4] lib/meson: build core sources as per-file static
 libs with minimal deps
Date: Wed, 18 Feb 2026 13:33:58 +0100
Message-ID: <60a987fac84a2dd4e6fb832c5318df7d3c93cef4.1771248283.git.sebastian.brzezinka@intel.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <cover.1771248283.git.sebastian.brzezinka@intel.com>
References: <cover.1771248283.git.sebastian.brzezinka@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: WA0P291CA0007.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1::11) To MW4PR11MB6909.namprd11.prod.outlook.com
 (2603:10b6:303:224::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB6909:EE_|CY5PR11MB6187:EE_
X-MS-Office365-Filtering-Correlation-Id: 23f0bedf-4144-445b-b656-08de6ee9fbb4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?DrU/GmOekxOnP3cVEumP55mk0BZe8AiU1jJG3N2lAJIKcfcZp/cEzdBH2EAo?=
 =?us-ascii?Q?SM7775A5pc5rLrblTcBO+7/fWqIVkJWFU3pTUPWdA1MUOOzCvDblLLpHOLky?=
 =?us-ascii?Q?M+m3zuaLjap7OlCHxKPmJSbFzHUr3FXd1woX13LOcxMg6zrTGzSRTasb41tN?=
 =?us-ascii?Q?OQEB1EPStmo1dik2wUEpF9flXnyls7Zq0vl/n0eyflZ7Qw158poaLvCk5emx?=
 =?us-ascii?Q?EzmRHl1hPQX+McmoaXMeA9/RyKBTFujtINAmmjxn1mU3ndq34A2grgldt7Jv?=
 =?us-ascii?Q?dUEQ1X8apVZuYX8HvxJqtXgJazLlD0sM6qUiAnnLP3g1MhXM991Aw0L79W17?=
 =?us-ascii?Q?ACcdPuQbpfVq0Le512KKxWanPJjcfpKtNL+NnMXBhm1aTlPe7p8qP06EjjFH?=
 =?us-ascii?Q?DvjsrYhww6CnWAXK9VuK9KEmgdS9AbjGIAa1NlN/JyOpNXLxiFMxl67bEhRK?=
 =?us-ascii?Q?g6DtnADFzwTJpo3lRfqzKOykEVaPFYOr0eY3KyhsMH2K3UUN4V2NhW3C4iDJ?=
 =?us-ascii?Q?DbbUsp9hdWppY4cdE3w+Gla16DAY+Tkzx5TXwexpVyDy0lHPCFvJ51NvF0zS?=
 =?us-ascii?Q?VhbOI+Kt7YXT0/cmFtHEfk16Wz2g1FjXBQOTP1pKKYxYCEhrzfFFfhJZWNrn?=
 =?us-ascii?Q?ZpZwjloBDn2ASmAY2GiGauDp+SlLGqLHjS666fwUCIOe1+PAPt7Uz+LPqoIo?=
 =?us-ascii?Q?AflqM6cx0AYjoboIFm/3Xcl6iH+FRelQDnp+oyUgbSA2UqzCkXaCBQq/A2Hv?=
 =?us-ascii?Q?vTn8xIjpwNzjKzu/vBUE9nIvO4Yv18KSTOqUxyE8vVvBBkoN3axFBM75YEYd?=
 =?us-ascii?Q?3kR2CigALXWWI8iE0NWZS1btZKiEna7SXVjYBgRp+YTX6Z+cinnFLAxzZ5bJ?=
 =?us-ascii?Q?1w3Vvk9N05rqrNlkm/KEqh3JhIUs69fXsL5wnif+/ZI8xrHs6vwdE10wFaZd?=
 =?us-ascii?Q?AzfiP1MebDXb6uq7C9Jj82Tu96RY5zeRoh71FZ0ukUq7kIeFb6QoBbBYiFsS?=
 =?us-ascii?Q?h2JaNTGivf65wWlWZ4Yo1yD4lm3Huo/rOXzoGlwek3z3fz+C0SEYQ9rBJQZ7?=
 =?us-ascii?Q?sUpdtitcYfAKcAC7tTfjRSPHHk+dM620qr2x0PhMk/Btqmz39uSBkBCamYW2?=
 =?us-ascii?Q?1+iGJS2HSKGyG11NDNG+02fd1v93TCAT5h7hLHEZKZZwuhBjc2LXzDreH4KX?=
 =?us-ascii?Q?ZqUyaBtRCySzCO3B9uHHDlDgvNGmwlmSo2T+fl9hnQGzlRuMFIhLg//bM53X?=
 =?us-ascii?Q?omzub/ubbksjUgX3L0DfMp2X4tf+3tMypzUGWdnY9q40dR/x1gqxnysVNiQ4?=
 =?us-ascii?Q?2XVZv4ymvM8F24hloVZVZKAQI+soyf5TS9OypBHdmJXQoQTjcnZ7QqQbx3Rd?=
 =?us-ascii?Q?2y8adttPd/fNsJzme6ynhpOIq4CzcDJlAx9PjklXesV/tmBypwKljo4kVv6c?=
 =?us-ascii?Q?AJqRrwEWEm4Sz+8hx4zxzwi/Pn+i5luRpCeVCDJaoqllkQvcv2NkuWZszw3S?=
 =?us-ascii?Q?A+n+NtvAMX8PFzyPHUA+og8GuuEDnwG9teHUc4uw5n/OjL9hCmAbKQFNOdUw?=
 =?us-ascii?Q?ZMTFUXbIcIlU0vSl5dM=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB6909.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?7HitwPyiht8nvNPpPzblNgY89sQGEzZKvI5nEm0gzpZXZOVuhnU+yqotqQDY?=
 =?us-ascii?Q?RDIzsvEo7YotPOQPRGZIyxIST5uqJE8+ByWULp/x1p82hgKshf5l9wsC8R/Y?=
 =?us-ascii?Q?lqx+xCfiQ3fYgRgPEyNLkwTB0LLg5sIe8swiI2bokkZ25SuIDWwYVsv+1P9i?=
 =?us-ascii?Q?JIlTS8L4LVJ1ZS481le+Dwe1iQhot1P4FoLQst4LFqWGY4RK0Bxu66+AR0Nm?=
 =?us-ascii?Q?NCDB3eBNp98tWmQ2HQjAwPeQNHTK3PTjkQsI5miZWvkbAtBjqDFCdrZTm0+9?=
 =?us-ascii?Q?g6xzXM407iDGbZpWm7aagL48S4Ku5U0fQnWBGrCwK1QPpy7UEsCklFXqHyw5?=
 =?us-ascii?Q?DCDWI+FJ6B2BwUPFk0iqdpVwPNQN2y+ztvpKAWp2ewoNKzypk63x/qF582yO?=
 =?us-ascii?Q?2qDQCH3C02kMHy5RYCWY3/RygKg3gSCqZeX841W2GLd2qlcjQYHxLNtzXvxG?=
 =?us-ascii?Q?jDfS7rO6D3gLhStwQ/z1qV9WvkeDgrcXVUjnOZCdGzk29COt27N781+FHGUC?=
 =?us-ascii?Q?DyhC6TfHtQRsf0Uj1fA4yL+kUziv0PKsVm8eX0jepsY1Re/6uqRps0Zz/MB1?=
 =?us-ascii?Q?Ru8vvqW5IvaJe4/ZmxxW1d64QMfxBabKbyD1M87Mh2QMikAt0/dQmjEzAlcB?=
 =?us-ascii?Q?BZEegn/q6VBjiYsNLq6I2Emwx0oXgUlye0lVC0H+OZbTb184BfPrlFoXk7Tc?=
 =?us-ascii?Q?q5k+sv0X2EQ1Y3a/8msUOMB2esRKN2F1X3tBwKOQgDzJageXpfiv2ahg9Poo?=
 =?us-ascii?Q?oH8zUor8S+kkc+7teq87PRhTHn+7MFK+Uq+EWBhk42OMLzBpOy8sYWSOFTrn?=
 =?us-ascii?Q?Ca/n3va/tvvOT3I1JmXu75ZOmVJrbXRXXq1avDpXW7RypsNUC+Brof+qsrLy?=
 =?us-ascii?Q?bS/Kq5Z7XfuMps0tynApEE/RMFky0uix9eMU9MVL0TXuQOhCt89UsqNjeNVU?=
 =?us-ascii?Q?VrraVslr2yIpG3VZxakV43LkUfpwtS1ZjOCwYrxiezvhraGEhCA4ps7RCycA?=
 =?us-ascii?Q?ee+eVT6jMANYfeIRyoFetLOJ++kJcWwJMYqiKyJfWIy3r5oCa6m4eiGdZExj?=
 =?us-ascii?Q?k4JVND6zCQ4yqfb1WbebzRX/Y4kyv1UOtdtEWe1P5HS7yyaEei/vsTpa7T3I?=
 =?us-ascii?Q?onKsBKt7tAi7jOQXwOLFP+xdKliyH2UiGJ4b/9NRtdjBhddg0MqC+TFn4DCr?=
 =?us-ascii?Q?3/KJzTzRvfBcuicNiMA/qj9up+7ElkxJC63DzylrGxmUfGfraPwk/9jKxskk?=
 =?us-ascii?Q?6Y+rrcWtmgEx9NvBGrV3Sw0pfFW11fXaN7bDdJf+XxrVqhHpW+hfYGbWyNuH?=
 =?us-ascii?Q?rLG0L0gyzHNxRp1UxLUkt8NTgaChwqURGQH9b0XtVPVgCaS3ECofT2kKnxKM?=
 =?us-ascii?Q?BR/klLYIo3oSljFV5Gx7OIWVf4L8hHWSISYTGbxpjC4voBzrw8NgB8GzY4NM?=
 =?us-ascii?Q?3MEpITbVyDRz6f7sUBnn4gd+DiZAidFYAhSO9fcy2p928ionaC7wcmi/Jygy?=
 =?us-ascii?Q?lreOb7Jbd4U6+cXdBQy/SonpLIxaNeuA0N0bLmdGVHRHHtqIQ9RrrjD+RIrk?=
 =?us-ascii?Q?/NKiFD+9bo48O4V+Ow4u0FFRinrstvjlEnoJhbYmgVDG9bxy87nD4bBY3+j5?=
 =?us-ascii?Q?QkF7pRCGb4yHTRjn2tRxrKLLvSgQ1lqb7STq0W4NF0ljDmUrk0iW0Xm7/BUs?=
 =?us-ascii?Q?Gm99H0XPte3jHAFYfm3DK+rkZov3vIrsvGsWDM8DJlgwazUvpEet31nItkTW?=
 =?us-ascii?Q?Tq2ojPUlfSTCetOiz/gjpXpl3b+B9+A=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 23f0bedf-4144-445b-b656-08de6ee9fbb4
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB6909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Feb 2026 12:33:56.3889 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: C20tqW5aCGWAj3mOJfmkgfylPZYq0o6tUmZvthh7jcAyFzjhKxf5hichhNs+DHFQVeOK8JkBW3EKvv+gGah3Qb96MIYVbmkJrNyhjbFoC48=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6187
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

Introduce a new lib_core_sources list to isolate low-level/common code
(basic data structures, device scanning/info, and basic utilities) and
build each file as a small static library.

These per-file static libs are linked via a new declare_dependency()
(lib_core_igt) and use a minimal dependency set (glib, libudev,
pciaccess).

This improves modularity and keeps core components lightweight.

Signed-off-by: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
Reviewed-by: Krzysztof Karas <krzysztof.karas@intel.com>
---
 lib/meson.build | 42 ++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 42 insertions(+)

diff --git a/lib/meson.build b/lib/meson.build
index ecb8a4930..2caa612e1 100644
--- a/lib/meson.build
+++ b/lib/meson.build
@@ -150,6 +150,27 @@ lib_deps = [
 	zlib
 ]
 
+lib_core_sources = [
+       # Basic data structures (no dependencies)
+       'igt_list.c',
+       'igt_map.c',
+
+	# Device scanning and info (minimal deps: udev, pci)
+       'igt_device_scan.c',
+       'intel_chipset.c',
+       'intel_device_info.c',
+       'intel_cmds_info.c',
+
+	# Basic utilities
+       'igt_tools_stub.c',
+]
+
+lib_core_deps = [
+	glib,
+	libudev,
+	pciaccess,
+]
+
 if libdrm_nouveau.found()
 	lib_deps += libdrm_nouveau
 	lib_sources += [
@@ -285,6 +306,27 @@ foreach f: iga64_assembly_sources
 	)
 endforeach
 
+
+lib_core = []
+foreach f: lib_core_sources
+    name = f.underscorify()
+    lib = static_library('igt-core' + name,
+	[ f, lib_version ],
+	include_directories: inc,
+	dependencies : lib_core_deps,
+	c_args : [
+	    '-DIGT_DATADIR="@0@"'.format(join_paths(prefix, datadir)),
+	    '-DIGT_SRCDIR="@0@"'.format(srcdir),
+	    '-DIGT_LOG_DOMAIN="@0@"'.format(f.split('.')[0]),
+            '-DIGT_IMGDIR="@0@"'.format(imgdir),
+	])
+    lib_core += lib
+endforeach
+
+lib_core_igt = declare_dependency(link_with : lib_core,
+			    include_directories : inc,
+			    dependencies : lib_core_deps)
+
 lib_intermediates = []
 foreach f: lib_sources
     name = f.underscorify()
-- 
2.52.0

