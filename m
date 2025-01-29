Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F529C0218D
	for <igt-dev@archiver.kernel.org>; Wed, 29 Jan 2025 18:14:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D7F7C10E85B;
	Wed, 29 Jan 2025 18:14:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=adrinael-net.20230601.gappssmtp.com header.i=@adrinael-net.20230601.gappssmtp.com header.b="MqNy5tf+";
	dkim-atps=neutral
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com
 [209.85.208.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9315110E85B
 for <igt-dev@lists.freedesktop.org>; Wed, 29 Jan 2025 18:14:46 +0000 (UTC)
Received: by mail-lj1-f177.google.com with SMTP id
 38308e7fff4ca-3061f1e534bso72128501fa.1
 for <igt-dev@lists.freedesktop.org>; Wed, 29 Jan 2025 10:14:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=adrinael-net.20230601.gappssmtp.com; s=20230601; t=1738174485; x=1738779285;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=80c/ArnVfofGl7d23S8usl7DroFOJMeJTecQJgCkgOI=;
 b=MqNy5tf+Vgx2gF+Q+rySSw7U409ph1NkG8RR7lNcro/8YQOejv0mG7dH5/tuhIonP/
 EV7UkgmJVf1+MPXFOLKPUnN4pzvwvqrFxUG4Rx/gslR4xVjntHms2pREi8IqpyP0T4m/
 8ZoAaIEnR67Um4VYgq8kz1izy90u3IlAUlkkYfzRm9PFivUp6jPB2h52wPxsxZFCfB1V
 xClwNWkEA72z/dai9whtQUOu29nmXxFjCr6tDQHqZSitFah1eMVFmIn3mz9+pMUmmgNd
 LRwa++DNtdllOV2H54DuHqyovFB3pAtcR7FQRYvSed/GQ8LgqRc5s+GGd/68LEeHn1vH
 ERjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738174485; x=1738779285;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=80c/ArnVfofGl7d23S8usl7DroFOJMeJTecQJgCkgOI=;
 b=XQe8paNPKiW8I60hsWlvGQJE9seS5NP+mUCu5R4dbc+iodEhVgm7qBR3RpwE6DWVp7
 x0CIvXvnjg5pPTjOaNXFp3sadCXz+fjOysl9g92AsUnMntHnG5+pUlPFjWs34oqsJAcr
 PfflW2xIDd8P89DXtdJI678kuy5Dfl2BQoJ6wrTtIUegmAUN+8kxxyvIJJL/Clmaqagg
 XIpAk9Ht9TRl4ZLardzG22phAhXn9f0aBMS0lvgYckyBxJ9bS/R0pJNjyOLZbhluZ8wv
 2O6tFLV/x6pB3/KcIMZvvlKu1PwZ7qMlvWbU8nBLC/UBUkCUZ5amJziO/4YmxYeyWyjo
 v64A==
X-Forwarded-Encrypted: i=1;
 AJvYcCXA92BWNcRxi4zL/YAjY9/2n3uZcqaOPAkJBPCYhq0nfaP0cIn/u+Sy3Zs8Kq0KshOeAJMrcL/z@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yww2vrspwYnKEFHAqj956pYc2JAFTJxlq6/N2yV3TWVzmtZ4fUm
 47L5iK2uXGK2/t5xCdK9tBkBbxWpA/AUpsLxeqNy4KuvAFwCPiI0JRTgD5Qx1a2Sxgvux7CvnOP
 2WKs=
X-Gm-Gg: ASbGncuPjZwyN5CbUumcVw7GsjN2bdlIHI5jk3wbmQXDvJkr5jv1ypRzsxxAPDssbyI
 zUZUhO55KKLJl+ckvHpR7GzDEJiXmyiMht0/9SwSp8h43AKsBmjKBeReNbs4Ae9z0uikjSTfrBd
 9vffbwa1w2Cb5lc2QVedIDMyWefrLwz/jt/8M6M55cgzeJ+IzfhMM67OW9HVlQZA9G8low0TnPP
 Wm8IeYNGLWZLyiNe1NduX8mwq4Z4wivBlDToHEaHJXksXW4LLHLbDHGIWSbmyS5Dy1vhCF1kvsD
 dARMxZDIr0KyqqjcRKrm6+yeWNlVcygaMlaMDgTwB4onI3WxfJCMXA==
X-Google-Smtp-Source: AGHT+IGVn5kDlGHh/vyOgW2pr32CqQ55pJITmiWBl58XTejcJTV+rXsUULo9oyE5k6AfgZRpRcEgfQ==
X-Received: by 2002:a2e:a10c:0:b0:302:336a:89f7 with SMTP id
 38308e7fff4ca-3079686c915mr18981891fa.18.1738174484550; 
 Wed, 29 Jan 2025 10:14:44 -0800 (PST)
Received: from hufflepuff.adrinael.net (87-92-169-37.rev.dnainternet.fi.
 [87.92.169.37]) by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-3076bacac7csm22601091fa.26.2025.01.29.10.14.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Jan 2025 10:14:44 -0800 (PST)
Received: from adrinael by hufflepuff.adrinael.net with local (Exim 4.94.2)
 (envelope-from <adrinael@adrinael.net>)
 id 1tdCaJ-00BI5Z-Pg; Wed, 29 Jan 2025 20:14:43 +0200
Date: Wed, 29 Jan 2025 20:14:43 +0200
From: Petri Latvala <adrinael@adrinael.net>
To: "Knop, Ryszard" <ryszard.knop@intel.com>
Cc: "Sousa, Gustavo" <gustavo.sousa@intel.com>,
 "De Marchi, Lucas" <lucas.demarchi@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>,
 "peter.senna@linux.intel.com" <peter.senna@linux.intel.com>,
 "kamil.konieczny@linux.intel.com" <kamil.konieczny@linux.intel.com>
Subject: Re: [PATCH i-g-t v2 7/7] runner/resultgen: Add cmdline to results.json
Message-ID: <Z5pwE3PU/QYZZdOG@adrinael.net>
References: <20250121225733.808978-1-lucas.demarchi@intel.com>
 <20250121225733.808978-8-lucas.demarchi@intel.com>
 <173755030291.5500.6239544066129101929@intel.com>
 <omwtasmowswuhnn4l65qmvq5zscdjury2ezkmlw4mp7twbu26t@m4sxloefokeu>
 <9f140fe0b463598af0af6cac95c613fa267fe225.camel@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9f140fe0b463598af0af6cac95c613fa267fe225.camel@intel.com>
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

On Fri, Jan 24, 2025 at 02:20:41PM +0000, Knop, Ryszard wrote:
> On Thu, 2025-01-23 at 00:50 -0600, Lucas De Marchi wrote:
> > On Wed, Jan 22, 2025 at 09:51:42AM -0300, Gustavo Sousa wrote:
> > > Quoting Lucas De Marchi (2025-01-21 19:57:33-03:00)
> > > > For easier repro scenarios, add the cmdline to the json: one can see the
> > > > exact command executed to try to reproduce a CI failure without needing
> > > > extra files.
> > > > 
> > > > Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
> > > > ---
> > > > runner/json_tests_data/aborted-after-a-test/reference.json | 1 +
> > > > runner/json_tests_data/aborted-on-boot/reference.json      | 1 +
> > > > runner/json_tests_data/dmesg-escapes/reference.json        | 1 +
> > > > runner/json_tests_data/dmesg-results/reference.json        | 1 +
> > > > .../dmesg-warn-level-one-piglit-style/reference.json       | 1 +
> > > > .../dmesg-warn-level-piglit-style/reference.json           | 1 +
> > > > runner/json_tests_data/dmesg-warn-level/reference.json     | 1 +
> > > > .../reference.json                                         | 1 +
> > > > .../dynamic-subtests-keep-all/reference.json               | 3 ++-
> > > > .../dynamic-subtests-keep-dynamic/reference.json           | 1 +
> > > > .../dynamic-subtests-keep-requested/reference.json         | 3 ++-
> > > > .../dynamic-subtests-keep-subtests/reference.json          | 3 ++-
> > > > runner/json_tests_data/empty-result-files/reference.json   | 1 +
> > > > runner/json_tests_data/graceful-notrun/reference.json      | 1 +
> > > > .../incomplete-before-any-subtests/reference.json          | 1 +
> > > > runner/json_tests_data/normal-run/reference.json           | 1 +
> > > > .../notrun-results-multiple-mode/reference.json            | 1 +
> > > > runner/json_tests_data/notrun-results/reference.json       | 1 +
> > > > runner/json_tests_data/piglit-style-dmesg/reference.json   | 1 +
> > > > .../json_tests_data/unprintable-characters/reference.json  | 1 +
> > > > .../warnings-with-dmesg-warns/reference.json               | 1 +
> > > > runner/json_tests_data/warnings/reference.json             | 1 +
> > > > runner/resultgen.c                                         | 7 ++++++-
> > > > 23 files changed, 31 insertions(+), 4 deletions(-)
> > > > 
> > > > diff --git a/runner/json_tests_data/aborted-after-a-test/reference.json b/runner/json_tests_data/aborted-after-a-test/reference.json
> > > > index 0776f7582..50ba9e6e1 100644
> > > > --- a/runner/json_tests_data/aborted-after-a-test/reference.json
> > > > +++ b/runner/json_tests_data/aborted-after-a-test/reference.json
> > > > @@ -3,6 +3,7 @@
> > > >   "results_version":10,
> > > >   "name":"normal-run",
> > > >   "uname":"Linux hostname 4.18.0-1-amd64 #1 SMP Debian 4.18.6-1 (2018-09-06) x86_64",
> > > > +  "cmdline":[],
> > > >   "time_elapsed":{
> > > >     "__type__":"TimeAttribute",
> > > >     "start":1539953735.1110389,
> > > > diff --git a/runner/json_tests_data/aborted-on-boot/reference.json b/runner/json_tests_data/aborted-on-boot/reference.json
> > > > index 75f194660..238ec6fff 100644
> > > > --- a/runner/json_tests_data/aborted-on-boot/reference.json
> > > > +++ b/runner/json_tests_data/aborted-on-boot/reference.json
> > > > @@ -3,6 +3,7 @@
> > > >   "results_version":10,
> > > >   "name":"normal-run",
> > > >   "uname":"Linux hostname 4.18.0-1-amd64 #1 SMP Debian 4.18.6-1 (2018-09-06) x86_64",
> > > > +  "cmdline":[],
> > > >   "time_elapsed":{
> > > >     "__type__":"TimeAttribute",
> > > >     "start":1539953735.1110389,
> > > > diff --git a/runner/json_tests_data/dmesg-escapes/reference.json b/runner/json_tests_data/dmesg-escapes/reference.json
> > > > index 91c573106..e74dc89e4 100644
> > > > --- a/runner/json_tests_data/dmesg-escapes/reference.json
> > > > +++ b/runner/json_tests_data/dmesg-escapes/reference.json
> > > > @@ -3,6 +3,7 @@
> > > >   "results_version":10,
> > > >   "name":"normal-run",
> > > >   "uname":"Linux hostname 4.18.0-1-amd64 #1 SMP Debian 4.18.6-1 (2018-09-06) x86_64",
> > > > +  "cmdline":[],
> > > >   "time_elapsed":{
> > > >     "__type__":"TimeAttribute",
> > > >     "start":1539953735.1110389,
> > > > diff --git a/runner/json_tests_data/dmesg-results/reference.json b/runner/json_tests_data/dmesg-results/reference.json
> > > > index e9e011853..81890f7d2 100644
> > > > --- a/runner/json_tests_data/dmesg-results/reference.json
> > > > +++ b/runner/json_tests_data/dmesg-results/reference.json
> > > > @@ -3,6 +3,7 @@
> > > >   "results_version":10,
> > > >   "name":"normal-run",
> > > >   "uname":"Linux hostname 4.18.0-1-amd64 #1 SMP Debian 4.18.6-1 (2018-09-06) x86_64",
> > > > +  "cmdline":[],
> > > >   "time_elapsed":{
> > > >     "__type__":"TimeAttribute",
> > > >     "start":1539953735.1110389,
> > > > diff --git a/runner/json_tests_data/dmesg-warn-level-one-piglit-style/reference.json b/runner/json_tests_data/dmesg-warn-level-one-piglit-style/reference.json
> > > > index 8d266cdfa..16c97d3a1 100644
> > > > --- a/runner/json_tests_data/dmesg-warn-level-one-piglit-style/reference.json
> > > > +++ b/runner/json_tests_data/dmesg-warn-level-one-piglit-style/reference.json
> > > > @@ -3,6 +3,7 @@
> > > >   "results_version":10,
> > > 
> > > Hm... Are we going to continue with 10 as the version after including
> > > another field? Are there guidelines on how results_version should be
> > > handled?
> > 
> > good question.... last time it was updated was in 2018, to be compatible
> > with piglit.
> > 
> > commit 2c793666d8c8328733f5769b16ae5858fee97f3f
> > Author: Petri Latvala <petri.latvala@intel.com>
> > Date:   Wed Dec 5 14:53:43 2018 +0200
> > 
> >      runner: Produce json with results_version=10
> >      
> >      New piglit bumped its results_version to 10, making glxinfo and pals
> >      optional in practice, not just by accident. Unfortunately reading
> >      results with newer piglit attempts to convert the results to version
> >      10, reading glxinfo and pals, and thus fails. In a hilarious summary:
> >      A commit to piglit making glxinfo optional makes it mandatory for us.
> >      
> >      v2: json unit tests confirmed to be working...
> >      
> >      Reported-by: Andi Shyti <andi.shyti@intel.com>
> >      Signed-off-by: Petri Latvala <petri.latvala@intel.com>
> >      Cc: Arkadiusz Hiler <arkadiusz.hiler@intel.com>
> >      Cc: Andi Shyti <andi.shyti@intel.com>
> >      Tested-by: Andi Shyti <andi.shyti@intel.com>
> >      Reviewed-by: Arkadiusz Hiler <arkadiusz.hiler@intel.com>
> > 
> > Does this still work with piglit?  something I didn't test yet.
> > Thanks for noticing
> 
> In the past, there were some tools and CI runs that used piglit, but
> they are no longer around for at least 3+ years. Mesa team works with
> those now, we don't have a harness or parsing utilities that work with
> piglit et al. If it's still compatible, it's only by accident,
> considering that deqp-runner et al is under fairly active development.

IGT has for some time been able to produce results files that piglit
cannot read. For one, anything involving test result "ABORT".


-- 
Petri Latvala
