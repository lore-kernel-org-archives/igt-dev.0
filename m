Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBAD3C25B78
	for <igt-dev@archiver.kernel.org>; Wed, 22 May 2024 14:33:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 11EFB10E4FD;
	Wed, 22 May 2024 14:33:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KxB4KAzQ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F56B10E4FD
 for <igt-dev@lists.freedesktop.org>; Wed, 22 May 2024 14:33:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1716388423; x=1747924423;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=RPwnrRsY1DxYX8mHDCRZnDPqZJWr9c5vJQJIUVisOOM=;
 b=KxB4KAzQOJ68T7WXZFOhaGXVrizhc5mgAP133HmU7vd5U++QnpIMXZ8q
 i0aINGUK+aT9RODXPp/VZf8Ci3dMVE/ovyN/kCWO0cg08aLi/PBkmKPLj
 IqGGKTvaikmGdjwYuqSjjBZq/cy6pSV3eP2AKN4AlXOGP+0DkYQlIJ+gk
 pD7lItlP8bhZB0vvmxYyhQDJPDWmCAbB1X2g2QipYf/PaQSmdkm1E8HIJ
 hUJI54d5RJjUwh7K7+bCBczWc5GkOmUP3Pj5v+LsrL0IvGeaYzLdcGE7c
 F3RN2oh6bObUsfd9Wdig3BrICnlWakMVmFFp7PRNyQALNwWvJF+eAh/o1 Q==;
X-CSE-ConnectionGUID: Iu1I8BThSnWEuIJBlZr2xQ==
X-CSE-MsgGUID: cBagzHzMTNyILOJASacV8Q==
X-IronPort-AV: E=McAfee;i="6600,9927,11079"; a="16475462"
X-IronPort-AV: E=Sophos;i="6.08,181,1712646000"; d="scan'208";a="16475462"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 May 2024 07:33:42 -0700
X-CSE-ConnectionGUID: Scum1VJ2R2C8TSOaVAjRlQ==
X-CSE-MsgGUID: EKPrCdw8Rim9sOEOzGo6HQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,181,1712646000"; d="scan'208";a="33888425"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orviesa007.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 22 May 2024 07:33:42 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 22 May 2024 07:33:41 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 22 May 2024 07:33:41 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.101)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 22 May 2024 07:33:41 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OHJTPObkSy75hYhUa5mrA/BWZq6JeV8ZN3dZtIHuo8GoBeN6wOktbd8GlLZp5/dr90XT8MyJSoIWn9nIhcdTsvw6KPpyrQF7sLwu9gbhBQlGo9SffXAWvcEMt5Iv6QcmdqZNUlF0ANW4Ufy+R1iHji/+TwMVORoyfxxqaxfvGNXXqY4mo2VZKz+ueFJcIX/b4ffUmO9W1YHRC6DcuWGiQNqLt5xGMz8voSb03euxDKaVGx9eeyAIg7kgxhnNtXhU/vFbjl49L0Hz5ovrEzgOZEg90SB6psvrFFYEv3uXDV/yj4pozbEdDAW3FspJzAibvhTDYC7AtZ3NQ3Cjf2hZzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HoN+mOpAx2INIoALol1KIQHzxuGGeK0TZroXOV0z6A8=;
 b=UWnqqpvc5LKNb56fAguqRfOHVWUpEvZJwZ5Qti9HwNKMdTP1/NwTLrkibisyqi0u28qp4lB+x1UC1EZ6V2Q0n2h+36JSzFuVG1LD/j/WpCh9ZiKzeGJwan5ys1NsG2RQNWbkRh65PI8aV2hCdON8Kco7zw5ORramJ54XTahyfm2ZyTbgNasTpWD6poaVfr2pKkPKGiC2oOVUjhlyuGIxb573KLsona39B6VT/VnCAt+O2icZN9HOxMy8k2rFnVXNldNLqmeaj9csYmob7VYASDYb3cslhjYWPD2qlPln/gE7PKnBk/u3VLas7Wt0FbnGJqgruWXbPmVBsABxPyCZBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by CH3PR11MB8362.namprd11.prod.outlook.com (2603:10b6:610:175::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7587.36; Wed, 22 May
 2024 14:33:38 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::cf6f:eb9e:9143:f413]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::cf6f:eb9e:9143:f413%5]) with mapi id 15.20.7587.035; Wed, 22 May 2024
 14:33:37 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <igt-dev@lists.freedesktop.org>
CC: Rodrigo Vivi <rodrigo.vivi@intel.com>, Francois Dugast
 <francois.dugast@intel.com>, Kamil Konieczny
 <kamil.konieczny@linux.intel.com>, Riana Tauro <riana.tauro@intel.com>
Subject: [CI 2/6] lib/igt_pm: Fix and standardize IGT PM library documentation
Date: Wed, 22 May 2024 10:33:26 -0400
Message-ID: <20240522143330.312014-2-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240522143330.312014-1-rodrigo.vivi@intel.com>
References: <20240522143330.312014-1-rodrigo.vivi@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY5PR17CA0027.namprd17.prod.outlook.com
 (2603:10b6:a03:1b8::40) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|CH3PR11MB8362:EE_
X-MS-Office365-Filtering-Correlation-Id: 7751e902-5efd-4cbb-2868-08dc7a6c2a8e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|1800799015|366007|376005;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?1zue2E60cNd81Mv0y4rRynV0nNo67c317CWAvzhELWdnspQxANfw8I17U6od?=
 =?us-ascii?Q?4eDQ6ss+BAhrYjNhn42e8Lo/D1tdRZ1jUYKk1NYt7o7adKZWYmk+rFDaQG6U?=
 =?us-ascii?Q?HOP3jBJeyt6VH1uqkRymy8ASfA7zWw7rb4k249y1A7Rn052xN+WJiIr+D6jB?=
 =?us-ascii?Q?6htrvrY3CtYIERZj/Y+eZK6i5RgdeANOzw83opUD3OyHcG029wDowAoR+2XX?=
 =?us-ascii?Q?8CqRdEav9o/t3djizzR+I2JiocnQNvd2qh4ugYi8gImpkHGxjPrc4LOAengT?=
 =?us-ascii?Q?qOE9VxSYSb4OfeSAAPFIadxk2ZsCxW+W6wO7DiSy4olDGEovtF7XD0NH1GCA?=
 =?us-ascii?Q?FPQiGyO5sfaE4Nmw/82lq1pLe/GJ8svWe8fifHEEtjB3Kfxg5LyY8U8vuBto?=
 =?us-ascii?Q?SKJVz9aquigfjiOI4J85X0R/cpgtWrvsxi8JOav5yc5yILI438APhExnZ+U8?=
 =?us-ascii?Q?t75+CE0LEVmOv8RNUNGHFdpY41GZOV8gKi5HP3UBhOXLuOiIXvEsMwKawfFB?=
 =?us-ascii?Q?ZBIswCmQn23+to38k1skqDLXWKinugGyVf6PlALEWhmWJe7BuQoZo7Kp3EDN?=
 =?us-ascii?Q?cvjnWDD8gi1jpsgRd+tW03CFpcZUTgK8Qnx//bdcLfdT6jmV7+WBnVTzJJ1i?=
 =?us-ascii?Q?pAFtSmUyogC5yX6k7VPVH7kz+/+dAbWy1suXpaoUB76l9b21nAOWhSK8HGzL?=
 =?us-ascii?Q?xn28+YKaZ8P46+yYYQ18HbEePhDImdshR1hb3B8xWgM+Sjo/ZQRUeuW3YHsm?=
 =?us-ascii?Q?wlgnUFVN+0jUX1vdcSBxakmeWKcrpcT1AOf2i7lpKaFPA+dpiSMqmSHltf1b?=
 =?us-ascii?Q?eQhKBSzvYuZAlXKWhSdp7sWezmnTHPfuEDwv2iT4UDtquVZISwWR0hgkF3PM?=
 =?us-ascii?Q?pSZVKdGZhdp25+JhAK1+U3j2RE3ZGTpZ8pvdZNAaL0DuuB4ZYnB+j5GBviKY?=
 =?us-ascii?Q?fofV1egNglfxrQ04VIbLYg6jMxkqtBWqnO9E9UOQucrx6cTxqAl1lOt3fbJe?=
 =?us-ascii?Q?n7b3I+xr3VrAW33OecXuAYGg15DV2RjjtQtwce59rk5wYH7iHFgSLITXIUxT?=
 =?us-ascii?Q?YIl5uxnjUiQLR3I0cpJQrboIbq/gkMFmGbqRUxgbWS7m6QpmSzRl9LRhwab6?=
 =?us-ascii?Q?xTuFx/oMlyfvCugfzKrD1U8WCaw3exTg382z//IC35RKsiUUaEDOkhMUU3Hc?=
 =?us-ascii?Q?qqUN7TtnBbFpS0RbLX0WfGZbbj8/gYJffrou2UEGB2FVZ4U6KJhXgVT8q2ZC?=
 =?us-ascii?Q?sZ2qK7Bx8j8BKw1pyTMcqJucILhZOcmHcHYraA5Bxg=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(366007)(376005); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?jDri75M25Mi62M/Ie1/HJ7OX3nTY31gZfuuLUxQB9f7IHYAIR3uxi2yyCCcm?=
 =?us-ascii?Q?a2TX/AAOy1wFEbXlj7wwqlwS0vS3NRQYApELvcJDw7Rxw361EB0X+Lg7UJ2o?=
 =?us-ascii?Q?t+g+TRj9L6R20nGEA5J95qhKDc0R/eV1r6u38CAm6Hrc5tTQkuLE4l5M6Nv+?=
 =?us-ascii?Q?360Wq573l5hKNXch2jMF14hH0nGfojH/MggUkDxqy+Pv15yk7a5LggGzOCGb?=
 =?us-ascii?Q?UdB6tye3585sEQ8Fg30aNX54hDBggzWRXc06G6en6rUDCEXvc2WNiha+2Kp6?=
 =?us-ascii?Q?b33k5zj5Izduq4NiHbidVaLbYyR5OGcbGmyR2b+JjaqaOLPxSZgJl4zdAIj7?=
 =?us-ascii?Q?mVu6rS1Nmna+1a5VYMLk0wh9biOOsjxGeDHMrl2U3AyGRvYSfkMF1duvWFbu?=
 =?us-ascii?Q?/yk4oMffCO5vTdVhZiaJdJ0KPgYNSkDhKMBRbDpbfQIh2odVnoBnnCvgiRJJ?=
 =?us-ascii?Q?gNYRn3FCbYjLFq8FL9Qyjjmwu5xhj/TKVsbRKnxHRVKVnnpeoEy3h5HfDvPp?=
 =?us-ascii?Q?lrLNYL85DLvhH8AbHWqJ/vFomWWgeZxLFiInwe7zEaqb9wBXuc+KOiZC4h3b?=
 =?us-ascii?Q?0+t2cCmxO5tzNGs4pAlfn+rGePFxKuh3bdVDW7o7Ry0QoWsuprD9cK8W13+X?=
 =?us-ascii?Q?eHc7ggIZeYB6UFe3m3YcWvu2KayLBQbHLwWHhSuH4Q5G1HWOew7Jy4GKSSrJ?=
 =?us-ascii?Q?5ylYwNYtH0GOm59poz8++KHWCzAqkMCAhHbzfNolFpt4Ovc9Gs6X8f3qmKzA?=
 =?us-ascii?Q?Qd0YxQL9EXM4qNjU422s0WqYnR8O3AH6o57lhKX/CvxHO/Qb2L8eBLtnjgpi?=
 =?us-ascii?Q?MB0ppWw5L/ku+6AMcQHSkdI6KCnoI70eFmypjO6vC/gufRVFi6YBBrzAkcBE?=
 =?us-ascii?Q?j+D+RSJ5F9yMTwSSI8CTrNqWBNYzQMboW3C6AR920r/jNH11ZYrM+qGNQnHC?=
 =?us-ascii?Q?g2PwnLhdwaA5xW4lwbQA5ZnUY1Jfs+IHTQpdtu5ATYMXvsoQ2EyScMYezcxx?=
 =?us-ascii?Q?XDbchakihb2xtxQUlAkFN+xK3W5LuuRwudbBzacM3/u0HJBRzT+WEW+8yBi0?=
 =?us-ascii?Q?jJb71lcveeBIFfbz4XcXSiSDqim/y3Se/yAmeZeJUeHu4LKWuauAAbSr7cHV?=
 =?us-ascii?Q?4+yswxyctafC6vIQM0YXFJp9qyygKlXrwfkXY7A5N0EILXt7gqoWa1FCVip4?=
 =?us-ascii?Q?rbX1pFKuUvSyX55/7D4uGWdlqZg3/bCOtfK7+ioPIGWDGRnAWRfaoPbBI49l?=
 =?us-ascii?Q?+tXZ8kMbePVuPCuE8ILzxEipmDetDotra4ergAKiiTsgiKF9nPzKxBjmCbLF?=
 =?us-ascii?Q?1bE42cyNqFKywGEHuPIDfakKpYT6gS93CVYtx2kyqbMYVR6ERyERqVCezbUc?=
 =?us-ascii?Q?KT4OaCU1YbyQMyzgUJfocuNQ2aCLAw2eEKnOHjO+k1PfNKbcn827ZPfaNfmJ?=
 =?us-ascii?Q?TvlgN99RI2j4yGgsL8jbIvidwZi9mo+yjhRWAHjobirCeNK9YvCV/CbYii0q?=
 =?us-ascii?Q?tlHGKJQGMJIdkY+qojsap4QWX+W4WALW5IVdzGFsrvHdDKiCvxLHn3Wqkn8R?=
 =?us-ascii?Q?nx+gcnhynhDonSs+9CQcaz/HZZSwAEzQ2QISaSZb1Qokk5sXkX1j+6uf4ch3?=
 =?us-ascii?Q?kQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7751e902-5efd-4cbb-2868-08dc7a6c2a8e
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 May 2024 14:33:37.0671 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: blIRp60YUXso3pG0jIY1Wj1eql+oMHUjRgUMXbwQI9bRSt8TDbKyzSmRMZXNNCTP+QzW0lEmzFBSofA3FSpKIw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8362
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

A revamp to get some kind of standard in the various exported
functions in this library.

v2: s/miliseconds/milliseconds (Francois)

Cc: Francois Dugast <francois.dugast@intel.com>
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Reviewed-by: Riana Tauro <riana.tauro@intel.com>
Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 lib/igt_pm.c | 148 +++++++++++++++++++++++++--------------------------
 1 file changed, 73 insertions(+), 75 deletions(-)

diff --git a/lib/igt_pm.c b/lib/igt_pm.c
index cb18a88b9..ad7e13604 100644
--- a/lib/igt_pm.c
+++ b/lib/igt_pm.c
@@ -454,7 +454,7 @@ static void __igt_pm_restore_sata_link_power_management(void)
 /**
  * igt_pm_enable_sata_link_power_management:
  *
- * Enable the min_power policy for SATA link power management.
+ * Enables the min_power policy for SATA link power management.
  * Without this we cannot reach deep runtime power states.
  */
 void igt_pm_enable_sata_link_power_management(void)
@@ -469,7 +469,7 @@ void igt_pm_enable_sata_link_power_management(void)
 /**
  * igt_pm_restore_sata_link_power_management:
  *
- * Restore the link power management policies to the values
+ * Restores the link power management policies to the values
  * prior to enabling min_power.
  *
  * Caveat: If the system supports hotplugging and hotplugging takes
@@ -566,8 +566,7 @@ static void __igt_pm_runtime_exit_handler(int sig)
  * Sets up the runtime PM helper functions and enables runtime PM. To speed up
  * tests the autosuspend delay is set to 0.
  *
- * Returns:
- * True if runtime pm is available, false otherwise.
+ * Return: True if runtime pm is available, false otherwise.
  */
 bool igt_setup_runtime_pm(int device)
 {
@@ -658,7 +657,7 @@ bool igt_setup_runtime_pm(int device)
 /**
  * igt_disable_runtime_pm:
  *
- * Disable the runtime pm for i915 device.
+ * Disables the runtime pm for i915 device.
  * igt_disable_runtime_pm assumes that igt_setup_runtime_pm has already
  * called to save runtime autosuspend and control attributes.
  */
@@ -683,11 +682,6 @@ void igt_disable_runtime_pm(void)
 	close(fd);
 }
 
-/**
- * igt_get_runtime_pm_status:
- *
- * Returns: The current runtime PM status.
- */
 static enum igt_runtime_pm_status __igt_get_runtime_pm_status(int fd)
 {
 	ssize_t n_read;
@@ -711,6 +705,11 @@ static enum igt_runtime_pm_status __igt_get_runtime_pm_status(int fd)
 	return IGT_RUNTIME_PM_STATUS_UNKNOWN;
 }
 
+/**
+ * igt_get_runtime_pm_status:
+ *
+ * Return: The current runtime PM status.
+ */
 enum igt_runtime_pm_status igt_get_runtime_pm_status(void)
 {
 	enum igt_runtime_pm_status status;
@@ -728,12 +727,6 @@ enum igt_runtime_pm_status igt_get_runtime_pm_status(void)
 	return status;
 }
 
-/**
- * _pm_status_name
- * @status: runtime PM status to stringify
- *
- * Returns: The current runtime PM status as a string
- */
 static const char *_pm_status_name(enum igt_runtime_pm_status status)
 {
 	switch (status) {
@@ -757,9 +750,8 @@ static const char *_pm_status_name(enum igt_runtime_pm_status status)
  * Waits until for the driver to switch to into the desired runtime PM status,
  * with a 10 second timeout.
  *
- * Returns:
- * True if the desired runtime PM status was attained, false if the operation
- * timed out.
+ * Return: True if the desired runtime PM status was attained, false if the
+ *         operation timed out.
  */
 bool igt_wait_for_pm_status(enum igt_runtime_pm_status status)
 {
@@ -791,15 +783,14 @@ static const char *yesno(bool x)
 }
 
 /**
- * dmc_loaded:
- * @debugfs: fd to the debugfs dir.
+ * igt_pm_dmc_loaded:
+ * @debugfs: FD to the debugfs directory
  *
  * Check whether DMC FW is loaded or not. DMC FW is require for few Display C
  * states like DC5 and DC6. FW does the Context Save and Restore during Display
  * C States entry and exit.
  *
- * Returns:
- * True if DMC FW is loaded otherwise false.
+ * Return: True if DMC FW is loaded otherwise false.
  */
 bool igt_pm_dmc_loaded(int debugfs)
 {
@@ -821,11 +812,11 @@ bool igt_pm_dmc_loaded(int debugfs)
 
 /**
  * igt_pm_pc8_plus_residencies_enabled:
- * @msr_fd: fd to /dev/cpu/0/msr
+ * @msr_fd: FD to /dev/cpu/0/msr
+ *
  * Check whether BIOS has disabled the PC8 package deeper state.
  *
- * Returns:
- * True if PC8+ package deeper state enabled on machine otherwise false.
+ * Return: True if PC8+ package deeper state enabled on machine otherwise false.
  */
 bool igt_pm_pc8_plus_residencies_enabled(int msr_fd)
 {
@@ -847,10 +838,10 @@ bool igt_pm_pc8_plus_residencies_enabled(int msr_fd)
  * i915_output_is_lpsp_capable:
  * @drm_fd: fd to drm device
  * @output: igt output for which lpsp capability need to be evaluated
- * Check lpsp capability for a given output.
  *
- * Returns:
- * True if given output is lpsp capable otherwise false.
+ * Checks LPSP capability for a given output.
+ *
+ * Return: True if given output is LPSP  capable otherwise false.
  */
 bool i915_output_is_lpsp_capable(int drm_fd, igt_output_t *output)
 {
@@ -887,14 +878,13 @@ static int igt_pm_open_pci_firmware_node(struct pci_device *pci_dev)
 
 /**
  * igt_pm_get_pcie_acpihp_slot:
- * @pci_dev: pci bridge device.
- * Get pci bridge acpi hotplug slot number, if bridge's ACPI firmware_node
+ * @pci_dev: PCI bridge device struct
+ *
+ * Gets PCI bridge acpi hotplug slot number, if bridge's ACPI firmware_node
  * handle supports _SUN method.
  *
- * Returns:
- * PCIe bridge Slot number.
- * Returns -ENOENT number in case firmware_node/sun is not supported by the
- * bridge.
+ * Return: PCIe bridge Slot number or -ENOENT number in case firmware_node/sun
+ *         is not supported by the bridge.
  */
 int igt_pm_get_pcie_acpihp_slot(struct pci_device *pci_dev)
 {
@@ -928,11 +918,11 @@ int igt_pm_get_pcie_acpihp_slot(struct pci_device *pci_dev)
 
 /**
  * igt_pm_acpi_d3cold_supported:
- * @pci_dev: root port pci_dev.
- * Check ACPI D3Cold support.
+ * @pci_dev: Root port PCI device struct
+ *
+ * Checks ACPI D3Cold support.
  *
- * Returns:
- * True if ACPI D3Cold supported otherwise false.
+ * Return: True if ACPI D3Cold supported otherwise false.
  */
 bool igt_pm_acpi_d3cold_supported(struct pci_device *pci_dev)
 {
@@ -958,11 +948,11 @@ bool igt_pm_acpi_d3cold_supported(struct pci_device *pci_dev)
 
 /**
  * igt_pm_get_acpi_real_d_state:
- * @pci_dev: root port pci_dev.
- * Get ACPI D state for a given root port.
+ * @pci_dev: Root port PCI device struct
  *
- * Returns:
- * igt_acpi_d_state state.
+ * Gets ACPI D state for a given root port.
+ *
+ * Return: igt_acpi_d_state state.
  */
 enum igt_acpi_d_state
 igt_pm_get_acpi_real_d_state(struct pci_device *pci_dev)
@@ -1155,12 +1145,9 @@ igt_pm_setup_pci_card_power_attrs(struct pci_device *pci_dev, bool save_attrs, i
 
 /**
  * igt_pm_get_autosuspend_delay:
- * @pci_dev: pci_dev.
- *
- * Get pci_dev autosuspend delay value from pci sysfs.
+ * @pci_dev: PCI device struct
  *
- * Returns:
- * autosuspend_delay_ms.
+ * Return: The autosuspend delay time in milliseconds.
  */
 int igt_pm_get_autosuspend_delay(struct pci_device *pci_dev)
 {
@@ -1177,10 +1164,10 @@ int igt_pm_get_autosuspend_delay(struct pci_device *pci_dev)
 
 /**
  * igt_pm_set_autosuspend_delay:
- * @pci_dev: pci_dev.
- * @delay_ms: autosuspend delay in ms.
+ * @pci_dev: PCI device struct
+ * @delay_ms: Autosuspend delay in milliseconds.
  *
- * Set pci_dev autosuspend delay value through pci sysfs.
+ * Sets the autosuspend delay value for the PCI device through.
  */
 void igt_pm_set_autosuspend_delay(struct pci_device *pci_dev, int delay_ms)
 {
@@ -1201,26 +1188,28 @@ void igt_pm_set_autosuspend_delay(struct pci_device *pci_dev, int delay_ms)
 
 /**
  * igt_pm_enable_pci_card_runtime_pm:
- * @root: root port pci_dev.
- * @i915: i915 pci_dev.
- * Enable runtime PM for all PCI endpoints devices for a given root port by
+ * @root: Root port PCI device struct
+ * @gfx: PCI device struct of graphics device
+ *
+ * Enables runtime PM for all PCI endpoints devices for a given root port by
  * setting power/control attr to "auto" and setting autosuspend_delay_ms
  * to zero.
  */
 void igt_pm_enable_pci_card_runtime_pm(struct pci_device *root,
-				       struct pci_device *i915)
+				       struct pci_device *gfx)
 {
 	int delay = -1;
 
-	if (i915)
-		delay = igt_pm_get_autosuspend_delay(i915);
+	if (gfx)
+		delay = igt_pm_get_autosuspend_delay(gfx);
 
 	igt_pm_setup_pci_card_power_attrs(root, false, delay);
 }
 
 /**
  * igt_pm_setup_pci_card_runtime_pm:
- * @pci_dev: root port pci_dev.
+ * @pci_dev: Root port PCI device struct
+ *
  * Setup runtime PM for all PCI endpoints devices for a given root port by
  * enabling runtime suspend and setting autosuspend_delay_ms to zero.
  * It also saves and restore power control attribute for all PCI endpoints
@@ -1234,11 +1223,10 @@ void igt_pm_setup_pci_card_runtime_pm(struct pci_device *pci_dev)
 
 /**
  * igt_pm_get_d3cold_allowed:
- * @pci_slot_name: slot name of the pci device
- * @value: value to be read into
+ * @pci_slot_name: Slot name of the PCI device
+ * @value: Value to be read into
  *
- * Reads the value of d3cold_allowed attribute
- * of the pci device
+ * Reads the value of d3cold_allowed attribute of the PCI device.
  */
 void igt_pm_get_d3cold_allowed(const char *pci_slot_name, uint32_t *value)
 {
@@ -1258,10 +1246,10 @@ void igt_pm_get_d3cold_allowed(const char *pci_slot_name, uint32_t *value)
 
 /**
  * igt_pm_set_d3cold_allowed:
- * @pci_slot_name: slot name of pci device
- * @value: value to be written
+ * @pci_slot_name: Slot name of PCI device
+ * @value: Value to be written
  *
- * writes the value to d3cold_allowed attribute of pci device
+ * Writes the value to d3cold_allowed attribute of PCI device.
  */
 void igt_pm_set_d3cold_allowed(const char *pci_slot_name, uint32_t value)
 {
@@ -1294,7 +1282,8 @@ igt_pm_restore_power_attr(struct pci_device *pci_dev, const char *attr, char *va
 
 /**
  * igt_pm_restore_pci_card_runtime_pm:
- * Restore control and autosuspend_delay_ms power attribute for all
+ *
+ * Restores control and autosuspend_delay_ms power attribute for all
  * PCI endpoints devices under gfx root port, which were saved earlier
  * by igt_pm_setup_pci_card_runtime_pm().
  */
@@ -1342,8 +1331,9 @@ static void igt_pm_print_pci_dev_runtime_status(struct pci_device *pci_dev)
 
 /**
  * igt_pm_print_pci_card_runtime_status:
- * @pci_dev: root port pci_dev.
- * Print runtime suspend status for all PCI endpoints devices for a given
+ * @pci_dev: Root port PCI device struct
+ *
+ * Prints runtime suspend status for all PCI endpoints devices for a given
  * root port.
  */
 void igt_pm_print_pci_card_runtime_status(void)
@@ -1361,8 +1351,9 @@ void igt_pm_print_pci_card_runtime_status(void)
 /**
  * i915_is_slpc_enabled_gt:
  * @drm_fd: DRM file descriptor
- * @gt: GT id
- * Check if SLPC is enabled on a GT
+ * @gt: GT ID
+ *
+ * Return: True if SLPC is enabled on a given @gt.
  */
 bool i915_is_slpc_enabled_gt(int drm_fd, int gt)
 {
@@ -1387,13 +1378,20 @@ bool i915_is_slpc_enabled_gt(int drm_fd, int gt)
 /**
  * i915_is_slpc_enabled:
  * @drm_fd: DRM file descriptor
- * Check if SLPC is enabled for the device
+ *
+ * Return: True if SLPC is enabled on the device.
  */
 bool i915_is_slpc_enabled(int drm_fd)
 {
 	return i915_is_slpc_enabled_gt(drm_fd, 0);
 }
 
+/**
+ * igt_pm_get_runtime_suspended_time:
+ * @pci_dev: PCI device struct
+ *
+ * Return: The total time that the device has been suspended.
+ */
 int igt_pm_get_runtime_suspended_time(struct pci_device *pci_dev)
 {
 	char time_str[64];
@@ -1439,9 +1437,9 @@ uint64_t igt_pm_get_runtime_active_time(struct pci_device *pci_dev)
 
 /**
  * igt_pm_get_runtime_usage:
- * @pci_dev: pci device
+ * @pci_dev: PCI device struct
  *
- * Reports the runtime PM usage count of a device.
+ * Return: The runtime PM usage count of a device.
  */
 int igt_pm_get_runtime_usage(struct pci_device *pci_dev)
 {
@@ -1456,12 +1454,12 @@ int igt_pm_get_runtime_usage(struct pci_device *pci_dev)
 }
 
 /**
- * igt_pm_ignore_slpc_efficient_freq
+ * igt_pm_ignore_slpc_efficient_freq:
  * @i915: open i915 drm file descriptor
  * @gtfd: open gt sysfs fd
  * @val: value to set
  *
- * Ignores/un-ignores SLPC efficient frequency
+ * Ignores/un-ignores SLPC efficient frequency.
  */
 void igt_pm_ignore_slpc_efficient_freq(int i915, int gtfd, bool val)
 {
-- 
2.44.0

