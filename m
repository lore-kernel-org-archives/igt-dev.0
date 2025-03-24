Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54EB6C3600B
	for <igt-dev@archiver.kernel.org>; Mon, 24 Mar 2025 14:39:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0DD1910E309;
	Mon, 24 Mar 2025 14:39:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="P+NZn8cn";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 211F910E309
 for <igt-dev@lists.freedesktop.org>; Mon, 24 Mar 2025 14:39:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1742827162; x=1774363162;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=IxkbmFbo0UI1wD3RdzzEmeQg0Ej/+t9qtJGiXJK+vxM=;
 b=P+NZn8cnrn3Abos/ykyKTrb3RzRqre4Uu/9kfL7aWoHCIsQsFGQL4eyu
 IdLPKmgaH+VrPewfc9jV7h7VlHwN2n3NIuFeoYgfPjg0ESLzxZgZwrfRx
 0eZxalAYvDsPjAOYFFqKzh/Ok62KA9E+mdJ7VpyXmVcQ7i1c02tn8Vm+C
 50vJ1uxmrSkznJtLEDxxlahq0Lb1wkKfTD3E9PaOnWy6Tn6Kz4d01Sz+N
 JDamkepH4iUJWwf9zo8GbCs4ORWLH3yEw/1WHLNlwOp9u2Ii2QT+6yNtg
 99Olk08UGv846qnwUg2YQw4b/K4zMR6j/UyUxB6AiT0bwvZgulEY87EVu w==;
X-CSE-ConnectionGUID: yVeyeFxCQDCwbLXYdm4hTg==
X-CSE-MsgGUID: eoA8ucMXREqJO8un96KLgg==
X-IronPort-AV: E=McAfee;i="6700,10204,11383"; a="43270752"
X-IronPort-AV: E=Sophos;i="6.14,272,1736841600"; d="scan'208";a="43270752"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Mar 2025 07:39:22 -0700
X-CSE-ConnectionGUID: p1r646DTQoSP8jj7ZZtxGw==
X-CSE-MsgGUID: ZlIMIsi9QTO5rvyi3C2NXA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,272,1736841600"; d="scan'208";a="128758378"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Mar 2025 07:39:22 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.1544.14; Mon, 24 Mar 2025 07:39:21 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Mon, 24 Mar 2025 07:39:21 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.177)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 24 Mar 2025 07:39:21 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oPwGDIgBOJMjyNYe/JATIHZcUlgNOWRWfPAqtEgz24xa0HOg/y2t0IvT0mB9nK4VQ8o2mNq4PtrdnALeBZzaTeYXvm/4CyyVvdqsyIH5VOGzRhcOv1Jh8asX1a9B/3A4Gk8wIgbfkM/EtKHMix6rgv0GNQdl9m86Yw0XKZ9rkm8MdgzEOFOmafkzf3wJQoZiTa1UVuYnLnlqaI7d9QVgWnB+5ssk4N/oeKxKSApZvWdgucL8VJOeKu1JS7UvvWZ8qRahH0DFK6lsyQ015aSVT9qroLus3RU5IKv7/e6MtuCCOJCwP2MIR1nIsnJwpr/C2Fb+Kr5qer/6gbqleiENEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=i/x6bMJjRsAOE+NVTOGECZBMH6yb3illVNnzvXTRPi0=;
 b=APavrfU3wYFVxfNX78h1R813LmcPOnIQupa6gkxiQ9yMnx4O5fI6dYBWNbfqG867kU7sOv8mXVZiVX2alm5FJtnsTvsy3pIugttgoecqXywt/4f6LnKRy2NCwoAZFi9TdhdvS4AZEQuRRFNYf8HFIYS8+ClA86eJJUJimy3yitN0BGiFknzMDa4jD3whj6hPMiNT18irvuiM9p225fIC84iJnGxO6ygrAqMKLQHWVglt1ShMc3HKeh7RUOJdEXb3z0Pt4RkTUsVlFs2202stB3iOjUlITE6RFeTdvb19hKglGrs22DdJf//jpIKq4NHkKUCHB54VPEkPgP1b5hK+HA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by DS7PR11MB7949.namprd11.prod.outlook.com (2603:10b6:8:eb::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.42; Mon, 24 Mar
 2025 14:39:18 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%3]) with mapi id 15.20.8534.040; Mon, 24 Mar 2025
 14:39:18 +0000
Date: Mon, 24 Mar 2025 09:39:15 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Raag Jadav <raag.jadav@intel.com>
CC: <rodrigo.vivi@intel.com>, <heikki.krogerus@linux.intel.com>,
 <igt-dev@lists.freedesktop.org>, <anshuman.gupta@intel.com>,
 <badal.nilawar@intel.com>, <riana.tauro@intel.com>
Subject: Re: [PATCH i-g-t v1] tests/intel/xe_pm: Introduce i2c subtests
Message-ID: <gpuu6yaldphekd7ldyjxybovon433apvjxgocm6njiks4bhc4i@g3duhoz773uy>
References: <20250321173205.40076-1-raag.jadav@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20250321173205.40076-1-raag.jadav@intel.com>
X-ClientProxiedBy: MW4PR04CA0103.namprd04.prod.outlook.com
 (2603:10b6:303:83::18) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|DS7PR11MB7949:EE_
X-MS-Office365-Filtering-Correlation-Id: 7ef27665-cf56-462a-df24-08dd6ae1a888
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?hEIlCX/X8uo0ZRaaZSJPiwplKMK5epvvS+TLX7Q1OWZD4ENrMv6ET7jQ8hFA?=
 =?us-ascii?Q?38PFxlKwZLd6/Bj4pNa3s1QgHaSyDRoK1V3kCF88n+5Vmzxsp+R8x4iMfzQM?=
 =?us-ascii?Q?u4h0dmNQhEnvP2ojQrI/YZcCbMlZT50mQEPgE3bMpL88F7PUQ+0DZ7hhquPK?=
 =?us-ascii?Q?G6My3Fv0RK/CTtqtmkFJOodH6E8aS4mTq1u41VlAuFk2Ay6+o/7XTJkaporF?=
 =?us-ascii?Q?aGVBE2Pfi52m/37biZ8vePInMq/ubfK7iDUWX0zVDiW0HXEHLQbdc25HBZMV?=
 =?us-ascii?Q?Z3lRhgTPMH2DjV++1kHuC7z//MJ5rP4p6u1sENAcaxr0GqbE2Kq1MPoUOcKS?=
 =?us-ascii?Q?tqULzrgJJ9nvNkjMt7n200Fi6fubJefUj80zb+iigj/Zx83VaqdxdbcVKr9m?=
 =?us-ascii?Q?MwkxWoT6EM/aUbZ05yY8D3MvobzGbiVUnOyc7DBhx3p8nHRAgKoKBRiLLxzV?=
 =?us-ascii?Q?/UbCRWaU9CnByh5/UeLXrML+LL4OHG/Fr1c/5JEvuaR44toFbo0S1XDfDSoh?=
 =?us-ascii?Q?zT3ocFtMIgOlo3wQqBWRMWvMKFV9i68JNbg6b8MWtgT7YOP5i3ll8+Ov/x42?=
 =?us-ascii?Q?gumuAPCc8kcJCzyIcZOv+qAl4mS5iG1omcczBFditnx5ZnJr5Lgf1sl8lEm0?=
 =?us-ascii?Q?wIpKA2IFKjhhi9r4X13oV+EJSUGrgvGeWkWFbFtuGYkEJMqRMicycQvdi/wm?=
 =?us-ascii?Q?2s+eM7HatM+WSqm0MopGPi4CRtTUkp/ik0uBItUO5i7cFiJC09P63YetHcws?=
 =?us-ascii?Q?WcpUffqQM2Br0RKeTbEC6yS7Dd+7/6s4o1F9kzStkRqfrS7cYJKauBdSn+Ue?=
 =?us-ascii?Q?HsTpdFOnuOp90RP5Skz2riN+Bufb+JI5GL98uGjUmzflNhnUIikgaX7k07+n?=
 =?us-ascii?Q?8bPwmP6ugstF4KvMu/DnwlgLh14ABfq5mzFM6b49/9WhvbdolY3Z9VyMgoxP?=
 =?us-ascii?Q?+Zr5UwovIkST0TS3+Wq4PJo1TdghlE9x3cpo1hrue8DOQWxGV2S68pLgg2De?=
 =?us-ascii?Q?e0LMsOLRE5EmP+Au1AxG1tbm9fYfKA1tWP0SWNzgpj/0w8EPrY4jtjbFj2l+?=
 =?us-ascii?Q?2r8OydMOj6V9jEhvFv1BhBOALRhX78qQmzMkfLBxmuYuDpCLCGExCDESUDR5?=
 =?us-ascii?Q?+zCrNmKO9Sj7t2BnOYSkA3EsiHfL3eJ2q6WosDXhem2uq5BCtDPKsjyiusYZ?=
 =?us-ascii?Q?1Pg/lVaXyd8qLHWOpCcKkv8m2a4uuSO9UYXf2kpEvs1DMP6CJ9sZOojm67ui?=
 =?us-ascii?Q?crkop9dXaoQnAo0OcF6ISFJBYy/FVksfjr9w6N7rWmN2xD6wtoV6ZGF2tFU/?=
 =?us-ascii?Q?MIC/wFzU+spTt49gSFi1pEySnYtCUgfhX7Z3b/s7IZgoz9v205OwFu6p7yvK?=
 =?us-ascii?Q?OQ7vrLArmr0MT2OJQcTlyGVStnyU?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?d5YhEuZJlTqOzMkgJtEvNl0o9eV8QfsqALS1zSrRSuQ3W9F02cS6HDRwlc2V?=
 =?us-ascii?Q?Wk9ut9QTeNNu3CLdujzty6R13vO6IxC/tbaKr7I5Br/FZBrfjLeWBUWTaK7r?=
 =?us-ascii?Q?SVgufYOz5XSV5qPdzZhGxFsv/cNrKOvghpgBL9vROaS/0m4ujEdT7ZNvNZuT?=
 =?us-ascii?Q?YaNZMdLGUW7+jdoO1bajiG/uSDE7qWi+uXEvioNrVcoAd1Ufkxw/P2j5EUex?=
 =?us-ascii?Q?wbcOaA9OVzSh4ngb4aYwi1InCHKy/d8YJ2X50ocPK65BkiYyCx+RsJPWhrAR?=
 =?us-ascii?Q?sSVVvlEXjH4PjSxBhOcKRyX5je1gD/Y/q/OdRMGKbxYkXE5IHeIy7cJlvtiu?=
 =?us-ascii?Q?O66sf24/WIVpIf5HHAGm3xnpqQHFF4cGj/NAuNbcA52Vxks5OdTRjl9eNZGT?=
 =?us-ascii?Q?fkrZQ/hxmwLGW/CDOQ9v4kQ/WOoGIiO7ogruiFxmzlWZVPLbtA8nZAy/P8Oo?=
 =?us-ascii?Q?ppzORMyEYC2E7b2zWq92k4paJVWpEeFNn2Oj2w3m4+LESPNMkgxCPMCzed8P?=
 =?us-ascii?Q?cCx+SU5nP5EAaFBvu6l8FhFkOyEFZWfDUdsbY8fQaAYiU9WZRH7dodImXmEb?=
 =?us-ascii?Q?eIjcLdhDWhWs8Qi9oaqNBgYgA0/Q/8/6aW4keXYwq643G2SIgeaGl6u9FeIH?=
 =?us-ascii?Q?BtGoH9ejHqFmxvRWIjmiDKzSU14XWOzL3SbEsnbXeHLSen0oUj6cKt5EoRX9?=
 =?us-ascii?Q?chyvIkGpW+DdT7fjew3cSwBqgGXwWWi0rQeoEQMPUGPLsxhEAxTXH1FyuNMS?=
 =?us-ascii?Q?PlyuTG7rUzB6Pdq0I+zdas6ELu9x4vfzF9KP0AesSIvt5X5mYr17VnelgREF?=
 =?us-ascii?Q?uFSHrWEwnVPiZsGEtHLhTBSO1K6MavNnaeTGe+AyUuRs0dOTPi4PxhWseBWQ?=
 =?us-ascii?Q?vyq5JwNiPzxcS+gpqZj2RLaSgNCAY41VERKpvM346dY5QPmVTFgDsJQu3nI/?=
 =?us-ascii?Q?T4PQPflkMlCjHuAgOUCCzDALieAt8T8xvDcpGPARyANpJX3e2xSoc6QkhX1e?=
 =?us-ascii?Q?gjonXFD3opPR6Z6OYcdIiaREY0lcPQm7hXP2UCPUibaYiUak4wUCM8RsyjRI?=
 =?us-ascii?Q?2u051dpJ8hGENurT+yT81rdp3MctSLuQe5WBVR9aynezZAB5rBGCU0oMyzYx?=
 =?us-ascii?Q?yMHPX2BUcqqwCPQn0OPhL80kwMylJQ6yf1w9Yh2YBIpieVRs2TH1Wnfph3Il?=
 =?us-ascii?Q?4ZZULoDBhzIeE3xJ5zlYXtzCd1akkaczCkoEboJHW1t6UssA7EHXAtYsVITf?=
 =?us-ascii?Q?kBMk8xpjDn8leGt8Q/HO+Rim76w/fUTdxnrXLriFY5+N8V8daUorKdN2u8o4?=
 =?us-ascii?Q?8NhnT5jUwZUwALQmbf7PEiDfe5HmXirWSkQMQxejCqfWf3Sr38McMrrjShL6?=
 =?us-ascii?Q?k9XV5gD16JbBxti3EeoJy6A8rumyHQ3RxYfOHhrOEJxlxPZfX34EgdUth4kP?=
 =?us-ascii?Q?8b6QklP90O77qVL4pN9hqTY2TEyQVbJriNbMkcgZ/ltXiW+p4WYXJRKavrFL?=
 =?us-ascii?Q?dDVzawpucWlRBa5Slu/lStc+EsgOIV0lALYBfN508Cn1QPG1wyjFC+p8bYth?=
 =?us-ascii?Q?J+1B4XnLKVZ0rfqt9siDRlnWy9fM2an04icqthPGE9E2eyJORXvFjH5jTKJd?=
 =?us-ascii?Q?Sw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7ef27665-cf56-462a-df24-08dd6ae1a888
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Mar 2025 14:39:18.5958 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PVERERyXDeWYWYeUrLsRbJXH1DunGWmhfpBWBSSAz93ADLGQQ8/qggZ5CI5ScMTTMF3/jDr1gCkxtPq1nM4Bz847+02PIQsGKNkv7uTguRw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB7949
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

On Fri, Mar 21, 2025 at 11:02:05PM +0530, Raag Jadav wrote:
>Introduce subtests for i2c adapter which is used to control on-board
>OEM sensors on selected devices. This will test D3hot/D3cold transition
>after i2c adapter access for the devices that support it.
>
>Signed-off-by: Raag Jadav <raag.jadav@intel.com>
>---
> tests/intel/xe_pm.c | 95 +++++++++++++++++++++++++++++++++++++++++++++
> 1 file changed, 95 insertions(+)
>
>diff --git a/tests/intel/xe_pm.c b/tests/intel/xe_pm.c
>index 19b0d5ef7..233e63d17 100644
>--- a/tests/intel/xe_pm.c
>+++ b/tests/intel/xe_pm.c
>@@ -11,12 +11,18 @@
>  * Test category: functionality test
>  */
>
>+#include <dirent.h>
> #include <limits.h>
> #include <fcntl.h>
> #include <string.h>
>+#include <sys/ioctl.h>
>+
>+#include <linux/i2c-dev.h>
>+#include <linux/i2c.h>
>
> #include "igt.h"
> #include "lib/igt_device.h"
>+#include "lib/igt_kmod.h"
> #include "lib/igt_pm.h"
> #include "lib/igt_sysfs.h"
> #include "lib/igt_syncobj.h"
>@@ -774,6 +780,88 @@ static void test_mocs_suspend_resume(device_t device, enum igt_suspend_state s_s
> 	}
> }
>
>+static int find_i2c_index(device_t device, int sysfs_fd)

s/index/adapter/


I'm very confused here... how is this related to power management to be
a subtest in xe_pm?

Back in the days when I was working with IOT, it used to be the case
that distros weren't enabling spidev/i2c-dev. Did things change and we
can use them in what's used for CI?

>+{
>+	int adapter_fd, i2c_index = -1;
>+	struct dirent *dirent;
>+	char adapter[32];
>+	DIR *dir;
>+
>+	/* Make sure the /dev/i2c-* files exist */
>+	igt_require(igt_kmod_load("i2c-dev", NULL) == 0);
>+
>+	snprintf(adapter, sizeof(adapter) - 1, "%s.%hu", "device/i2c_designware",
>+		 (device.pci_xe->bus << 8) | (device.pci_xe->dev));
>+	adapter_fd = openat(sysfs_fd, adapter, O_RDONLY);
>+	igt_require_fd(adapter_fd);
>+
>+	dir = fdopendir(adapter_fd);
>+	igt_assert(dir);
>+
>+	/* Find the i2c device node index */
>+	while ((dirent = readdir(dir))) {
>+		if (strncmp(dirent->d_name, "i2c-", 4) == 0) {
>+			sscanf(dirent->d_name, "i2c-%d", &i2c_index);
>+			break;
>+		}
>+	}
>+
>+	closedir(dir);
>+	close(adapter_fd);
>+	return i2c_index;
>+}
>+
>+/**
>+ * SUBTEST: %s-i2c
>+ * Description:
>+ * 	Validate whether the device is able to suspend after i2c adapter access.
>+ * Functionality: pm-d3
>+ * GPU requirements: D3 feature should be supported
>+ *
>+ * arg[1]:
>+ *
>+ * @d3hot:	d3hot
>+ * @d3cold:	d3cold
>+ */
>+static bool i2c_test(device_t device, int sysfs_fd)
>+{
>+	/* AMC slave details */
>+	uint8_t addr = 0x40, reg = 0x0, buf;

as part of the AMC protocol, it'd be better to have proper defines.

>+	int i2c_index, i2c_fd;
>+	char i2c_dev[16];
>+	struct i2c_msg msgs[] = {
>+		{
>+			.addr = addr,
>+			.flags = 0,
>+			.len = sizeof(reg),
>+			.buf = &reg,
>+		}, {
>+			.addr = addr,
>+			.flags = I2C_M_RD,
>+			.len = sizeof(buf),
>+			.buf = &buf,
>+		}
>+	};
>+	struct i2c_rdwr_ioctl_data msgset = {
>+		.msgs = msgs,
>+		.nmsgs = ARRAY_SIZE(msgs),
>+	};
>+
>+	i2c_index = find_i2c_index(device, sysfs_fd);
>+	igt_assert(i2c_index >= 0);
>+
>+	snprintf(i2c_dev, sizeof(i2c_dev) - 1, "/dev/i2c-%hhd", i2c_index);
>+	i2c_fd = open(i2c_dev, O_RDWR);
>+	igt_assert_fd(i2c_fd);


wouldn't this fail if we don't have the needed kernel config or

>+
>+	/* Perform an i2c transaction to trigger adapter wake */
>+	igt_info("Accessing slave 0x%hhx on %s\n", addr, i2c_dev);
>+	igt_assert(igt_ioctl(i2c_fd, I2C_RDWR, &msgset) >= 0);

or... the platform doesn't support talking to amc. Usually these cases
are skips, not failures.

Lucas De Marchi

>+
>+	close(i2c_fd);
>+	return true;
>+}
>+
> igt_main
> {
> 	device_t device;
>@@ -881,6 +969,13 @@ igt_main
> 			cleanup_d3(device);
> 		}
>
>+		igt_subtest_f("%s-i2c", d->name) {
>+			igt_assert(setup_d3(device, d->state));
>+			igt_assert(i2c_test(device, sysfs_fd));
>+			igt_assert(in_d3(device, d->state));
>+			cleanup_d3(device);
>+		}
>+
> 		igt_subtest_f("%s-multiple-execs", d->name) {
> 			igt_assert(setup_d3(device, d->state));
> 			test_exec(device, 16, 32, NO_SUSPEND, d->state, 0);
>-- 
>2.34.1
>
