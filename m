Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1990FC25B74
	for <igt-dev@archiver.kernel.org>; Thu, 16 May 2024 19:33:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8853710EDB3;
	Thu, 16 May 2024 19:33:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZK8Yy9lC";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B311F10EDB3
 for <igt-dev@lists.freedesktop.org>; Thu, 16 May 2024 19:33:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715888028; x=1747424028;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=KvhAuLhwPLKGAgcID4dCG8n4iERPhtHJCS44t5NPOoY=;
 b=ZK8Yy9lCIiirWV391d15qp2B+Yp5abXwBlZnmLcQkZAe1TWQfpTkZT/R
 vSJKUF+9A/2TuK4zRwhbr0c2ly15YlTs7uMzC/gFpgXubNQNcTTrHgjeX
 UR85POXCWJf8o9Q5NmjojtOAR95jBhW98Nhgto2BUxTwZGAUzqHzj4t2P
 0S7ALqFM0jnS3IpNPmA7Wf0dxBs1hBXG64wxMyN8S+p+Hyz1c3zmJx9fg
 aeokQqO7MuquJ6w9GdZ4zJy8an/JBxV5fZjPDngj9MJnrsrOKzKbg8ic0
 wGFO8cS73IfJAypHarSWlMWYKXB/5N1k4GMCpvaz4BUD7yX6pVNKqxlMI A==;
X-CSE-ConnectionGUID: XYXGdTIMSLiNrtOTqf/6pg==
X-CSE-MsgGUID: J8MyB9I4RVSJ6RHlySAF5g==
X-IronPort-AV: E=McAfee;i="6600,9927,11074"; a="12244566"
X-IronPort-AV: E=Sophos;i="6.08,165,1712646000"; d="scan'208";a="12244566"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 May 2024 12:33:47 -0700
X-CSE-ConnectionGUID: KJ/CDQUvSSaLXmNsiqZVYw==
X-CSE-MsgGUID: VY0hNrDoRBCL6OYBt1dfBQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,165,1712646000"; d="scan'208";a="36321211"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa005.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 16 May 2024 12:33:47 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 16 May 2024 12:33:46 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 16 May 2024 12:33:46 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.41) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 16 May 2024 12:33:46 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=d/zX0sYBPlX1hk6ca7pndIJ01/vPjWgUWat9FqmhHJ7HtNQrKcpb9Iq/43d2OALNnvuMVtGSgnC2JNrqm965EtUOIO1NrAXVMXQjBiyuvpFY0bPqEIsoRsWYLKcTP8NkR7Yu45VKtuPJL7VFrZwj34XuVq0LRqszVqi01zPJMeS2J7eBDZukFOlWASan4bcMe6au4Yw/oi38GmSJijFq5hB7fhHQvVAzYRjcuuLJG8YV/69gKG6jf/1dgzSynp/oDPj15erxoBjpwpffpaqh9WU26sy56ojDgY7wGkNGf0YMWOIZMqRl0bT+gW4ZMncHSkxG2a4J8YIiCzUQ5zHjDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mqkYMHc278jRH3Xi0qHJoEgP8Hq4W8uFkMff6aLcGuU=;
 b=JVy95K0I8b0ew6EFcGfkPmz6enWPqegmRdNECQ3yfoCRc9XjnqtQmHWYC4CpxEUy6fM7cEM0NQzsPjCZxmbmVfiIdi1Hkw5gqyYGO7/5GeayZA6DgVmc+j/7Qm+/RZA3eMQZZm0Sga+LW9kOWCRSijWxbcCckZxcmtnpFjaY9UQkwMt9mmibgCjDdi7w4eNkETyeHSDkoLecJfm/uWO3BW9xhOlQr7UmfH+wK7XDSwTla6p7SYHFfD6os7RS/U1Eez4Wbjz/KZQqRTelhNUsDk/VB2xN2e0LQVxA/nDrx4KHuPg8Uhj0YCwu2sMF5763eBvJ/b3XMB/iFjTQ61DVKQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by MW5PR11MB5932.namprd11.prod.outlook.com (2603:10b6:303:1a2::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.55; Thu, 16 May
 2024 19:33:43 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::cf6f:eb9e:9143:f413]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::cf6f:eb9e:9143:f413%5]) with mapi id 15.20.7587.028; Thu, 16 May 2024
 19:33:42 +0000
Date: Thu, 16 May 2024 15:33:39 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
CC: <janga.rahul.kumar@intel.com>, <igt-dev@lists.freedesktop.org>,
 <ramadevi.gandi@intel.com>, <badal.nilawar@intel.com>
Subject: Re: [PATCH i-g-t] tests/intel/xe_pm: Disable display for mocs-rpm test
Message-ID: <ZkZfk19wfBUFnu6d@intel.com>
References: <20240516104513.2685597-1-janga.rahul.kumar@intel.com>
 <knii2c3mppj6gcz33qfvevgm7fe5x5563m56jg3bb2qsa7praa@gnjlqbfee7wn>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <knii2c3mppj6gcz33qfvevgm7fe5x5563m56jg3bb2qsa7praa@gnjlqbfee7wn>
X-ClientProxiedBy: SJ0PR03CA0341.namprd03.prod.outlook.com
 (2603:10b6:a03:39c::16) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|MW5PR11MB5932:EE_
X-MS-Office365-Filtering-Correlation-Id: dfc2f903-c895-408e-b683-08dc75df1842
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|376005|366007|1800799015;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?lBoivYKOADPm2YWV1DYMF4yiNTMGIRFaNbkzP8x4OagyNGNb05unrU5/q54L?=
 =?us-ascii?Q?qt/rQJ4wCDPKT/NDXR83m4QrWp2SL+qmcq6d6rs3DMneU2NfHOW18PK+BTbs?=
 =?us-ascii?Q?h2/cPSxfCrbuWJoMazl1tH00tXehXqdWZod657uct9Q+NzuYFTlV8P1GNI2E?=
 =?us-ascii?Q?gtb83CQbqZ2I2bvRtJ0YJ2deUqLcFTQefyU9hHOf/0eEnmMyfYge58uXMOYG?=
 =?us-ascii?Q?k8DrEVBqtUbgiFgJvQD8qDdazUTMR3cCnaJaGSfUMJBy11qFSWHkdkv0waGX?=
 =?us-ascii?Q?/pEdm0yMz/cskOLfMGj6oedovIt5zQqtvSgjZMqYBh7aHoxGfNqFmGgOpHJY?=
 =?us-ascii?Q?Pqlo6CQGp69PQ7ji90Qv6e0/8QjPKB85KNdG0NMs4TTs1Hle6uvGlSrTkkEt?=
 =?us-ascii?Q?lgK6MIHEbVTj2mbMFuwc2a0/p0xVjejuWoZMMa5Dk39HtMUCp2++jBge8B3n?=
 =?us-ascii?Q?s78r1Osd/9C4jE0VlZJukdWzXCOLUmBHRnaOYEP+nXguldu/gDdg0OB6YrQy?=
 =?us-ascii?Q?HPWcVTQtW1HZkZEUMReJutcQmY1k8IHkitXXfZzEsv8rhlun1XVQXolfOqaM?=
 =?us-ascii?Q?2bBnsxTBhEydTPMMKMqUAUcG0T1W5v+jbxsaOdOJfkA+EFeKiwKRZDkqtRrN?=
 =?us-ascii?Q?1hUg3p0HigzybPYSH0oLa6A5QBMFrgU+zmaCfemfgce9BHtVHun9NvXzT0kg?=
 =?us-ascii?Q?VyW+Gt6IwTu7Ey9heSD9XGz111vZy45A/qu0W+2IsKGdKEWPN7w/ODKTdrC8?=
 =?us-ascii?Q?VKzQKPiwcsfA9yQWas9m3iHkhuMpKUDtp08eIlzcy8zFoNxE7t3bNgeE9G6N?=
 =?us-ascii?Q?+YQHe3ucYB7Ko9jE0bkQedujih8nzaa/lj8XfR4Vkq3FtQ6WzqamQcMRi/Ug?=
 =?us-ascii?Q?Yt+tqhDVG6uavnJTVpWUXmK0TEhPA/YwLJP5BtuGMDQ7MrwvARU96ZdbB8Dv?=
 =?us-ascii?Q?1dSkeuCigblIyYArgf0HOw34sm0N3hh+KnA5cckjGDLAZzHjEG1PJ6rKPiPQ?=
 =?us-ascii?Q?ssR22M3x1fir4g6onDe0NsIVCGlVS+767GiqbrX3Ya724xlDMiRMwYmRN6T1?=
 =?us-ascii?Q?YtPCk+Ejhbyt7SxAMp/II3RlZuOlFSigiURDFPZfhr2j2HlatVsr0SrJ/aoS?=
 =?us-ascii?Q?CfImB8LFHY2KE8TE5KS6B+5/E0OaNfP4kIYnAy+oE0OWw5kEsb7KNevIs5rB?=
 =?us-ascii?Q?xXc5qA2ztbkUDb/iJb3w6UrTZ1IHh6Bz6nPx+Vg2NJTfvkJ8sWEme9ndxfA?=
 =?us-ascii?Q?=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(366007)(1800799015); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?N7BsnMbZlNTmYhWL8LvBnyQtqM3sfI6VnOUwFU7Z6fknlUVc8NCfrXMSVg+2?=
 =?us-ascii?Q?UXWdS7hYw+4KokASwNGh8xAV/8Q/E0Mg30Iij8vvRIc/uTEO+aZ9ACpURF1c?=
 =?us-ascii?Q?KM5ZxuIT1hRT3IHl3Ukb2/oXCciCNP/yE5rR6u06+BCLMFLFU/ddkZumfkxI?=
 =?us-ascii?Q?gZxGE4JawVDiS70kPYn3imhKjDwIFrAaX2JRIYNkEJqNwPlv15oEECuNcRLq?=
 =?us-ascii?Q?2PAviO33WztefYZHh1Fro2lb3+NGQqhUvoRzvBO27wVhUtNkOzV4BZSzuA2t?=
 =?us-ascii?Q?VKyYn0QvLDjUJ8IDgO9FgFydSBqhL03+Cu+97J5lD868Ne5iVlHnZnCObeNl?=
 =?us-ascii?Q?V9Bhdes1QROXdvOLB4tiG1jLG5Zs70rrSoi4M/XIkJfPacbEzpfdfTg41pAD?=
 =?us-ascii?Q?GIJKqtR9qIf5yCVxUg6So0PkmwLd1AKqnU1zbVseW8NbadEowA1FqD45jmmK?=
 =?us-ascii?Q?U+ozBWD1BU2JFLbZwkKdOloZseSGpcWyIAt+RU5hZ+X83KzA1q1Rpn1EbrrJ?=
 =?us-ascii?Q?lTzLIeqkFE+Mao/ziao2To/+BUdlRV1D8AII+WmColT20Ho0FhwGz1Kaajac?=
 =?us-ascii?Q?WVE6PCnf+saYd9xhN/WAUqW+in7eNNQ5IPIZueISsuwC4GF/yxe2jymoMi1b?=
 =?us-ascii?Q?QMKJ0o/2nShf8g2oqJpMdLhEZq/oVDmiBsW01u3IWkNRVFedJdz5lpUrwh18?=
 =?us-ascii?Q?KpBBOBwL+mtIwSDx6tw99N1uLuefATSRr6WCD5qmGrEbDX7yFTImQVjDxwk8?=
 =?us-ascii?Q?527zgFBDIgR00j/X3akc8Y0dAJQ+fDRwq+D0RXGtvHBjhc2DqabuLmFJUTsD?=
 =?us-ascii?Q?AzDAzHHmiRLFX2QrgLtmMlWG5DILovMoj+gLCNpqlV4GkCKK7cAPl1rXORgl?=
 =?us-ascii?Q?B8GlPnj+teAmrCvyf/92U7fpShtDefdeS/yCLr+NNsKUGDjBdU7KTxn7lgSM?=
 =?us-ascii?Q?P/cbyDmnpJkCVYwxMfUow+HVF6nQuHEfVwk+hWZdLE2Q9msBW+sfaueVmJlz?=
 =?us-ascii?Q?nWCKJvLFSQIYwQvvpx+zZLdqz4dhhFECsz9/n4Vm0JoGkaIwQg2L/bl6kWEt?=
 =?us-ascii?Q?z4DXADUjJmQcbx2p2Rzr/qabt0dr/OlloQW7a8bujPAC/7pjvYYpXjbjNXgA?=
 =?us-ascii?Q?o3sPEYM1fkh4rqTO/+TUI1hnAx/l2fMHToaJ6a9y39u22ot/rIEUiIb5VV+o?=
 =?us-ascii?Q?EUF68UO/6qyOcF9Fws1acPi9HTbBdvPNmiCq8u1GDwT29krFQZpppaF4KQRl?=
 =?us-ascii?Q?Dil089NG7d5wlF35ug4/GpxY7lCJdP1tDtddC80SWYQRltLTSDWhpfydjb4w?=
 =?us-ascii?Q?lPuSnIUbz1vePxDCANfbEeWFtHGRR54gLshVjiZ3VAcWUIghKqD8UMPg13ke?=
 =?us-ascii?Q?vzOMAa3E7qxZD0BIMkU7i+pG56VNGsRCUYiPzwYkrBV8T7Tw1yfcrqUM52UM?=
 =?us-ascii?Q?WCFYuVETXZ8mVSGujQZ0rqE/37X3hKVLPISLTo2vsqYfB7MOcaEwG6A66B1a?=
 =?us-ascii?Q?rEnrdrHQJi0O7n8115lslrqutYomIuxxGgtJ2cEnyvnjebrKGIMaVBbXztKp?=
 =?us-ascii?Q?r47Lv44pu8boR3vVJvutvMeYQPdsOCSTuY+d/XnPZBrZWm/aoEIVtwSQ2aoS?=
 =?us-ascii?Q?Ng=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: dfc2f903-c895-408e-b683-08dc75df1842
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 May 2024 19:33:42.7740 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BqxsWFPFTS4JIDrU+SlN18Svt+whmC3KV01khawE7jqNpZXs+SYcpaeGEAzgeGLerhDeR1oqWf53gEAmmPHAng==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR11MB5932
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

On Thu, May 16, 2024 at 11:21:45AM -0500, Lucas De Marchi wrote:
> On Thu, May 16, 2024 at 04:15:13PM GMT, janga.rahul.kumar@intel.com wrote:
> > From: Janga Rahul Kumar <janga.rahul.kumar@intel.com>
> > 
> > If display is enabled, the always-on components will always keeps
> > runtime pm references, unless you put DPMS_OFF.
> > 
> > Cc: Badal Nilawar <badal.nilawar@intel.com>
> > Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> > Signed-off-by: Janga Rahul Kumar <janga.rahul.kumar@intel.com>
> 
> I think this is
> 
> 	Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/1818

very likely yes

> 
> right?
> 
> Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>
> 
> thanks
> Lucas De Marchi
> 
> > ---
> > tests/intel/xe_pm.c | 5 ++++-
> > 1 file changed, 4 insertions(+), 1 deletion(-)
> > 
> > diff --git a/tests/intel/xe_pm.c b/tests/intel/xe_pm.c
> > index 9cb00c7f1..b4a8c4d15 100644
> > --- a/tests/intel/xe_pm.c
> > +++ b/tests/intel/xe_pm.c
> > @@ -835,8 +835,11 @@ igt_main
> > 			igt_pm_set_autosuspend_delay(device.pci_xe, delay_ms);
> > 		}
> > 
> > -		igt_subtest("mocs-rpm")
> > +		igt_subtest("mocs-rpm") {
> > +			dpms_on_off(device, DRM_MODE_DPMS_OFF);
> > 			test_mocs_suspend_resume(device, NO_SUSPEND);
> > +			dpms_on_off(device, DRM_MODE_DPMS_ON);
> > +		}
> > 	}
> > 
> > 	igt_fixture {
> > -- 
> > 2.25.1
> > 
