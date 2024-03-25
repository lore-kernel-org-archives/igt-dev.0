Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8AE6C54E58
	for <igt-dev@archiver.kernel.org>; Mon, 25 Mar 2024 15:57:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E645810E168;
	Mon, 25 Mar 2024 15:57:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="oGc9erTP";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6347910E168
 for <igt-dev@lists.freedesktop.org>; Mon, 25 Mar 2024 15:57:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711382245; x=1742918245;
 h=from:to:subject:date:message-id:in-reply-to:references:
 content-transfer-encoding:mime-version;
 bh=F4ZY0NRsJ7iEEDDCRfkTcuokoSzd9rKO6dxF07U6XCo=;
 b=oGc9erTPiQW9hTm2wczIuW04Mal7jnaV6vUWPQn5Emalja6FuGkLfk9+
 XeCGmvPHtS/dwmUmr3b/0GidZBON0hYCgFfSgWyrAn/8Ndadevyk43519
 Tc4hetilj1C1bP2b84WXIJfykKqPxxQqFZX8X5b+ukCQ1P6PFahxzACii
 84wlsjbfDndonvFsvlmGk6x1iInEYHW37odQvpTYOpqCQo2F4BVDkoU9i
 J9YkCTHE0hxm5Y9eDgE5M83gB0WledmOv+3AXPleVTB5KpS4bZRMIFXHy
 lYQQX46FHnehNEv0wRimJ9dQtLRbTHqMwT9YmgkPuHnYPBXSs5fHe3StJ w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11024"; a="10186683"
X-IronPort-AV: E=Sophos;i="6.07,153,1708416000"; d="scan'208";a="10186683"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2024 08:57:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,153,1708416000"; d="scan'208";a="15637177"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orviesa009.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 25 Mar 2024 08:57:26 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 25 Mar 2024 08:57:24 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 25 Mar 2024 08:57:24 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.168)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 25 Mar 2024 08:57:24 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LextHThX4EmMEhNZKTzJVWVm1nB0WYSNQchkS3PZlAntlq1ytDqyJ4LTnVvlYQYl7k8cXmfQ0c8LzuJslj0N2XsyzmPzdp5cbuI2aNWtBHhT2RbOgcOV0lUNBQjHNY1uRNcEHuwZYg6T6zKhV9QacHhIX5UQwE/7b9esPS8l8ajU/fVsZOCkkvGNxKcu/y7aIaDk22HnAJueMnxWljTiNu4XbPkUzwxZVTEZxh0N6jkFAoM4KYE4fEjrCc1fynVQ02wN9mojqdDlwI8UCTXNd80VV2r5iOiVLDfPjKrNmpLw9K8EOEp5OFwvI2uPM1SI/IQUrOEKavX+mE03dSfd9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IdVk8l9s1eZo+BQ0LNBsPK9JuPKYX3zmrPFsPcY+HOI=;
 b=ankTgfKqaqpVevv/lM7kX9N9+UmGpMa2yRPNSX7s+dTfeqlxpqtiN7JpyU88WhjO04hIBg1Y9sY8cv6kYFe+GsfxV9NDMGP/ML92eUuQcxDY8r9ZOlKXLreD3xqffNP5WHwbHX658oqGOktKBBOc4CLBT2i14P6z4xYJsbiY3bgGV+1hgDAVh9HDQ9j90ReQDiD1oprx8AXuejbYClBkl1WNYS+UkT14eUGY/EtY9duiI9nJQq9iwi228bYrCHNJOkg+A4sT0AKGFnNbOvjEt1mO3ANCG0+iw7aqODcptaneNm7mO8LEc+aoNGUcOJ7LyIIRNJpJvreKbNRVwqYt1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6135.namprd11.prod.outlook.com (2603:10b6:208:3c9::9)
 by SJ0PR11MB6671.namprd11.prod.outlook.com (2603:10b6:a03:44b::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.31; Mon, 25 Mar
 2024 15:57:23 +0000
Received: from MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::6c14:55af:8583:6ba7]) by MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::6c14:55af:8583:6ba7%7]) with mapi id 15.20.7409.028; Mon, 25 Mar 2024
 15:57:23 +0000
From: =?UTF-8?q?Pi=C3=B3rkowski=2C=20Piotr?= <piotr.piorkowski@intel.com>
To: <igt-dev@lists.freedesktop.org>
Subject: [PATCH i-g-t 1/2] lib/intel_mmio: Map the whole BAR0 for gen12+
Date: Mon, 25 Mar 2024 16:57:08 +0100
Message-ID: <20240325155709.3521039-2-piotr.piorkowski@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240325155709.3521039-1-piotr.piorkowski@intel.com>
References: <20240325155709.3521039-1-piotr.piorkowski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MI1P293CA0011.ITAP293.PROD.OUTLOOK.COM
 (2603:10a6:290:2::20) To MN0PR11MB6135.namprd11.prod.outlook.com
 (2603:10b6:208:3c9::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6135:EE_|SJ0PR11MB6671:EE_
X-MS-Office365-Filtering-Correlation-Id: 59850ec1-ded8-4c4f-4504-08dc4ce4425a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: JfXxX7ZYi8d5WW9Bv+tOy2xAyuJ7Slo/xmPC6mNmnlm3lgO77ozC3puchmV6X53V1BmUqhbV0DtpKKnNm4c5z8TBWHWPLKky+ycE/ah9a2+nukRpUZvjLddOYaEa2eg/MbAdj725pBMHfM6IATYoq1nL7fxnse5+jVvt7gElRwe3AesSDUORKCbSllv1AnrwPdMrjW5AB1ONOl99raLJO76FK89ahF9Ql/n7NQ2qprw/MTb7lY90wlGKNuSQNZyn6aJ0hE3/+/CCkmmrvr/P39VcRqbLPZ5wDoqMtAEXNoBhv28U9YukhHY/Q1vhVICOhqnNA/RXujhE4XXQz7IVC8MDdiN9rn0Ue1DRFnxg90X8+YfNrH79G/wiN2t3ypZ2TJtFWEuVbhiU6I7LLLK8FcCL0itw+CE6hcuw05AqASXM53miVg72WNMj7HWIuWu0fXNTFjU7XQlAKM20UTWWBjjCAO4AkdR/qk28BjLRJ1LFDcJzwc6+ibC508RwE1wGZCy+XnkLcGLAO6kmG8bn0Qt+4GUPHx06DUwWuUWodMtsNd9MomO07UjzgPUjyP9JM2T/hJRjfxY+EUWwHJ9xaQiw2vEAoBEbUdcsmwSzd2OK7It6gnDM0gxSbRK+2p+G6ODtJ93Jfh5IleokzoWmFmj2PX5KTLD8us2MfZU7/rI=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6135.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(366007)(376005); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cEV3OXNrZFNMWEF6VlZCYlVSbDZBQ1FZSXpidkZZckV5V2taUzZaR2c2VVN0?=
 =?utf-8?B?aENvbHp3czhDdHZ3MTd0SzhDMDFnTWlreUIrbWFIZ0pNOW1hek00cnZqRE9z?=
 =?utf-8?B?bnZybS8yWTR0OEsyY0VRcURNMnhmWTdFZit2NG53TS9yNzJHaVpqQSt3RXVI?=
 =?utf-8?B?RlRnbjdnRWRlb29IUzltNzVRNjZxa3k1M1RyUDVpZVM5QjJSenBoZUZOWDhU?=
 =?utf-8?B?MTVwQ05mNTdVSjhIUU1XN1NCckxyY1hUMUhOVkZqSmh6ZlJSeHduUXBmdTF6?=
 =?utf-8?B?RzczZGV1aXl6YXZka1BBQXhTSCtXeU15YUlDL2VqaVhPNjY3VEpBU0VSajRX?=
 =?utf-8?B?SEl6dzFEeGdkb01hUGtRRE1TKy82NUV1eXNZQzl0WjQyaVNMSUdTZDdsVzRU?=
 =?utf-8?B?VWNxK2lXUzkra0QwZ0EwNkxta1BTSlBnUjVJYm5nL1JRWXQ1TzNaZ0FnNjNy?=
 =?utf-8?B?eGt6ZlVOVlB6WlVnckc1cjd1T2VSdWJFR21lcTh0V29KYTQycTR4QUlkNlUv?=
 =?utf-8?B?TmxOUlAzWVVTMFpibGhNUW8vaEtnYnRhTEcwbml0Um1YWkNkWlRzTzArai8v?=
 =?utf-8?B?bjNUTjNmN2JVeTBGZVAvcTVzZmVDN25QZGNEaDVMY01sbEdCRjdNa0JDbXN0?=
 =?utf-8?B?ck1wdDhNdlpsTGxnc0x3dU95MFFDY3BZK0JENG95MHFyVHpGWHBFbkNMQjlX?=
 =?utf-8?B?K1pKbWpmaWdROURYTU5wZVZET0x2bHNLRVlHeVJML1RkZXR6UU5JNkhPZjRx?=
 =?utf-8?B?d1pKbitiMit0RWZmYVB1TEQ0ZmZqaHdrQXgva3h2RnZoUjN5TEZLWlVZZGJo?=
 =?utf-8?B?aGl4SnpNd3hnUlhySVAzdDI0cjdEZU80SGptMnRiU2lrTW9oVGdpV0JxaW5P?=
 =?utf-8?B?b3hGUi9CVXVKVk5jR3Bsc1dhK3ppQlFtSzBlS0t5Qi9nRFRPY1BSK1d0OGo0?=
 =?utf-8?B?YXpIT2RRcjZONVN3Rnh5RHhabzBnZnp3M0tHWEFsNm92bVpUeDlkNUE2ais3?=
 =?utf-8?B?YzBlb2pRSG5QZ1NuNWVEVWZOZjZPektjKzNaUXd1NENGcmQzdDc3Z2JjRytm?=
 =?utf-8?B?K0szUGZPSTNRZXBxTnFjY3Q4TUJXRDlTYld3K25sSEIyazZ4Q1U2TEF6Z0Na?=
 =?utf-8?B?UkFRWjNybUs2elM5dUE1SzhRT1dMU3BrR3puY0wraDlRVjZqaFpPRmdQbG1i?=
 =?utf-8?B?N1VXU3d3S20ybVFaTEE5MlUxTVRtMUJueVFZTE0rUkhsR2szOUZjQU9TVzAz?=
 =?utf-8?B?N05ML210OGNCMWhEZ09wZFlMeFd6WXhqQlkzNTNYTDhvbmJiYVFrNWJGYktO?=
 =?utf-8?B?eHJWbmhMVzBpNDF0UkIwSXpGY0RCK3Uvb3ZmN3dnWXkyYW9oajdBVWFHR2JC?=
 =?utf-8?B?V2c1K0luLzRsNlFET2oyNHgwWjdSMW1mMEg1dlpyWUpUSlZkcXJHTXF1NEZQ?=
 =?utf-8?B?aUpXQmc4TGZaaVp5dE02aHArWmtUQmxmLzQ1aVFkUnhzUGZzMjhBYjhzRUEr?=
 =?utf-8?B?UjR5VDk4L2N6QUZqdDc0R1h6K2c5Zkd3ZUpsOEc5cFVQNlZYdHJCekxRcFYr?=
 =?utf-8?B?VWx5enZBSk11TnQxVW5aNDBpVnAyNjZMUXgvYUdRQ3l0d1BmWFBpclRNS1pO?=
 =?utf-8?B?eUJicU9CZGwwWUFZQmxwUUtHMElFRGd0TzBEZERLUlA1SjZBeGl4QlZlRlJ4?=
 =?utf-8?B?S2h2Q2xmcTQ3UXcvZDVkbS9ZeTJIZW1RVy9mZ3gxdTVlWXhBSk4wVTRhZFpq?=
 =?utf-8?B?V1lMNzNaeVpGQVlUOXJLbnYwYnJuMDdJWUMxeVpxTGVkYWhXOEVPQTllUlU5?=
 =?utf-8?B?UERCUi8zY05ZamxQOE11MnBaYXZ1V3djZHBFRmlaMHZtdUJyNnV1MVl2Z3Y2?=
 =?utf-8?B?eFUyQjJZeFZ6ZDFpZmo0eDdMY1Y4bk4vZ3B2T09UZlE4S1ZEeTR4cmEyVjc5?=
 =?utf-8?B?cUpiMmt0dmhMcURHYmFRVndobm15YzlyN1F0Vk43NWJmMmdPUXFTNUZucFB4?=
 =?utf-8?B?TUdNMVBpek1uckEwa3R1NC9zdXhGNHVYYWJoV1I5WGRIcWJ3ZVpaOWRNTytH?=
 =?utf-8?B?SDd6N09CZTNDWVVXT1lQWE9RMmc4ODk4aDh4cDdtL2pnRTg2YWZ6VXlhYi9x?=
 =?utf-8?B?UU1ZSUlkbDFCUEl1T2o5QnlSMmhhQkpFNEExMjc3TEtWc1NmRi9YU29ZbWs3?=
 =?utf-8?B?OEE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 59850ec1-ded8-4c4f-4504-08dc4ce4425a
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6135.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Mar 2024 15:57:23.0319 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kS+j66uIcWpl1H3M8XkylZUOk2HQA4F4ML0KP+tG45qFp7d5YSQEAXDsm8UmI06rJc5yZb8F8tlxTuwtIqU1OKnp0OvxuqHVvoMbWL2hX0E=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB6671
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

From: Piotr Piórkowski <piotr.piorkowski@intel.com>

Previously, we limited BAR0 mapping to register space only because of
the potential conflict with wc mapping for the GTT region.
For gen12+ platforms, the size of BAR0 varies due to the different amount
of tile.
And as for gen11+ platforms, we can already map the whole BAR0 as uc,
so let's map the whole BAR0, without artificial limitations.

Signed-off-by: Piotr Piórkowski <piotr.piorkowski@intel.com>
---
 lib/intel_mmio.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/lib/intel_mmio.c b/lib/intel_mmio.c
index 4b6820787..31975727e 100644
--- a/lib/intel_mmio.c
+++ b/lib/intel_mmio.c
@@ -154,7 +154,7 @@ intel_mmio_use_pci_bar(struct intel_mmio_data *mmio_data, struct pci_device *pci
 
 	gen = intel_gen(devid);
 	if (gen >= 12)
-		mmio_size = 8 * 1024 * 1024;
+		mmio_size = pci_dev->regions[mmio_bar].size;
 	else if (gen >= 5)
 		mmio_size = 2 * 1024 * 1024;
 	else
-- 
2.34.1

