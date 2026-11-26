Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2920606A31C
	for <igt-dev@archiver.kernel.org>; Thu, 26 Nov 2026 18:08:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Dmplo8s+;
	dkim=pass (1024-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=TqsKuZym
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7645A10EA03;
	Thu, 26 Nov 2026 18:08:08 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D6C8110EA03
 for <igt-dev@lists.freedesktop.org>; Thu, 26 Nov 2026 18:06:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795716369; x=1827252369;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=8rdg1mGZ8GAoPA47AWsxdJLArXgsYwPvslGIwl2Khb0=;
 b=Dmplo8s+cauEAYN+HfAVucn0eHVjYNWemO4NTxPKIAEfZxMT01S74iqp
 InXtLErD218YwfKpRnN4N4a+VUw354DTzpYXUlJ0xLHFi8AHFgmDSYPha
 vRhioF6yAz/SBp5SvkRZWtVezGeFX6K9jmO50Zg9/1MLq7VtUMNornzgL
 p7CTua4r7HaNNUQYakOpPKkYuelhbz9o2IDMJ8tsBI6BLrOKCld7c+0/u
 R+MZRJBtl8NaKjHh0xoJyaqsP0hK//Z/Ucd5Le7MjUZIjWOik+N5zPcob
 cd0P/WUjfr6NDjJdEyzvJSw4FjkhgjDotskIe0JMKxQ79hmWbIplIIb9f Q==;
X-CSE-ConnectionGUID: mOPB/htxQB2RyzZgNULhlQ==
X-CSE-MsgGUID: YamSeZM0S96bj5NsJsRIoA==
X-IronPort-AV: E=McAfee;i="6800,10657,11978"; a="4632980"
X-IronPort-AV: E=Sophos;i="6.27,235,1787036400"; 
   d="scan'208";a="4632980"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2026 10:06:09 -0800
X-CSE-ConnectionGUID: NzqHpVxAR9q1HXS+PCMbfw==
X-CSE-MsgGUID: s/dJjmfwT6qw9YSSk4WZEA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,235,1787036400"; d="scan'208";a="12731585"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2026 10:06:08 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57; Thu, 26 Nov 2026 10:06:07 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57 via Frontend Transport; Thu, 26 Nov 2026 10:06:07 -0800
Received: from DM1PR04CU001.outbound.protection.outlook.com (52.101.61.60) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57; Thu, 26 Nov 2026 10:06:07 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=J/Dvuxf1+T/aTqgxp5CjrUJcDYXrqAZXoMIjBafM0Y/FHFKPLz8SJrRlpZeGE2ZzpR67NSBSsk2o/LfkZwTIKMhLcZbxVz/XWl+drqQt8WsvzE2+nsH/sSC/6W4N2nbIEe6R6oF/GjA3bG/5uIPxRA6RZukqX27aEhxXevFdTTYLynNorFOrGofTaeHGQhMMl5VS8iRF6rVqjkBv0eKyQZNowuUuS4JAfncw/qgsvtvNMyHB2yCdtQrkbmJzwsQAZs/9XRLshMvUlkeKZDc4KQXkUBP3fcueAfDQU2MH5y6MtN8abdzdNzcdmIo5a3q+OCzkxWlB4uNyRo9wjveh0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FXdQ4Xq1qyaBKeZyhpVbHWcJNTdbdFmb69k6lKiGweo=;
 b=ZEjjlDD0EBOAQpapYdEUP800xyA7UfgL3A0Qv5NecdDInz/DzmBMrVUYEaDHA0Y9y1z1wSeH+UbYS5OImsLHB0/yV9AQZa9spCYV8ki/EGUaD5SFU9QqxBMly5LkGcohXfDKgAYb/nrYb+XQTGe6bUHAKXD+TU8e447SR2Cr3NgzPEN45TLo3MXm0BmZHJmAaB6lJfYvo+//JSEIiGLbtqN7c8w+p8823/CtRtuH1TsQFSVh671NYrRVSetLIDYTBsM+JnfCChdMutq/QN3f0vr7AFrxuNG/u26l19NYJSdwwg+0Wyi4Pjij9l7jOPKvwMfhIu4tvnVSF/FF8ABLqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FXdQ4Xq1qyaBKeZyhpVbHWcJNTdbdFmb69k6lKiGweo=;
 b=TqsKuZymOwxF9++S5jCNgw0JbzkRjFAnydIxhFqdMa/DvhlwAXsweQJk/fIZWZj50JDnooyqzCZQIwSx8m4u2Shnqo0UZgbRD40ACrsr1a+voJpOf1zX0uBexWD7V2i5oFhnx1iWRLVfmwMkut3JaZXlA/CxUxkJLaE0r5GUOb0=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS7PR11MB5990.namprd11.prod.outlook.com (2603:10b6:8:71::5) by
 CYXPR11MB8754.namprd11.prod.outlook.com (2603:10b6:930:dc::13) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.662.7; Thu, 26 Nov 2026 18:06:01 +0000
Received: from DS7PR11MB5990.namprd11.prod.outlook.com
 ([fe80::133c:5eed:3aec:b899]) by DS7PR11MB5990.namprd11.prod.outlook.com
 ([fe80::133c:5eed:3aec:b899%3]) with mapi id 15.21.0639.011; Thu, 26 Nov 2026
 18:06:01 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <igt-dev@lists.freedesktop.org>
CC: Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: [PATCH i-g-t 8/9] tools/drm_ras: Show retired pages
Date: Thu, 26 Nov 2026 13:05:42 -0500
Message-ID: <20261126180536.487442-17-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261126180536.487442-10-rodrigo.vivi@intel.com>
References: <20261126180536.487442-10-rodrigo.vivi@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0084.namprd03.prod.outlook.com
 (2603:10b6:a03:331::29) To DS7PR11MB5990.namprd11.prod.outlook.com
 (2603:10b6:8:71::5)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR11MB5990:EE_|CYXPR11MB8754:EE_
X-MS-Office365-Filtering-Correlation-Id: fcaa76ff-b4aa-4df0-ec42-08df4be7edf5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|23010399003|1800799024|261102123227099003|261022105027099003|10067099003|56012099006|11063799006|261026140227099003|261028144727099003|261021121427099003|261021123027099003|261009223027099003|22082099003|18002099003|6133799003;
X-Microsoft-Antispam-Message-Info: lAd8m8yDYKuOO/wuk+Ue6gMBlFYGRSUkBSiPwWyedFWUIHx4kv+TPxnE6kYeFko5r3I7mgLSC8tbeWF0ofFQxAE3jPrEon28ZaS0lwZkwXkMsHnGzDUxdgPd9nmDQ/2ZtTaaHfD0X4MD0bv7h0IFKTdn3KhvYHoy9meDqZH7zkji68S8ma/xa6DvebSstCzfvpyEvjCY8WZTfLbxMY/n0glJ3DHTZoAC69eb2NBVfOX2Pyc5de7pxgnUCvhjCO8Q6px+EfN4qiNFxQbOTXICNIjYFMek4YVd8zBlQXE8lfxqmaMW3h0XyP+68vi10rlMuGa7VvlIwObeFAzcTHCs/Z8cqWc+Pu7c36xAtQAddzR5lb8XBL2S1b+NlmZGAFTTIobX3YAWSV8Fv/ehQb+E9oylwWRYbN7qa99exKj5CSTtnJnL1EvWBURRUIqn+Fu11orA9KF5E+jQ5SQKuCdrG4sKHl1T05NAhHD/URVSzBKaW0kw0+SUXsrfbZpQShu+NGM6aok9IoMWwQ+h9UIhgpk4HWma9YOt7cMoz4seQfkqkcQcG4N90PwKmVEOH1jitKQvYVn623AMYxYDyFtqZHH9g1MT/wAFiGJ+Cqa1Iisk96g2CBxVnK/pCtU/jnEoJIV0s7Io+RxZR2ZmJfpETz9+vaSmbb/13vG7/B0Tcg4=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR11MB5990.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(23010399003)(1800799024)(261102123227099003)(261022105027099003)(10067099003)(56012099006)(11063799006)(261026140227099003)(261028144727099003)(261021121427099003)(261021123027099003)(261009223027099003)(22082099003)(18002099003)(6133799003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?wErzthME6SY2fb0edLzLKcDouGS1jUN2aQqyQdjDbD+vwcvct6ixWCKztSHS?=
 =?us-ascii?Q?0Is6QoVmxw/nl+1bebml7FPxPpQBDOMzbWo+8tuFq8zY/xlMk3IoUzW9WB2I?=
 =?us-ascii?Q?LnjC6duJ2Bj4MBSdPTrX/9v+OFrdC1n7wexVLyF0dW/aDjbud0xK3AAEECo5?=
 =?us-ascii?Q?W13MgSnuMj6ML2quIiNThR+lEIKxD6ttZI9kEMsaFo98RT83dg+eSQOh+cMD?=
 =?us-ascii?Q?iF2sNugJgVYE+K2k4LWq+HaCa2GcvZjNevacLSGjCyAjDLnB57fRj3GjBprt?=
 =?us-ascii?Q?5D5L5Cm7tEqlRdPFs4IFwPQfO0yI19L48Ga8kuVl5eRdR8texsEiahGRBUoi?=
 =?us-ascii?Q?06AltLPq/5t/BnQrBpzdSfK37cjc08Xpp5qXkvWgxim5zm37PBz0dkKfbkA4?=
 =?us-ascii?Q?SakUfPwgV1cRDAFmcpPu4kDdzaCoFvpod6bzuJ6GqF66K4IZCz+WqesFYAmC?=
 =?us-ascii?Q?lM9kljmnHatoUwE9UTdYhw0IT9IO50cpPas7xf5I5S0HLS7CzS3ZvwsPKrOL?=
 =?us-ascii?Q?6POpP6ZqvH+zNUNnHsZJixEwZ2WyQ2iZhoaJCoJRs1jP6CdGgq50J+r7m6i2?=
 =?us-ascii?Q?MdYjIO7SfZtGTkl38Gc5FXkjyQayWJut6DjmUpEaFp7GOTvW7/lfMEH0d6R6?=
 =?us-ascii?Q?2EbepoyKpyk8BuUTJ1aqwL+PdhWwJtKEccdjMMrODk0mPzIqGtJzCaNJYbCS?=
 =?us-ascii?Q?E3zF2x5lg1DdTr5Ygqm+h+9yf5/itJZdeOxqKYGN3mm/ngtKkns3RLmtsDmj?=
 =?us-ascii?Q?rm2C0vZpPOPkkgxvtWAUyhAfOMNtTVwTxdizT+XIT3GfXXDgZ+JWCjC4wMbb?=
 =?us-ascii?Q?N3Qus9fWQajkbmCKmAXRgoHhmE7Oe5lwWyO1oLJwTUZ0GD0U5EPy1Onhgn3r?=
 =?us-ascii?Q?HYXkz8kpqVp020ICaRpFWqO+YtjlXLU5rEZUE3WRoR9GpJuBeBc/BYcROOAX?=
 =?us-ascii?Q?TfxIQpyx1H2xJnheUO1M1xxXYGDkrtQeiS4pNDoW8sDewWDAGm+L0cW4ctP5?=
 =?us-ascii?Q?6J3dJiK5fMqdMlULXleUNixFuCpPJmmojuO83NfMEXURrioHhKNK8g7ONoZa?=
 =?us-ascii?Q?Qfh3k285q3lHIpVKaWL1kXuPJUH4HNuKl2DumTcR+ZR342L/pbEWEmiFeWe8?=
 =?us-ascii?Q?tnA8kU4eH84SsfzpCiSa+yh3p2gJB+rDUMOvntkXjJU1veKB6sIiLUsdjMlr?=
 =?us-ascii?Q?n65yYdQ/ZjX/i7TtegVWaryBUvIHfln9vghF29j6EPXg26MHWQH0los0O0if?=
 =?us-ascii?Q?64i7gm6yxVUarUI/5rE2hY3Z23Ty68JGjUkQ3Wv5MYUQTdx4geYdbBdzDSZu?=
 =?us-ascii?Q?C+W+lMimwiyjhFhmiOVNvf7CxmYFcdsi75EMjzKrX+rbOxQ82xnzXKzSFXiz?=
 =?us-ascii?Q?KhQCrnIC/eWddW6yg5tvPWNAdqCS3Qj0BA/uaSzQHjKmHiomhDpWhGBtwLtu?=
 =?us-ascii?Q?f58CLcOK5ulWqEZ4EmMXWyhzDJ1UfKsJgloG6wHpcpOIl4Ajl6bm+BUDaspv?=
 =?us-ascii?Q?RsO2+xhNOKBtrm6W0gixpKdpbYPudFCrPy2EPV9wHan31bQfVePWfXB5nUde?=
 =?us-ascii?Q?RF0qTO+FfsvMPl9IXs52g8iD3on2/FWxBsY16QFQj0fGJBUgpUXNqzK99/p+?=
 =?us-ascii?Q?iB7RDeRQ+BV30ixOIWEOGIBCqLQ8ny0lDQ7wjOHd2KGV7ftDFBptXezJEcMx?=
 =?us-ascii?Q?6GLJubJe94kQQ41yBqo03mN77N7fdwCCnxdihiTTIjhWYLr8+P62ON8k7Nb1?=
 =?us-ascii?Q?N5kzxFGNKg=3D=3D?=
X-Exchange-RoutingPolicyChecked: jjKlF4W7grWbBUuDkJSY4EkZemEo+dh5znhMho/GCa5de8dGYgHZVgLec1e69CBd+ZTE2yByCo+U7rDKZ69/M8kpJaorwr6yIZ/52ncFkJftBX2f42ZByrBMo03vmlGUYkxyOZYdXBDApNJmSu+PPB1aI7/TcG0skSoOXS5yjxLVgtDsF0CGI3j+0JlU4g8KoNSVhBP7ZKm+RBl67gr/O8ym9DFwzYbhAR3NiyHwesshHGIGM81cL6fSq6MjDu2qL9CKaYIT9qeRManARZWDN1J8W3cEmpS8PK44YnANLlbuLd8qPp8MrWY84wNKeO3rAWS5/3MvSxGdJqw8EaQlKw==
X-MS-Exchange-CrossTenant-Network-Message-Id: fcaa76ff-b4aa-4df0-ec42-08df4be7edf5
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB5990.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Nov 2026 18:06:01.3807 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3n/UweeS5tSpXyMzAPctxn+caBRaCL5WeNoixGqOWVgyg5gKNSi4GsOfwU5YNQY2xwwo3mkhyMNAzJQhz+ROsQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYXPR11MB8754
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

For retired-pages nodes, show the maximum number of pages that can be
retired and one line per retired page with its address, size and
status:

  # drm_ras -n 2
  max-pages: 64
  0x00000002fb5bb000	0x1000	retired

Tested on BMG with simulated retired pages.

Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 tools/drm_ras.c | 33 +++++++++++++++++++++++++++++++--
 1 file changed, 31 insertions(+), 2 deletions(-)

diff --git a/tools/drm_ras.c b/tools/drm_ras.c
index aae92f99a..7d200df76 100644
--- a/tools/drm_ras.c
+++ b/tools/drm_ras.c
@@ -16,6 +16,13 @@
 static const char * const node_types[] = {
 	[DRM_RAS_NODE_TYPE_ERROR_COUNTER] = "error-counter",
 	[DRM_RAS_NODE_TYPE_TELEMETRY] = "telemetry",
+	[DRM_RAS_NODE_TYPE_RETIRED_PAGES] = "retired-pages",
+};
+
+static const char * const page_status[] = {
+	[DRM_RAS_RETIRED_PAGE_STATUS_RETIRED] = "retired",
+	[DRM_RAS_RETIRED_PAGE_STATUS_PENDING] = "pending",
+	[DRM_RAS_RETIRED_PAGE_STATUS_FAILED] = "failed",
 };
 
 #define name_of(names, i) \
@@ -40,6 +47,26 @@ static void print_error_counter(const struct igt_drm_ras_error_counter *counter,
 	printf("%u\t%s\t%u\n", counter->id, counter->name, counter->value);
 }
 
+static void print_retired_page(const struct igt_drm_ras_retired_page *page, void *data)
+{
+	printf("0x%016" PRIx64 "\t0x%" PRIx64 "\t%s\n", page->address, page->size,
+	       name_of(page_status, page->status));
+}
+
+static int show_retired_pages(struct igt_drm_ras_nl_context *ctx, uint32_t id)
+{
+	uint64_t max_pages;
+	int ret;
+
+	ret = igt_drm_ras_nl_get_retired_pages_info(ctx, id, &max_pages);
+	if (!ret)
+		printf("max-pages: %" PRIu64 "\n", max_pages);
+	else if (ret != -EOPNOTSUPP)
+		return ret;
+
+	return igt_drm_ras_nl_list_retired_pages(ctx, id, print_retired_page, NULL);
+}
+
 struct telemetry_fields {
 	struct igt_drm_ras_telemetry_field *field;
 	int count;
@@ -151,6 +178,8 @@ static int show_node(struct igt_drm_ras_nl_context *ctx, uint32_t id)
 		return igt_drm_ras_nl_list_error_counters(ctx, id, print_error_counter, NULL);
 	case DRM_RAS_NODE_TYPE_TELEMETRY:
 		return show_telemetry(ctx, id);
+	case DRM_RAS_NODE_TYPE_RETIRED_PAGES:
+		return show_retired_pages(ctx, id);
 	default:
 		return -EOPNOTSUPP;
 	}
@@ -160,8 +189,8 @@ static void usage(const char *name)
 {
 	printf("Usage: %s [-n <node-id> [-s <field>=<value>]]\n"
 	       "List the DRM RAS nodes, or show the content of one node.\n"
-	       "  -n, --node <node-id>         show the error counters or telemetry fields\n"
-	       "                               of a node\n"
+	       "  -n, --node <node-id>         show the error counters, telemetry fields or\n"
+	       "                               retired pages of a node\n"
 	       "  -s, --set <field>=<value>    write a telemetry field of the node\n"
 	       "  -h, --help                   show this help\n", name);
 }
-- 
2.56.0

