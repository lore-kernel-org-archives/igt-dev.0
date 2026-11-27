Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE552606A31C
	for <igt-dev@archiver.kernel.org>; Fri, 27 Nov 2026 18:16:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=ae74Juto
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F52010E276;
	Fri, 27 Nov 2026 18:16:30 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 10C6D10E356
 for <igt-dev@lists.freedesktop.org>; Fri, 27 Nov 2026 18:11:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795803114; x=1827339114;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=525Mz2x3++RQhSkz3V8GbEgn0v0jVcbWudCmLnP9FZ0=;
 b=ae74JutoyC52w7/aSZtNVat+J37IEXG+HP2VcMHhkS9lKM/Pj5Ulv8Pc
 Mo7x4z0HpZF5IG3qrgBeDTRmksGJFTbpSZ58ACBIP6ZoaeCQ8ZUWupHu6
 cDGagXGk8O/Ij2/3EvjzUULSPL+v7eKSIRBcvO7XFycyRlmnL6XFc1sSv
 iiLqosjzydETjx1DOoPsyKBIJ3lPx23CK566vfeCHi+5TdMPj5bEe7wwj
 qbgWnFJe8H2abEcAWrqTC5cI9SfqKhT66XWwF3vDN1JIfLH1p1RdXg9lm
 hNyVzsg68bI5THym3hvJZuu5hTp51gF0Nfuo0FoO2keRoPfDUSSoNrsBK w==;
X-CSE-ConnectionGUID: vxyLQGY0Q/2BIqyNNNmQfA==
X-CSE-MsgGUID: t1HBooPGTe6lWhfThBo6AQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11979"; a="4602884"
X-IronPort-AV: E=Sophos;i="6.27,237,1787036400"; 
   d="scan'208";a="4602884"
Received: from fmviesa011.fm.intel.com ([10.60.135.151])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2026 10:11:54 -0800
X-CSE-ConnectionGUID: htqpiLmBQ3yB+39gfxyCZQ==
X-CSE-MsgGUID: IYgf00HTSF2tlKjT7GOMeQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,237,1787036400"; d="scan'208";a="14208066"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa011.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2026 10:11:54 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57; Fri, 27 Nov 2026 10:11:53 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57 via Frontend Transport; Fri, 27 Nov 2026 10:11:53 -0800
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.36)
 by edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57; Fri, 27 Nov 2026 10:11:52 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=d3JH4SswxcegTbtW8AdGRyag9/SVrFzjd0VQTlYhqWg6RsfhJYtsDxBGpgcj9GBZ6NSp1jjfUtewJv8zxHWMqBuoj27bykfiTcAU02Dsc36woQ/nH+DFgKGA7TK00HzIuxjmjhh8JDVCXPFLa5vzddR30gvlr3ZSSRUzwvr/3Smm3BnFFFf4k0EMpcW0gpJpuyp1Q+tpKgQt0H8oM1Sg2UGYp/BlLqlxTLnJOX3Q01t+mFpKF7zILyNucdbe1uIij0LOOkbErq9o4h2/KHbysl52kDamm+ryWyjU61oAHo3IWYOc1/cwy5XYGUut3tp0Q/dotiqu7OiHTV1s1QwhGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fiSI84YDoosyeSQy6GoB9iVNUzJDAe9IJ9Lysdy99lQ=;
 b=et2g+s2AKm5AkHtSVqP+ffBwCbnreFsWPIBorfRI8Hyycd+6vmyOGxJeWpPDdSPGORGx2mVPVrywl/5Nm8IUFK6KyODs2UB0dSzOwVEidZobAO26x+FvR2S/PPZHeHOFbXgfuSjwADReajZgb58phTIj0MNy9yOXhPMjAqmkc8M47tpcoR7CdjfXRjk3SQGF7GuFPiY9SVSSWxJFv8qr9P+/3jU0FVJSyuoAkYHEcBWVU7BtdAedQ7zSMBmGzZpIpY0fe/L6Br5x3QNeYV/8J2nD14JLa/tgDQ8Apoa69E7PLGUzaTJbNq+XTAKozgn0iuKv/srb2ffUEENdVa+umQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS7PR11MB5990.namprd11.prod.outlook.com (2603:10b6:8:71::5) by
 DS0PR11MB8717.namprd11.prod.outlook.com (2603:10b6:8:1ab::20) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.662.9; Fri, 27 Nov 2026 18:11:50 +0000
Received: from DS7PR11MB5990.namprd11.prod.outlook.com
 ([fe80::133c:5eed:3aec:b899]) by DS7PR11MB5990.namprd11.prod.outlook.com
 ([fe80::133c:5eed:3aec:b899%3]) with mapi id 15.21.0639.011; Fri, 27 Nov 2026
 18:11:50 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <igt-dev@lists.freedesktop.org>
CC: Rodrigo Vivi <rodrigo.vivi@intel.com>, Zack McKevitt
 <zachary.mckevitt@oss.qualcomm.com>, Jeff Hugo <jeff.hugo@oss.qualcomm.com>
Subject: [PATCH i-g-t 5/9] tools/drm_ras: Show and set telemetry fields
Date: Fri, 27 Nov 2026 13:11:37 -0500
Message-ID: <20261127181133.801215-14-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261127181133.801215-10-rodrigo.vivi@intel.com>
References: <20261127181133.801215-10-rodrigo.vivi@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR13CA0227.namprd13.prod.outlook.com
 (2603:10b6:a03:2c1::22) To DS7PR11MB5990.namprd11.prod.outlook.com
 (2603:10b6:8:71::5)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR11MB5990:EE_|DS0PR11MB8717:EE_
X-MS-Office365-Filtering-Correlation-Id: fd14eb1d-df61-4652-734f-08df4cb1e83c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|23010399003|11063799006|6133799003|261009223027099003|18002099003|22082099003|56012099006|10067099003|261022105027099003|261028144727099003|261026140227099003|261102123227099003|261021121427099003|261022075727099003|261021123027099003;
X-Microsoft-Antispam-Message-Info: w1t2GdftJl5spRrAEgflQIIrAnMRhmIIF/8sXYNMGty6O/lTlV2nzHHs6MbnonKTIuHaoa804+13TerUvqnLvwocAdym6Xg/YO4dEKAQ0mf/IVDWGeKnn7LIm4xp7TX9mm9JlTuRN/ZEMs9OyZKDcZhs/Oru4eD5s4o2uluGhERwo6O4emsk8M4KVTLyRGfn3fjb5s5HWKhB1K24EJwSl6zvaPUNTwr71eSMTl9IkjHnI6ElehtIQoAD2NF0H/PIESOZzz/q5vsZSJmv0cC0gXSCFkWSjqTxmpMbmlv3YDOIAa2M+flTC7wkq1RbzwFnbpJNT5CcdgYqmOJwMtJVX/CQL8tpwq+GEKWLvSDVPO6kCpZ5Ur+uuT2L+tB2KoSt+vvML9b6oD2Ls7ej+SpzWnqy8iljdIybA6EpRVUA1x14PQ3Xd0ePFlRIqgv4CyerLwsNdmv1/7TZGxMHkzSnK+X0NL686P98j+V2O8oe1quRq09Nf0kG3HTjC5vCR+doVZYcmWOwa9ENyD+HnX/GCWY7kUtiDly7ItcQkqB5zxljNoZysGGJbgsBJLFQ3AxgOLLo/cIT4iUYjjUspXDRxyqyxjnYH5cfYFVeMjxdrg7jPNvA49OkxV5WNNzL0lMR/mPEM6ZUq28F1ayvPb2qNHmWuiGyX2xgZrpCP1ARvBk=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR11MB5990.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(23010399003)(11063799006)(6133799003)(261009223027099003)(18002099003)(22082099003)(56012099006)(10067099003)(261022105027099003)(261028144727099003)(261026140227099003)(261102123227099003)(261021121427099003)(261022075727099003)(261021123027099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?cvbX6XPlzv2xg7ckviOX3da637ASVVpFnITNlEFeDG9G44r9HQ8vaFT87T//?=
 =?us-ascii?Q?mp6IwpA/vB0tI+Y/BbbkptTDoB48WhkGkjPYKCwtpR30LgrsAzuebZiDVM9N?=
 =?us-ascii?Q?koEFASkC7P3npJOe+B9pK2XR8MDsfvag0viZrDexB3AjGfZydbXw+vC2HR0H?=
 =?us-ascii?Q?rbcA21ZhcRrufPK+pA5SXb+cWRRmbK4RNjCxJGxlkb9Z7VWuuoWxaP7lMJKl?=
 =?us-ascii?Q?cgzCq/t7lySTJRck9LT3aQw0P8z6V/cLfAm77RzYt0qkUFIGgkA5yXyPe6+e?=
 =?us-ascii?Q?yTLLtgNYB3CuaCqdwt8ahwx9eBeD8QYbsQLX+bveuucimZ8mVjKC19Re/3qQ?=
 =?us-ascii?Q?RqU/QuYQerMlZckd04Jin09oqUie6lUzUYTXqYf0rNI5vTSYE1fTFf4iYuKY?=
 =?us-ascii?Q?qErq/r98TUZGvC5t67yTlsZKRY1akc8A0oT4orJ0PsTine+d60u5x2VE0Lgs?=
 =?us-ascii?Q?7zgjrZ3IBPXH5izwXyLzf03E7BJHoJI/uObEY/ue0PoaXXxv86q68YuFx1BG?=
 =?us-ascii?Q?zSatQKr33MlbIMIUMG5Z6iqB0QxBCiO3B3ptXRX3zG8198rt+JlTX1MPstFY?=
 =?us-ascii?Q?9WHvlQuc8L3/S4dFaXbo4qVad/fnoSYgqXYaX7hTWOvDN+kv5i5btNBCPSLi?=
 =?us-ascii?Q?mY7pmNLJ7UGdAmUznAqzHUkx1sbZQ1sH3bat+/z1TVpczjOh11Ww6a3bedep?=
 =?us-ascii?Q?CE5O+8T1BNOh6ReDvW6cZHr3WgGSG13vo+zoJSiD6h8H8W+qH6UCZR6ptKEi?=
 =?us-ascii?Q?sKUHL/XSEDUWTgbxaNQSGxWKr98D2xcwTnagNmeMSq9i/4x+HXJZeqVeqWje?=
 =?us-ascii?Q?wKOZLzBBXcYu1o9fIa6zLtQBLYxFEFq/WIUSP8czV5KhF05ljLRN3I7tLhgf?=
 =?us-ascii?Q?Lliv7nYG4lwnpv2d6MxfQ3XwaQJT7s7oOYT1Mp0HQrJOrosEvccTbcck3znC?=
 =?us-ascii?Q?QduKXVTNs9wImfAYqBcBx5k/netrYH2fK2+GYSWYpTbz6msJDd4zrwITlu8i?=
 =?us-ascii?Q?2G0By+VG3rinXD2bSDv94dKtwguyjOflX4xi1/tLWItFsdpseudCofYnSHMz?=
 =?us-ascii?Q?uXCg5vl1XhkshzrmR+D99e2GfVRPmrijn8SoXkm4B3mlzXThEfJ213ucKs1U?=
 =?us-ascii?Q?MhRN/QJzQcBG38iAgg8+rEQxxa795eUVKrQFZZXfmZzrygB2Gh0MQDZ+TFec?=
 =?us-ascii?Q?PHR8DxYljuxAsY/kFLrBNLZn+WwlmeCTWuz4FjCcPm5ACKIQKDmhG1j3l9B/?=
 =?us-ascii?Q?zU1KnqoXSdrSYg2DvFnQJOnThRhAuEJxC74vvow2EYosQXTWcDCMl43Przbs?=
 =?us-ascii?Q?LqqDDpL6ABESv+Q4xw7O4ghQavnk03YsMCbvbHyicnFkPTdniUTMwMREJdGe?=
 =?us-ascii?Q?0/l1luIF49B+bqrZwgbZm66TCEGZqgC5MgPIVXTFwLb4Nr797Y5WKsZQRuiP?=
 =?us-ascii?Q?VgEb365aVhdjVifZbSQa1+nzsq/+IyOdBlf5xNXciqjBcGcTZPrJCEgkSIed?=
 =?us-ascii?Q?r5UYItsFVzQ3zcd7iX04CeBTTd9nqmYxO9o1+cjS5hnwESNwFMW+FiawwNUx?=
 =?us-ascii?Q?oSyHC1RZb3R1Z6/Ddy+IbyHSuErWEm3nj221g+UN8sjJqPp+6kQEgddPdorT?=
 =?us-ascii?Q?99pNUc5fPWEZMDFsTfrzUFMh5hEa0jN3+RlaozGN5Ch9iz3Ul7gnYEbsMdVe?=
 =?us-ascii?Q?9Yxfy2kZZKBQB9JQ3Y682vME97sv7+mMvGdweSNRxigRf+AuNpE0uzrBdq0k?=
 =?us-ascii?Q?gl1fdoe1PA=3D=3D?=
X-Exchange-RoutingPolicyChecked: ERjd4bRzkniGvglfCq12TWYSNMV5SVKVOt693LnxcesxkU/ylZmQqg3AEaxjDYmLGzstILPgGSRwqFTb7yf7VOHgTyAAiUcGYRI/ZnG9YWL3dwMf1WXAO2422fHinHGCLRT507CdUIY5Fj2eiWBQXt9V7m3hX92glVguygJHbfF9J3gW9MyBH5ovvQ9FC5LSTysyo90NouUX0/ACQ8cwBn6BGJk4gIQQGL5SaFXr5Y7X4lTfe3JkYOSWp5WxDvC+Fy+ZiJTRmvrGftGbMTJkUq7NaoNeh2/wn/Z/ktoUSAx/c1gaATOzf7ZSvd027t2u7H0cfPtXt2QYriC+rcItpg==
X-MS-Exchange-CrossTenant-Network-Message-Id: fd14eb1d-df61-4652-734f-08df4cb1e83c
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB5990.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Nov 2026 18:11:50.2144 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Wb14QbvfFXiEqds7Jg3LpnE7DT5Q/Qpiz59e9EDyBzSTYgGr+s/OVMdveNUC7d598v3O1cAfhD0sZTHUngTOwA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB8717
X-OriginatorOrg: intel.com
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

For telemetry nodes, show one line per field with its ID, name, access
mode and, for readable fields, its current value or the status reported
by the device. Add -s <field>=<value> to write a field:

  # drm_ras -n <node-id>
  # drm_ras -n <node-id> -s <field>=<value>

Build-tested only, no telemetry device was available.

v3:
 - Align the field columns (Zack).
 - Return the error of a failed read, after listing all the fields (Zack).

Cc: Zack McKevitt <zachary.mckevitt@oss.qualcomm.com>
Cc: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
Tested-by: Zack McKevitt <zachary.mckevitt@oss.qualcomm.com>
Reviewed-by: Zack McKevitt <zachary.mckevitt@oss.qualcomm.com>
Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 tools/drm_ras.c | 127 +++++++++++++++++++++++++++++++++++++++++++++---
 1 file changed, 121 insertions(+), 6 deletions(-)

diff --git a/tools/drm_ras.c b/tools/drm_ras.c
index 0af1ca919..aae92f99a 100644
--- a/tools/drm_ras.c
+++ b/tools/drm_ras.c
@@ -5,6 +5,7 @@
 
 #include <errno.h>
 #include <getopt.h>
+#include <inttypes.h>
 #include <stdio.h>
 #include <stdlib.h>
 #include <string.h>
@@ -14,6 +15,7 @@
 
 static const char * const node_types[] = {
 	[DRM_RAS_NODE_TYPE_ERROR_COUNTER] = "error-counter",
+	[DRM_RAS_NODE_TYPE_TELEMETRY] = "telemetry",
 };
 
 #define name_of(names, i) \
@@ -38,6 +40,101 @@ static void print_error_counter(const struct igt_drm_ras_error_counter *counter,
 	printf("%u\t%s\t%u\n", counter->id, counter->name, counter->value);
 }
 
+struct telemetry_fields {
+	struct igt_drm_ras_telemetry_field *field;
+	int count;
+};
+
+static void add_telemetry_field(const struct igt_drm_ras_telemetry_field *field, void *data)
+{
+	struct telemetry_fields *fields = data;
+	struct igt_drm_ras_telemetry_field *f;
+
+	f = realloc(fields->field, (fields->count + 1) * sizeof(*f));
+	if (!f) {
+		perror("realloc");
+		exit(EXIT_FAILURE);
+	}
+
+	fields->field = f;
+	fields->field[fields->count++] = *field;
+}
+
+static const char *field_mode(uint64_t mode)
+{
+	bool read = mode & DRM_RAS_TELEMETRY_FIELD_MODE_READ;
+	bool write = mode & DRM_RAS_TELEMETRY_FIELD_MODE_WRITE;
+
+	return read && write ? "rw" : read ? "r" : write ? "w" : "-";
+}
+
+static int show_telemetry(struct igt_drm_ras_nl_context *ctx, uint32_t id)
+{
+	struct telemetry_fields fields = {};
+	int64_t value, status;
+	int i, len, width = 0;
+	int ret;
+
+	ret = igt_drm_ras_nl_list_telemetry_fields(ctx, id, add_telemetry_field, &fields);
+	if (ret)
+		goto out;
+
+	for (i = 0; i < fields.count; i++) {
+		len = strlen(fields.field[i].name);
+		if (len > width)
+			width = len;
+	}
+
+	for (i = 0; i < fields.count; i++) {
+		const struct igt_drm_ras_telemetry_field *f = &fields.field[i];
+		int err;
+
+		printf("%" PRIu64 "\t%-*s  %-2s", f->field, width, f->name, field_mode(f->mode));
+
+		if (f->mode & DRM_RAS_TELEMETRY_FIELD_MODE_READ) {
+			err = igt_drm_ras_nl_telemetry_get(ctx, id, f->field, &value, &status);
+			if (err) {
+				printf("  %s", strerror(-err));
+				ret = err;
+			} else if (status) {
+				printf("  status %" PRId64, status);
+			} else {
+				printf("  %" PRId64, value);
+			}
+		}
+
+		printf("\n");
+	}
+
+out:
+	free(fields.field);
+
+	return ret;
+}
+
+static int set_telemetry(struct igt_drm_ras_nl_context *ctx, uint32_t id, const char *arg)
+{
+	int64_t value, status;
+	uint64_t field;
+	char *end;
+	int ret;
+
+	field = strtoull(arg, &end, 0);
+	if (end == arg || *end != '=')
+		return -EINVAL;
+
+	arg = end + 1;
+	value = strtoll(arg, &end, 0);
+	if (end == arg || *end)
+		return -EINVAL;
+
+	ret = igt_drm_ras_nl_telemetry_set(ctx, id, field, value, &status);
+	if (!ret && status)
+		printf("status %" PRId64 "\n", status);
+
+	return ret;
+}
+
 static int show_node(struct igt_drm_ras_nl_context *ctx, uint32_t id)
 {
 	struct igt_drm_ras_node node = { .id = id };
@@ -52,6 +149,8 @@ static int show_node(struct igt_drm_ras_nl_context *ctx, uint32_t id)
 		return -ENOENT;
 	case DRM_RAS_NODE_TYPE_ERROR_COUNTER:
 		return igt_drm_ras_nl_list_error_counters(ctx, id, print_error_counter, NULL);
+	case DRM_RAS_NODE_TYPE_TELEMETRY:
+		return show_telemetry(ctx, id);
 	default:
 		return -EOPNOTSUPP;
 	}
@@ -59,28 +158,35 @@ static int show_node(struct igt_drm_ras_nl_context *ctx, uint32_t id)
 
 static void usage(const char *name)
 {
-	printf("Usage: %s [-n <node-id>]\n"
+	printf("Usage: %s [-n <node-id> [-s <field>=<value>]]\n"
 	       "List the DRM RAS nodes, or show the content of one node.\n"
-	       "  -n, --node <node-id>  show the error counters of a node\n"
-	       "  -h, --help            show this help\n", name);
+	       "  -n, --node <node-id>         show the error counters or telemetry fields\n"
+	       "                               of a node\n"
+	       "  -s, --set <field>=<value>    write a telemetry field of the node\n"
+	       "  -h, --help                   show this help\n", name);
 }
 
 int main(int argc, char **argv)
 {
 	static const struct option opts[] = {
 		{ "node", required_argument, NULL, 'n' },
+		{ "set", required_argument, NULL, 's' },
 		{ "help", no_argument, NULL, 'h' },
 		{ }
 	};
 	struct igt_drm_ras_nl_context ctx;
+	const char *set = NULL;
 	long node = -1;
 	int c, ret;
 
-	while ((c = getopt_long(argc, argv, "n:h", opts, NULL)) != -1) {
+	while ((c = getopt_long(argc, argv, "n:s:h", opts, NULL)) != -1) {
 		switch (c) {
 		case 'n':
 			node = strtol(optarg, NULL, 0);
 			break;
+		case 's':
+			set = optarg;
+			break;
 		case 'h':
 			usage(argv[0]);
 			return EXIT_SUCCESS;
@@ -90,11 +196,20 @@ int main(int argc, char **argv)
 		}
 	}
 
+	if (set && node < 0) {
+		usage(argv[0]);
+		return EXIT_FAILURE;
+	}
+
 	if (igt_drm_ras_nl_init(&ctx))
 		return EXIT_FAILURE;
 
-	ret = node < 0 ? igt_drm_ras_nl_list_nodes(&ctx, print_node, NULL) :
-			 show_node(&ctx, node);
+	if (set)
+		ret = set_telemetry(&ctx, node, set);
+	else if (node < 0)
+		ret = igt_drm_ras_nl_list_nodes(&ctx, print_node, NULL);
+	else
+		ret = show_node(&ctx, node);
 	if (ret)
 		fprintf(stderr, "%s\n", strerror(-ret));
 	else if (ctx.dump_interrupted)
-- 
2.56.0

