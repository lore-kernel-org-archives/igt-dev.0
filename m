Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FD2BC4828D
	for <igt-dev@archiver.kernel.org>; Thu,  1 Feb 2024 23:15:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C37A10E641;
	Thu,  1 Feb 2024 23:15:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OUrMp2b5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 353E510E641
 for <igt-dev@lists.freedesktop.org>; Thu,  1 Feb 2024 23:15:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706829309; x=1738365309;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=4rkyP09SJr6rXEVSTUodNX/f+6kg/7sEN8n60C3IRYY=;
 b=OUrMp2b5keYiFON+ucl4w183vQajHxYaj/KPJvIZAxlf/NscnhpyL6bD
 jsdh3YunNkinW9z/kV6waVl7OGqu82KNjywcB8gUV1xYotjUyzlQ6pwp1
 7Z/46z7ov/Zu6cObriKJS+KDGnOuQ9qp1SmPFSLZsIUPEcSYnFFFYQUP6
 852hEg3taTbla4Gva3AqekyU4X97Pk1LgrDD9sNK3u5YcOcTPX4L8Pwgj
 FO3t+J8gZLRYK/dsGBu1Syd9ZZH66T5H/F2vljMPEPSHNuYJ9kYbtUFXi
 w/rLEUtX10Uhlri321t838cifK6IO2qO3r5oDOOCPkkUSZz+ME9ag59PP g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10971"; a="228971"
X-IronPort-AV: E=Sophos;i="6.05,236,1701158400"; 
   d="scan'208";a="228971"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Feb 2024 15:15:08 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,236,1701158400"; d="scan'208";a="30738714"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orviesa002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 01 Feb 2024 15:15:08 -0800
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 1 Feb 2024 15:15:07 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 1 Feb 2024 15:15:07 -0800
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.169)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 1 Feb 2024 15:15:07 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=E+vPDre4KURZIAdL4d2lrV+WZ8bQMwigf9LdvsAvpy9v8S/m2AADEAY9VljeqLps2PSZuBBWBB7Gd9JEyDKaRnmt+GTRcsYsP93hvs0vYfRy2ddYN2Vca7iYc64s/kmWqB9oA/xfupXFDH7D3nswT3aGkl9E8K4qbJCYZDg2c8omY/x3/f+PFers6hS1qECK9sdXH29bpAf5p+K9LEniLUVw3ViAjQjACrvAPMlYCuUy70zgLM3jTnP7YoqarW6Thyp1ztTkjLIgr47IjqZ6jgMMIqTjzTf3/+djjaDynqDIGAKKmSgg97x/894EEe/so1YIdIAAvYw/TA8VWgbsgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gP8eJ+bvgi9Snym73TY4fMNdltud8kcvvIuj/302mqE=;
 b=H187wqZ421WsRA0/qg12qCm5YUHaSEyvjab8T2mNK+1uoyoRei1GvjdXVJevLRhjLe9hEtyhkViV06Kly6GdMfX7kLY/Zedx3JHMpyqb/GmMd1vvf7ZcWE17CNKSDIygZ3epFj6QlIuyvwDnR1ROkKxDSB2ElUph4+nS8C2T5xeoZi5ZDGwoQ3FQLigNFrZzq0k2uKWXYdcj5Rc1jjnmIZx4HgDIZWkc3JQ7p96INKi4QMaKSsR8m3keLBqIYDqqMXpWfG3sSLWwVXGx44+Gm2H2T3jqNLvy7UYqsypsNAarr56gGPKHxSTiHfCpN3ovrbcoCmx/jKqMGsPzJ/yOIA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by PH0PR11MB7616.namprd11.prod.outlook.com (2603:10b6:510:26d::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7228.35; Thu, 1 Feb
 2024 23:15:00 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::9f32:ce50:1914:e954]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::9f32:ce50:1914:e954%7]) with mapi id 15.20.7249.025; Thu, 1 Feb 2024
 23:15:00 +0000
Date: Thu, 1 Feb 2024 17:14:58 -0600
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
CC: <igt-dev@lists.freedesktop.org>
Subject: Re: [RFC] lib/igt_kmod: remove devcoredump before a PCI module unload
Message-ID: <eeldbmdvytrzcgvzxr7sf7ja5hdtspcnkxwveoniykwppixqpv@2ksbzzudvnis>
References: <20240130223702.50769-1-rodrigo.vivi@intel.com>
Content-Type: text/plain; charset="iso-8859-1"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240130223702.50769-1-rodrigo.vivi@intel.com>
X-ClientProxiedBy: SJ0PR03CA0021.namprd03.prod.outlook.com
 (2603:10b6:a03:33a::26) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|PH0PR11MB7616:EE_
X-MS-Office365-Filtering-Correlation-Id: 0b335123-c37b-4f7e-b882-08dc237b9cc8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: QiHQrZJa+kXTNdm2LrW2Llv3bxyeVxujFxQcrRCd1lEwDyIc6mp5otnw6OJmtwLhQ/rJmBejxe6AYx0O+NeJ0kzUYCSiSgkpPQZLiZ4rktsgYPyXu4ASBgEExCEFk3f4qZTGpIir9ci2nN1F4FUWnA3EqqYXvvRAciFnvJZoxy7c66ONoS4MeqBL5mUhjsFCNT3QSnWnXgxW/G8ZSTEIOIgH7/OVEg6d3v4k3l9XCjqMjHnwH5c2BrfPJ4zX9N+sgeQG4Velima9F5c8TlM/maQZGLylGvC+cm0OQB7YHB5+N8eXg90W6YrGb+0/zrIQmnjEPCTsgnmb9DszlXymljxq+h+i3FQF7ykHLZ2JpQ+1rJlK5nWInLOYfQZIFOWYXMaDM9earPv9JdvQDvygVpTBqIc2lHBXZ0ZGM7keVjKRXf9SuDPvQmtULee8FCwVb44ApnwIIsmwka815np/f3wjH6zYljCMI/sn1qpEuT1kXqmSXYDMmP77b8KproJm9zEU/OAyQ147m6Ig37nwgOHWKEDzU5vlHVerHhSg/mu/HdCvVA0UsxxGxfWJVlFW
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7916004)(136003)(39860400002)(396003)(346002)(366004)(376002)(230922051799003)(186009)(64100799003)(451199024)(1800799012)(83380400001)(86362001)(82960400001)(6506007)(41300700001)(26005)(6512007)(33716001)(38100700002)(9686003)(2906002)(478600001)(6636002)(66946007)(316002)(66556008)(6486002)(5660300002)(8676002)(4326008)(8936002)(6862004)(66476007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?ZW87PEPRMoDxAhXaeQJe0Y6WBzy5RV9iuu579e1Pv9OixVVI3oHCYP8LPa?=
 =?iso-8859-1?Q?jzTYpCHsiW+XCV/M+EGpDoUCN5YpCtcEkliHf9aRn8eUnviwGp8suh22Q7?=
 =?iso-8859-1?Q?BkEswkBgz2vxBtYzS5F/W+DVYUXNO03xG43DZRhCO7ktojwNe1PEMcXXj8?=
 =?iso-8859-1?Q?4HTcH1lioBg6IiyJThoulggb5620/6cjBew94ibP+NkDal68j/cpFAWUNI?=
 =?iso-8859-1?Q?ma7HtJ1B7PmU/vnkWxtGvhphut9Eqmn+oEV2a3t6dw7YNKc5qKnS2aGUAO?=
 =?iso-8859-1?Q?6qvtlD6YlVM5Gz6i76Dh5kjKmSgIdiCbMEmhvmkioT6hCu46zMCDUXwppr?=
 =?iso-8859-1?Q?tlWZYSSRun3V7RJxyibZm+nC/lKgPU6aAnc4o74nqKGFXMPTiqRKYkpOTJ?=
 =?iso-8859-1?Q?4uJf/g7XX4j2sOGiDyeXA9m616IqqC/21hYcAHMwqlSFDI/iLDIl+eoCbd?=
 =?iso-8859-1?Q?YWsgd25u+HPK9AWVjXdu/2cVA3vQtE1CcvgxnYdWFTh2tZ5FvWoIyNhJyG?=
 =?iso-8859-1?Q?fFikuc65z6OKhkh3EA7Sfaf1tRNrYVWvGpyB9jrFBUFHZthmOGPgC9uHA1?=
 =?iso-8859-1?Q?56vnf0TVW9mvg9BwieaJsYRAdVAKKQwIMA3lwIK46gT+f5vbbyQ1NEdA8p?=
 =?iso-8859-1?Q?PtD/dMyE3vvxU/IAS9u4xY1kK/FDF/7TKj8yECqcJmCuJsJaEpBkjTCGzv?=
 =?iso-8859-1?Q?r3plxIvUMuFjZ66Yrm0hHjUd26GKycl0eWRwq3Ye83u/eFxaIgnB31vQat?=
 =?iso-8859-1?Q?0g3kkTeravXxIJju6PEqT80HPrgPDD0zV29NrLOtZItROcPC6xYUKpLnsp?=
 =?iso-8859-1?Q?qEtUzYifE8Wf3fVOx/rY3YkxGC/Ovhakz2Xs9VsJCUZwDPPC9LCEMIDJXf?=
 =?iso-8859-1?Q?VFlcalg4dl00hSD5+DqsAKqyIDD7C6+vDnN312XJehrFx/j3k4goj7yC2I?=
 =?iso-8859-1?Q?Y6qTeMYT9j31VAm/dOcn2acqYA4QiCP8oRjCIXMp1Stysq3l5B1nFtjisF?=
 =?iso-8859-1?Q?uiFYh28N40U7MCxY42HgFG8sOkcXbZekqaABv0gShedsVtxOvazE+2FEB2?=
 =?iso-8859-1?Q?BPBqmrELB+tg0tKKAZsSAAvYlaWOlYpqwPBVmLqKUC7/96jPoVZ4ZQsirt?=
 =?iso-8859-1?Q?CNbA8IsxRikptqSCLmriWcLp43HOvz9Nw/mibt2otLnyIUhW7jRqqS5+vX?=
 =?iso-8859-1?Q?u/x2/1HiQWqz6mLhBW43tGOUlVZrIjtFxmJiYjSG+w3xY7KXDWk0fG1rqB?=
 =?iso-8859-1?Q?SW3i8DtE3wKoXSvOdsDL3zHh+Qq6N3Khz9dLw0X259QgAWOuyg0Sa7h3GW?=
 =?iso-8859-1?Q?Iv3OOhUsF/E1JQIDGHnJ9VqXUH3cjqHh9sROkSuOPtBhVip7Agavtf659L?=
 =?iso-8859-1?Q?+/EGVqu2zuJmE8JGTc0q56eBD8wPAkoz6ChtPt37/xtz+utQFQfPX7hJoQ?=
 =?iso-8859-1?Q?xyZnIxPdht38ln5Qf0+8OzXGjddxiMKr4mQR0N8N7RIrvr1ENdzRNo73NW?=
 =?iso-8859-1?Q?nSJHVgDeHF7XjOk3gfJtAQ0oHB0vHMdxe275sKi21V7/4GMkgrGA60xR9b?=
 =?iso-8859-1?Q?XQh/IUin9+2g4VC3Z76JTWYXLKAGlYmrwhzk4GF2GWka86dwoRYRNbybhP?=
 =?iso-8859-1?Q?iXaoPYZTVbF2iFY/efvgL84sqbs1WfQJ8rJGlnSgn8997Xi0Pr3nELmA?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0b335123-c37b-4f7e-b882-08dc237b9cc8
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Feb 2024 23:15:00.0222 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Nka6sqVxGawIWlN2LhVci80p1AlQMtiPZ8K9Lc+eyL7m43fwCfLEGr5GbeoQndGP9ytsIomLXoFeaWQ2VRvQIsamK8eRiEgDzuYROxM4Ytg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB7616
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

On Tue, Jan 30, 2024 at 05:37:02PM -0500, Rodrigo Vivi wrote:
>devcoredump holds a module reference, blocking the module removal.
>
>It is intentional from the devcoredump perspective to keep the
>log available even after the unbind/unprobe. However it blocks
>our module removal here.
>
>Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
>Cc: José Roberto de Souza <jose.souza@intel.com>
>Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
>---
> lib/igt_kmod.c | 54 ++++++++++++++++++++++++++++++++++++++++++++++++++
> 1 file changed, 54 insertions(+)
>
>diff --git a/lib/igt_kmod.c b/lib/igt_kmod.c
>index 250ab2107..da44a7bca 100644
>--- a/lib/igt_kmod.c
>+++ b/lib/igt_kmod.c
>@@ -323,6 +323,58 @@ static int igt_kmod_unload_r(struct kmod_module *kmod, unsigned int flags)
> 	return err;
> }
>
>+#define MAX_PATH 256

just use PATH_MAX? it's more than this and should be sufficient for
these sysfs paths

>+
>+static void _igt_remove_devcoredump(const char *driver)
>+{
>+	char sysfspath[MAX_PATH];
>+	DIR *dir;
>+	char devcoredump[MAX_PATH];
>+	FILE *data;
>+	struct dirent *entry;
>+
>+	snprintf(sysfspath, sizeof(sysfspath),
>+		 "/sys/module/%s/drivers/pci:%s/", driver, driver);

"/sys/bus/pci/drivers/%s", driver

I´d also save the return value so you can 1) check if it was truncated,
2) do something like  `char *entry = sysfspath + len`,
so you don't have to keep printing the prefix below.

>+
>+	/* Not a PCI module */
>+	if(access(sysfspath, F_OK) == -1)
>+		return;

coding style

>+
>+	dir = opendir(sysfspath);
>+	igt_assert(dir);
>+
>+	while ((entry = readdir(dir)) != NULL) {
>+		if (entry->d_type == DT_LNK && strcmp(entry->d_name, ".") != 0
>+		    && strcmp(entry->d_name, "..") != 0) {

invert the comparison and do a "continue;" ? It would drop the indent a
little bit.

>+
>+#pragma GCC diagnostic push
>+#pragma GCC diagnostic ignored "-Wformat-truncation"
>+			snprintf(devcoredump, sizeof(devcoredump),
>+				 "%s/%s/devcoredump", sysfspath, entry->d_name);
>+#pragma GCC diagnostic pop

instead of ignoring the truncation, simply check the return? As per
above you could do:

	ret = snprintf(entry, sizeof(sysfspath) - prefixlen,
		       "/%s/devcoredump", entry->d_name);

then check ret <  sizeof(sysfspath) - prefixlen

if you follow this, then you should use sysfspath everywhere below
rather than devcoredump.

>+
>+			igt_info("%s\n", devcoredump);
>+
>+			if (access(devcoredump, F_OK) != -1) {
>+				igt_info("Removing devcoredump before module unload: %s\n",
>+					 devcoredump);
>+
>+				strcat(devcoredump, "/data");

could we just do that above and check if we have a devcoredump/data?


I'd reword the commit message to say "drop" instead of remove. The
reason I came here to review was that you had
"igt_kmod: remove devcoredump ..." and I thought you were talking about a
**module** called devcoredump.


>+				data = fopen(devcoredump, "w");
>+				igt_assert(data);
>+
>+				/*
>+				 * Write anything to devcoredump/data to
>+				 * force its deletion
>+				 */
>+				fprintf(data, "1\n");
>+				fclose(data);
>+			}
>+		}
>+	}
>+	closedir(dir);
>+}
>+
> /**
>  * igt_kmod_unload:
>  * @mod_name: Module name.
>@@ -341,6 +393,8 @@ igt_kmod_unload(const char *mod_name, unsigned int flags)
> 	struct kmod_module *kmod;
> 	int err;
>
>+	_igt_remove_devcoredump(mod_name);

what's the _ for? Also as I said above please s/remove/drop/

However I wonder if we shouldn't **dump** and make it available as
output, just like we save the dmesg.

Lucas De Marchi
