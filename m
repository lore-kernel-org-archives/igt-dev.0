Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFED8C54F51
	for <igt-dev@archiver.kernel.org>; Wed, 29 Jul 2026 11:12:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9AFC810E390;
	Wed, 29 Jul 2026 11:12:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iU7qoW7W";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A32CE10E4B4
 for <igt-dev@lists.freedesktop.org>; Wed, 29 Jul 2026 11:03:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1785323031; x=1816859031;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=nDq9l4RcNQKzAxRbWgL13Lg+oMv49VsSc1OiYEyqYkc=;
 b=iU7qoW7W3FscZlsId4oURYUj/9I7154uhnZwSRQc0ECMnMySEAy1uUB/
 Or0KZVeTtDdN7tw6E7S6BRWau32Jxyx5Mp3yxMi7DezMuu+IJ1vQEUHV+
 Muh606p3fJJ0gRsXahnyp/xLHYyXrT6gmvbUCIViaPn40SgNNGB3f5v6s
 v91wWrgPXzj+LvXFnwmaYK26nRt35Hs5IilJcgQr1e9z0Vry6ohCfksuZ
 jwEJHa+dXWkGxiwDiyGpTpeyCylhs8S6XcVh6opKGhobAPPG9M9+nshsR
 1Rdf0cpf9XjqVb1B4nrXInpdyS4XF2pZqXMmKW/Y7Up2A5iZ/7LQsrFx9 Q==;
X-CSE-ConnectionGUID: ve5lKV0tTNmymsb4PNZWLg==
X-CSE-MsgGUID: f+MI5TzMTUabPIwJ0Sjq5A==
X-IronPort-AV: E=McAfee;i="6800,10657,11859"; a="89743533"
X-IronPort-AV: E=Sophos;i="6.25,192,1779174000"; d="scan'208";a="89743533"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jul 2026 04:03:45 -0700
X-CSE-ConnectionGUID: NqBHh1u9TK+6RYm/OLXV3w==
X-CSE-MsgGUID: E5bMC08NQle1dGKdypojyA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,192,1779174000"; d="scan'208";a="256652925"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jul 2026 04:03:46 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Wed, 29 Jul 2026 04:03:45 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Wed, 29 Jul 2026 04:03:45 -0700
Received: from SA9PR02CU001.outbound.protection.outlook.com (40.93.196.59) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Wed, 29 Jul 2026 04:03:44 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jBSncokhWMpK28xykk4wqmZWV8+kSEIy3QTY6qLGhSO2hcZTTxzx6mx0yzkydP+bqHtakED4pnqxi54GTqCnFNzNanfdO/7sd8Az/BrJZvUpRFXZnKwKWe+ioyREQaMWLL/bXQ73V8lF4plIuOZ0f9yw0zHDPbQUy4pbSmJhV9uV/vatXSr9Pj1mYj43cuNd22dB5rMAHgxAWU2XS1C2SscVOQ0nYN5ktecUkRqxpXGqRl9IN54DFndYDl2db+NXgxjWuu+uG+dYBih9UmFFqySa/yNk8R89ne4bKkWUtJ4oGOc0zQlw46bwJGFEwl2xeVrA9RoSUCisUKyf9QsJ8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9kjCTd2BfPSvHyjc+kRksywoNf0ByEPheJsX/Z7Xhrg=;
 b=AoDW83i0Z8Exu//thuUKekNRPKxfbVBH0386zB6aNg5hjbzsdA4zicDeFn59ryNilf5L71Sy6V1nluSdifOuEDseRcLvpjmO01W4W2Up61dXYblMHXBf0eRJnElbqdauVozYJ0hgB/g/8KPCiobZZ3BDYVafxfwBfKfH6H3YwoTEnLAdIowXrARmc2xPeKvvjmWGW50VPJKDhiq8CxOFEvCMtdl8O+3ajxpCEdn7SsJ07JfGsU8qKsBkgl52V0yqk9ToiWaHtkNhwRHzIKs7lhH4gx6pm91S3gkE2dvyNfe6aU9cpehURDXEZMelAFPnEoOeNgu+h5BlC/AygJd6Wg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB6909.namprd11.prod.outlook.com (2603:10b6:303:224::12)
 by MN0PR11MB6302.namprd11.prod.outlook.com (2603:10b6:208:3c2::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.12; Wed, 29 Jul
 2026 11:03:41 +0000
Received: from MW4PR11MB6909.namprd11.prod.outlook.com
 ([fe80::9eab:962:806:3794]) by MW4PR11MB6909.namprd11.prod.outlook.com
 ([fe80::9eab:962:806:3794%4]) with mapi id 15.21.0270.009; Wed, 29 Jul 2026
 11:03:41 +0000
From: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
To: <igt-dev@lists.freedesktop.org>
CC: Sebastian Brzezinka <sebastian.brzezinka@intel.com>,
 <kamil.konieczny@linux.intel.com>, <krzysztof.karas@intel.com>,
 <krzysztof.niemiec@intel.com>, Ashutosh Dixit <ashutosh.dixit@intel.com>
Subject: [PATCH RESEND i-g-t v4 26/31] tools/intel_panel_fitter: link with
 minimal sub-libraries
Date: Wed, 29 Jul 2026 13:03:43 +0200
Message-ID: <5510be1cc667921dff040cbf8efaeee8d1e6b3c5.1785152675.git.sebastian.brzezinka@intel.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1785152675.git.sebastian.brzezinka@intel.com>
References: <cover.1785152675.git.sebastian.brzezinka@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: DB8P191CA0011.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:10:130::21) To MW4PR11MB6909.namprd11.prod.outlook.com
 (2603:10b6:303:224::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB6909:EE_|MN0PR11MB6302:EE_
X-MS-Office365-Filtering-Correlation-Id: 1058d749-c761-4e26-385c-08deed610c47
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|376014|1800799024|366016|56012099006|11063799006|10067099003|6133799003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: wMCIXDSa4LrRU6wLOwTT+6dyIZX7yw2Dso+pA95JcN8pr825LzbeaD/nxds9po1b7+oVR4xhLcLMCHkwwGBSSZA2bbWItsRkY+txTkoURwpM7KvVaXlh1tk2ml/UfetMfAbe9oSQX1o+T7TmnmtQqiJjGA/C3VpYa2bFQbufgfTzOhDJTrgLN4RuYnlCbPtoLBv5ZtbOYfXKJ0buNnNg7HJr5/nElb38I9c9Z6lNBWRyZcU8+bv6aV0CX3spe5rIpLpq5FbgxYVmFO59h8E+POgqQ0OP5gBpEHkydfcqRljVpL7lxYFyk/OiLEW8YsLlvWRCHfOKwFUY/XyYhyuDWOA6ArrvR4QjuQ4VPcKucH+vwWo+4hc4Jiuq6YoqV/HGfiGhksJx4ALb0d8Y7bxysdfkVYhoU7zn9BzNPOIqT2W35aa4Iwwm8m+wTgAt65guwGNqGxNhLpRKjqfQXXALKY6FdSgBBWZzH2OZ/yCCqsjx5PcWTVgdimspaL6ZUOh69yUtb4Dz2QS0c2WVUwZOZnq88dXrCVG/k+ERLGgV+i3Z7k8haprEq95Ei55qNm6BZ6rsZEf2vuMURi/iM7y0fWN2iIowoUeAENmuYQZGji/guIxJeF4+NTroN9zRpMkhnOCofVI+DeZ9qrf2KNq6xOPY7i8LaZtMSXprXiv/Apo=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB6909.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(376014)(1800799024)(366016)(56012099006)(11063799006)(10067099003)(6133799003)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?wkMKKrtcYmSu/rL0AGUDDJd2vzPf0P5766FhjNfbvQYJQC+5Fs62DhBegDJk?=
 =?us-ascii?Q?0LF08bXj27WUVAnYmvtPswOzJo4z8sekcI/2SZvjNeyypadb/NzoB+jp1Ptl?=
 =?us-ascii?Q?RUH9O1YuUIw5HnwGm/Xefkvsf5bmWAwVIchwilUZ2Vp3OspdgWQkaqOTSOoy?=
 =?us-ascii?Q?LN2iaxaWkqrJD28hBvb7KosXPqk9tQM7pV6bi3Vpg8zrO4WnpJ6J0gaKqUMU?=
 =?us-ascii?Q?XgJgiF/GBu8gfvZp2qhWYuqtttRIeVfPAtB0FZe1Lk6RxImIJv1qVw9nnDty?=
 =?us-ascii?Q?Vc73iEpMohaWK4JcJG4MemN9HP8nVgnGlFJ80hnWuRUhbaMMyI2v478nU+Ln?=
 =?us-ascii?Q?igXvixqOghEIVUU7IKkrHZEAp245lvOq7xegnsA8U66CDeEBYuu2hRqx2gIO?=
 =?us-ascii?Q?UFRsDCLKiECBOIZDohp01lQHCGOFxZjrbKoTeuxI2XKZunIi/qX+nMqcN6Sk?=
 =?us-ascii?Q?+qqR9TB2lhGftaLiG7eDRSZheCEoYBluGdSX1wt/pdj1MOm2NbvV3QNPBP1J?=
 =?us-ascii?Q?K7MRSoBWLBNChGqfhki1UIzyCqywNeUCYlUqbE1KnW++z5I9ri41wcUzvHdp?=
 =?us-ascii?Q?i5RpLgrupvVgi4AW0ozoADDR/aBNRrGHBuu6OEkgNrmRseaQQnA7tR6N15BY?=
 =?us-ascii?Q?WYjY2JOFH+irCiwUhifEccNWcbCinwAe/Xgzo0SnnUUVexVk9ppU9hNRhOB5?=
 =?us-ascii?Q?9GqGZvFge6SJmSqcAIAmaqP1Y0lDFZcsXSW7EYyoixRE3t+tQ4z7rNyEDueX?=
 =?us-ascii?Q?HX3u3QQP0u/gKbI+HC4FiWxkLfr3s0Li5pY2lp8xs87L8H1UpP1TsHSdrW5L?=
 =?us-ascii?Q?QUyr/OmAoHXXUGxGaQ7ZDrGmWoiLQ6Hf21ah6nyE6b5xfir7YWQx0Wrz4C+I?=
 =?us-ascii?Q?yclhU3LE4zGRVswJS+cC8bVXTL9syqGytjzCQLvczV7mEXKfg9ihSgUYoiK9?=
 =?us-ascii?Q?/yaa6TYVky60JHjTWHhMry4VLellUBbw1SOVa8/sq2Y0s+Yyj9K7+QHwvn+c?=
 =?us-ascii?Q?ycSadB6cwEYgixElCSglKItg+aLsTWAokCSRDK6aVXCk5XFlk4r3F3FTMWwL?=
 =?us-ascii?Q?ruAhhxCHX4nkjincYj/9QG1ocTZROnABKu77K/mMeygy2ESmm2er7XrMg4BA?=
 =?us-ascii?Q?VFBvKFitf8EfHo34LfrGw6Y5sqpNBBWXmP+lXLPAFbf+/ESaMHJDr4X49g6p?=
 =?us-ascii?Q?9666q0Nwckl0eU67uSQiUNeLVdYWHXqP3eXBoiegxjrRqbYu4URRlNibXDNl?=
 =?us-ascii?Q?xDBt9/X4gYWTKhRxoyHGcJKuF2Z+KzzwfK/5XAGJuZcn279SL3ZmjVLBNp9w?=
 =?us-ascii?Q?aHWvdWfEO4kUetqlN/xe/fSsnE0woxkq5wEdCE31RKEwwRajqlSIipbwSmbQ?=
 =?us-ascii?Q?pxJ93YdYChT9BqtHVbiIeqMa6eLVBjPJDu3KnTZvAQ1d/DWU4Uq23Tzw7j1O?=
 =?us-ascii?Q?AFrFfjjb8x4HjM6fPzYYnKVRmhPpAZLZmF6jFUutfH5/slocXuSFqTNmvyRW?=
 =?us-ascii?Q?stqX9H5QdqMcBvIQ84lcBPvCjoFrgRt4apmYjduEF4/CpAipI6L4MJQ0W5ij?=
 =?us-ascii?Q?hlYs6I9q+cOpk8LgCHuL+NJtPdZleibIw/Yxz6Wv2gyT/LFOIkmjojqI2FeN?=
 =?us-ascii?Q?sRssc7ZNnllK5/pdnqb7w6FYlAZjRbTlDWy6B0cTXS3CoEgVNDmNVP+i3y6r?=
 =?us-ascii?Q?wD6f/2wp87pFOb9JlAXTfSLXrnC9buz06xXFkpTXq/VfMrpW6sqCSz24o0hA?=
 =?us-ascii?Q?F16h72rrJJd/zimu3dTco+7rTgUUdhs=3D?=
X-Exchange-RoutingPolicyChecked: NNIVHxhq1oV3UvgXxD65c0g4YgjZHKlwM/nr5g5hxHBBgNP96r+KC0D9/YX1tI19z5Wq3jAIV/8nJcKitlglePVcvoOwKgwga6hpvdDovyve+Ykf+wCGx7hN4ckyIQ45YfE4PXQgqp8ZUBicutAzcy/QabKA/LVRDuXWspCEJs5d06/nQlOp/JMLvruWati7TSyBO1YVJovMQghBTTlxm4KEIkCeBsAt1BYndhSKeRGPy6XX2wIxyNItFavstl1mCq0E49xrftpmiLl7fd3tRAlTFY6Xd2Yzs5G3ujg9Yea5z+5Isels6AT1iuWm6wY44IHaZG3ZIRKp0VilOYt+Rg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 1058d749-c761-4e26-385c-08deed610c47
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB6909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jul 2026 11:03:40.9846 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /ugG2y74fOZoK+hDyMn7slWLKonyzAMOYvG7jTZx1qZ0K7NGa8clXLOAMPVZNDN4j/Y/1+MkrI9FyqmAdCcyOcVOl0ZB2OguTKq081xOtr8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR11MB6302
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

intel_panel_fitter only needs the register/MMIO helper subset, not the
full libigt.so stack.

Switch to linking against lib_igt_reg_tools.

ldd before: 35  (ldd | wc -l)
ldd after:   5  (ldd | wc -l)

Signed-off-by: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
Acked-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
Reviewed-by: Krzysztof Niemiec <krzysztof.niemiec@intel.com>
Reviewed-by: Krzysztof Karas <krzysztof.karas@intel.com>
---
 tools/meson.build | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/tools/meson.build b/tools/meson.build
index a31b6d0ed..1a4e14ed3 100644
--- a/tools/meson.build
+++ b/tools/meson.build
@@ -21,7 +21,6 @@ tools_progs = [
 	'intel_framebuffer_dump',
 	'intel_hdcp',
 	'intel_opregion_decode',
-	'intel_panel_fitter',
 	'intel_perf_counters',
 	'intel_pm_rpm',
 	'intel_reg_checker',
@@ -120,6 +119,11 @@ executable('intel_infoframes', 'intel_infoframes.c',
 	   install_rpath : bindir_rpathdir,
 	   install : true)
 
+executable('intel_panel_fitter', 'intel_panel_fitter.c',
+	   dependencies : [lib_igt_reg_tools, pciaccess, libdrm],
+	   install_rpath : bindir_rpathdir,
+	   install : true)
+
 if libudev.found()
 	intel_dp_compliance_src = [
 		'intel_dp_compliance.c',
-- 
2.53.0

