Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21000C02195
	for <igt-dev@archiver.kernel.org>; Wed, 29 Jan 2025 18:09:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CEBE410E12B;
	Wed, 29 Jan 2025 18:09:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=adrinael-net.20230601.gappssmtp.com header.i=@adrinael-net.20230601.gappssmtp.com header.b="1yrn9qLp";
	dkim-atps=neutral
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com
 [209.85.167.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D2DD10E12B
 for <igt-dev@lists.freedesktop.org>; Wed, 29 Jan 2025 18:09:17 +0000 (UTC)
Received: by mail-lf1-f53.google.com with SMTP id
 2adb3069b0e04-54298ec925bso8270736e87.3
 for <igt-dev@lists.freedesktop.org>; Wed, 29 Jan 2025 10:09:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=adrinael-net.20230601.gappssmtp.com; s=20230601; t=1738174155; x=1738778955;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=sd4Xkx2trJ+6QmNfyZawZT2QbT3GXwvVtjBQfwseB6s=;
 b=1yrn9qLpvt8zPMOwu+1BdQ8dlfONQNoQl1x2U9eip6Xc0CA0BkbFiDJ0gM7BTndgsJ
 jdLm5a3W9luW3MTVvzZfc6i7lftc2STNAnJndKRk0DW76m0yMZcvE1ltY5B+OsoBZY4w
 nQbJTm/0Sgwvx7dzbhkKsehCv/tJRL9uHjYSsvHytbSuLQJIh/hRUp+eo2BMYE3H5UjF
 VQY38zRz1QnlrTdAhUgTpGjkf8mojS0Bgusfi0i/TeKofEGQGu+NtiLouCI0YyI4UAG+
 xhylUoDIVlbyPIWyyvG88TuQyi3gGVdMu3HcUonKoOatw3Cv5nKJjL79povfyWIYfwMO
 cqsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738174155; x=1738778955;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=sd4Xkx2trJ+6QmNfyZawZT2QbT3GXwvVtjBQfwseB6s=;
 b=huuXUjH5HOvAbIKhMwI/4iUp+aQgziyQ9hZ+GvA5wdc060u6hYaBAHy8RqmHg9OvWk
 D96FpdB1dhr0MH7qseuKpSNri5NKUEho9koASSoS/fIIf8byC0FLvUzOON8o6pW28CR3
 Amly7x9CqVRyjEv6mvjv64aCPQUdJV1tn8MaZLI/vxGG3d9CPtveTZWLh4VM9l8aKU3Y
 mBrDwUSCHP9kNBxSYKTYfiypY0KI1L/cPM8fJgHTPmpKbE11TZvgRnnoRSCfgx12vJEB
 8cc0g6juVma+E1ZVjn/11AErvp0Kj1RIGSVS08ViRCgzchKEjKDhHDYrPe5zO7UKH1lK
 nfuQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVjFodGX+E4KZsDK7Uq7N5LhYH9EfzOlF8ZUycEXxzdi/R89Vlomqc9szmVsh4hlQyTtITIp3xd@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxgBI2rZ7r9OCleBrVfADx5h/0sAyMwZqUts8Zt10dQZ+IFxCkA
 4X5wcoaWvc0VTnZFXBHF1KugZD7bOYvRagoRc1Oeu5d0eoB2hMNqiHP/psjkdl/fCa7p4ga48kd
 P4qQ=
X-Gm-Gg: ASbGncvhj0Z9JG9kBQIb+aQTbqPGM2huUxgAPWi93lcXBN3KvOSC5sVpIXuQw79wBn4
 gyDL9zsklo/L3XPyU2gngXmC6EYjzJwU4qZoA4xXMwKJct/kAIcNb5LoGf6DOQYncgKLT1NdgRc
 craXuuQskzjf4h2YyXJmzr1sMXW0/Gow9D8x1dzG2VqDc3XrbHu1Z16O7QMsji6TUmlkJ+Rte8x
 K7z1ykEEMigd76/z1SL93oVpXqlz1GM2D70wARVLfQQiepHu7gB6qQMrOlQ5Wogonuni+bJ5ICD
 kZLbYA6kT9JXmdcCT7TkAaebIq6MN09VYHtWqHFtzbbZGXvLeZGk3Q==
X-Google-Smtp-Source: AGHT+IH8sYzYU7ulB4KVpat0AG5vwd+mAZ/Z3sjYRGbYeNAPjIRvXrW1+Gqvu+BpPTEB8WiQ1oMECg==
X-Received: by 2002:a05:6512:1396:b0:542:2e04:e9b8 with SMTP id
 2adb3069b0e04-543e4be007bmr1462778e87.8.1738174155061; 
 Wed, 29 Jan 2025 10:09:15 -0800 (PST)
Received: from hufflepuff.adrinael.net (87-92-169-37.rev.dnainternet.fi.
 [87.92.169.37]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-543c8228a6dsm2023611e87.2.2025.01.29.10.09.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Jan 2025 10:09:14 -0800 (PST)
Received: from adrinael by hufflepuff.adrinael.net with local (Exim 4.94.2)
 (envelope-from <adrinael@adrinael.net>)
 id 1tdCV0-00BHzG-9x; Wed, 29 Jan 2025 20:09:14 +0200
Date: Wed, 29 Jan 2025 20:09:14 +0200
From: Petri Latvala <adrinael@adrinael.net>
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>, igt-dev@lists.freedesktop.org,
 Gustavo Sousa <gustavo.sousa@intel.com>,
 Peter Senna Tschudin <peter.senna@linux.intel.com>,
 Ryszard Knop <ryszard.knop@intel.com>
Subject: Re: [PATCH i-g-t v2 6/7] runner/settings: Serialize command line
Message-ID: <Z5puykM91cje2ki8@adrinael.net>
References: <20250121225733.808978-1-lucas.demarchi@intel.com>
 <20250121225733.808978-7-lucas.demarchi@intel.com>
 <20250128183744.zegxv5uougqwvc4a@kamilkon-desk.igk.intel.com>
 <wfzokcb257qutd6324fku62dkdxkm552xtcftue7m2zaxdryuz@e5sdrclgnjxr>
 <20250129172348.x5osrkk4yocdmdpk@kamilkon-desk.igk.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250129172348.x5osrkk4yocdmdpk@kamilkon-desk.igk.intel.com>
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

On Wed, Jan 29, 2025 at 06:23:48PM +0100, Kamil Konieczny wrote:
> Hi Lucas,
> On 2025-01-28 at 13:34:24 -0600, Lucas De Marchi wrote:
> > On Tue, Jan 28, 2025 at 07:37:44PM +0100, Kamil Konieczny wrote:
> > > Hi Lucas,
> > > On 2025-01-21 at 14:57:32 -0800, Lucas De Marchi wrote:
> > > > Serialize the command line to metadata.txt. The expected format in the
> > > > metadata.txt is like below:
> > > > 
> > > > 	cmdline.argc : 6
> > > > 	cmdline.argv[0] : ./build/runner/igt_runner
> > > > 	cmdline.argv[1] : -o
> > > 
> > > Sorry for late reponse but imho it should be saved for debugging
> > > purpose but not for reading this in metadata.txt, especially that
> > > this option '-o' is 'override existing results folder', so it
> > > should be used only once by igt_runner in setup phase but not for
> > > igt_resume.
> > > 
> > > From igt_runner --help:
> > > -o, --overwrite       If the results-path already exists, delete it
> > 
> > if you are using -o it's just because you don't care about the previous
> > results and want to completely overwrite it.
> > 
> > igt_resume doesn't have any option - it doesn't have a -o and it
> > basically does:
> > 
> > "Load the settings from the state dir back into the settings struct"...
> > igt_resume will read it back and create the settings object.
> > 
> > The results.json as architected in igt_runner discards everything and
> > is basically a conversion format from the state dir to a .json file at
> > the end of the execution.
> > 
> > > 
> > > imho we should save it into some different file and include it into
> > > results.json
> > 
> > not sure I follow... metadata.txt has the details of how we are running
> > igt_runner and it's basically a dump of the settings object. I don't
> > follow what's the relation with the -o option you mentioned above.
> > 
> > End goal is to have the value in the results.json, but I see no reason
> > why the intermediary state needs to be in a different file.
> > 
> > Lucas De Marchi
> 
> Well, what I try to comment on a commit description:
> 
> > Serialize the command line to metadata.txt. [...]
> 
> imho this should be written in setup.txt and setup.txt should be
> included in results.json There is no need for igt_runner options
> in metadata.txt, as it is used by igt_resume in shard re-runs
> after a reboot happens in a middle of testlist.

The command line in metadata.txt does no harm as it's just
informational text to be recorded in the final result. It's also
supposed to indeed be a direct dump of the settings object, and thus
should have the command line if that is to be put into the settings
object. But I suppose the pertinent question is: why does it need to
be put into the settings object? There's already things like uname.txt
and starttime.txt and whatnot, written outside of
metadata.txt. Consolidate miscellaneous info dumps to a single file?
Do that when serializing command line _somewhere_, or perhaps later?

I have no opinions to offer in any direction, just drive-by commenting
here...


-- 
Petri Latvala
