Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B600E10F133
 for <igt-dev@lists.freedesktop.org>; Thu,  5 May 2022 17:52:16 +0000 (UTC)
Date: Thu, 5 May 2022 19:52:10 +0200
From: Andi Shyti <andi.shyti@linux.intel.com>
Message-ID: <YnQOyuwjIURvxBdT@intel.intel>
References: <20220504095904.2145592-1-mauro.chehab@linux.intel.com>
 <20220504095904.2145592-2-mauro.chehab@linux.intel.com>
 <YnPzIYa/TRpBMoqZ@intel.intel>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YnPzIYa/TRpBMoqZ@intel.intel>
Subject: Re: [igt-dev] [PATCH i-g-t v2 1/6] tests/core_hotunplug: properly
 finish processes using audio devices
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Andi Shyti <andi.shyti@linux.intel.com>
Cc: Petri Latvala <petri.latvala@intel.com>, igt-dev@lists.freedesktop.org, Ch Sai Gowtham <sai.gowtham.ch@intel.com>, Andrzej Hajda <andrzej.hajda@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

> > @@ -152,19 +152,14 @@ static void driver_unbind(struct hotunplug *priv, const char *prefix,
> >  	 * safest and easiest way out.
> >  	 */
> >  	if (priv->snd_unload) {
> > -		igt_terminate_process(SIGTERM, "alsactl");
> > -
> > -		/* unbind snd_hda_intel */
> > -		kick_snd_hda_intel();
> > -
> > -		if (igt_kmod_unload("snd_hda_intel", 0)) {
> > +		if (igt_audio_driver_unload(NULL)) {
> 
> why give NULL insteadd of a proper string? We can provide a
> better log.

please ignore, I see that later you changed this part.

Andi
