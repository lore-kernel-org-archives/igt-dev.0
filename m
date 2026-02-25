Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63738EFD211
	for <igt-dev@archiver.kernel.org>; Wed, 25 Feb 2026 09:18:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 02C9710E728;
	Wed, 25 Feb 2026 09:18:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TA0zNcZq";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 007D710E728
 for <igt-dev@lists.freedesktop.org>; Wed, 25 Feb 2026 09:18:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772011112; x=1803547112;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=mEtonUEZLXNp0OyaNxz+nTeM9yywNdkuqIm2ITzUP1s=;
 b=TA0zNcZqhDpSIjl0BEZaJYKFYgzUEUDGBdxcOJHicm7NfHC/aHNge0/Q
 aQNwAn+cSJ5y8k4h/5BrAOx+JjXaRJnVu3IGT6yFUrTJ/E4iybeu8lwx5
 JjtqwzROL95XvRNkp96WQTtYJXh1bMelInzO/VnAVAumT1oMqEw7GQHPN
 BKp3obgBGp6a4JTqGjboxr2Uykc0bBF2a99Y8Rhr16i7A0V8g/X5KntGT
 EGZrQLKDmUQFjD6mzDQo/d1RaXnDl5ejRGzNC40rlYR8OnrKSFXNVXAMH
 5BiyRVygNVZxVKEZOcNg2dW/zwRnBPspOYPqJ7pJP6/91WS4KOKk/lS5k w==;
X-CSE-ConnectionGUID: hv6aUZAKQ4eXp2jLke8Byg==
X-CSE-MsgGUID: OxYNngiqRAuKGimAef4QdQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11711"; a="73150630"
X-IronPort-AV: E=Sophos;i="6.21,310,1763452800"; d="scan'208";a="73150630"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Feb 2026 01:18:31 -0800
X-CSE-ConnectionGUID: LNehDBjoRpmxM4gsSGuhyA==
X-CSE-MsgGUID: W4AJ1YEwSgi3EuAv6IkCFw==
X-ExtLoop1: 1
Received: from abityuts-desk.ger.corp.intel.com (HELO localhost)
 ([10.245.244.16])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Feb 2026 01:18:30 -0800
Date: Wed, 25 Feb 2026 11:18:27 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Jani Nikula <jani.nikula@intel.com>
Cc: igt-dev@lists.freedesktop.org, George Zhang <george.zhang@amd.com>,
 Tom Chung <chiahsuan.chung@amd.com>
Subject: Re: [PATCH i-g-t v2 05/23] tests/amdgpu/amd_abm: Don't use
 uninitialized 'pipe'
Message-ID: <aZ6-Yz943wkDtMPl@intel.com>
References: <20260221032003.30936-1-ville.syrjala@linux.intel.com>
 <20260221032003.30936-6-ville.syrjala@linux.intel.com>
 <f8bade0a295263013a0cf7f7dc6b399be3bd0040@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <f8bade0a295263013a0cf7f7dc6b399be3bd0040@intel.com>
X-Patchwork-Hint: comment
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
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

On Tue, Feb 24, 2026 at 04:08:16PM +0200, Jani Nikula wrote:
> On Sat, 21 Feb 2026, Ville Syrjala <ville.syrjala@linux.intel.com> wrote:
> > From: Ville Syrjälä <ville.syrjala@linux.intel.com>
> >
> > The for_each_valid_output_on_pipe() loops in amd_abm use an
> > uninitialized 'pipe' variable. Not entirely sure what the intention
> > was with the change to for_each_valid_output_on_pipe(), but eg.
> > set_abm_level() gets called from those loops and it operates on
> > data->pipe_id instead of whatever stack garbage pipe the loop
> > happens to use. So let's assume the intention was to use the same
> > fixed pipe for everything and just pass data->pipe_id to
> > for_each_valid_output_on_pipe().
> 
> Would be great to get input from the authors, but in any case
> 
> Acked-by: Jani Nikula <jani.nikula@intel.com>

Ta. I pushed the series as is, mainly to avoid conflicts creeping
in, and I want to finish the treewide refactoring (hopefully) this
week. We can revisit this test later if the change turns out to be
wrong.

> 
> >
> >  #include "scripts/iterators.cocci"
> >
> > @@
> > iterator name for_each_valid_output_on_pipe;
> > expression DISPLAY, OUTPUT;
> > identifier PIPE;
> > type T;
> > @@
> > - T PIPE;
> > <+... when != PIPE = ...
> >   for_each_valid_output_on_pipe(DISPLAY,
> > -	PIPE,
> > +	data->pipe_id,
> > 	OUTPUT)
> > 	{...}
> > ...+>
> >
> > Cc: George Zhang <george.zhang@amd.com>
> > Cc: Tom Chung <chiahsuan.chung@amd.com>
> > Fixes: 1235576931b5 ("tests/amdgpu/amd_abm: Fixed tests to only run on one output per pipe")
> > Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
> > ---
> >  tests/amdgpu/amd_abm.c | 18 ++++++------------
> >  1 file changed, 6 insertions(+), 12 deletions(-)
> >
> > diff --git a/tests/amdgpu/amd_abm.c b/tests/amdgpu/amd_abm.c
> > index 110dd89e3ac2..159f6c7c69e9 100644
> > --- a/tests/amdgpu/amd_abm.c
> > +++ b/tests/amdgpu/amd_abm.c
> > @@ -170,10 +170,9 @@ static void test_fini(data_t *data)
> >  {
> >  	igt_display_t *display = &data->display;
> >  	igt_output_t *output;
> > -	enum pipe pipe;
> >  
> >  	/* Disable ABM before exit test */
> > -	for_each_valid_output_on_pipe(&data->display, pipe, output) {
> > +	for_each_valid_output_on_pipe(&data->display, data->pipe_id, output) {
> >  		if (output->config.connector->connector_type != DRM_MODE_CONNECTOR_eDP)
> >  			continue;
> >  		set_abm_level(data, output, 0);
> > @@ -328,9 +327,8 @@ static void backlight_dpms_cycle(data_t *data)
> >  	int max_brightness;
> >  	int pwm_1, pwm_2;
> >  	igt_output_t *output;
> > -	enum pipe pipe;
> >  
> > -	for_each_valid_output_on_pipe(&data->display, pipe, output) {
> > +	for_each_valid_output_on_pipe(&data->display, data->pipe_id, output) {
> >  		if (output->config.connector->connector_type != DRM_MODE_CONNECTOR_eDP)
> >  			continue;
> >  
> > @@ -359,10 +357,9 @@ static void backlight_monotonic_basic(data_t *data)
> >  	int prev_pwm, pwm;
> >  	int brightness_step;
> >  	int brightness;
> > -	enum pipe pipe;
> >  	igt_output_t *output;
> >  
> > -	for_each_valid_output_on_pipe(&data->display, pipe, output) {
> > +	for_each_valid_output_on_pipe(&data->display, data->pipe_id, output) {
> >  		if (output->config.connector->connector_type != DRM_MODE_CONNECTOR_eDP)
> >  			continue;
> >  		ret = backlight_read_max_brightness(&max_brightness);
> > @@ -393,10 +390,9 @@ static void backlight_monotonic_abm(data_t *data)
> >  	int prev_pwm, pwm;
> >  	int brightness_step;
> >  	int brightness;
> > -	enum pipe pipe;
> >  	igt_output_t *output;
> >  
> > -	for_each_valid_output_on_pipe(&data->display, pipe, output) {
> > +	for_each_valid_output_on_pipe(&data->display, data->pipe_id, output) {
> >  		if (output->config.connector->connector_type != DRM_MODE_CONNECTOR_eDP)
> >  			continue;
> >  		ret = backlight_read_max_brightness(&max_brightness);
> > @@ -426,10 +422,9 @@ static void abm_enabled(data_t *data)
> >  	int ret, i;
> >  	int max_brightness;
> >  	int pwm, prev_pwm, pwm_without_abm;
> > -	enum pipe pipe;
> >  	igt_output_t *output;
> >  
> > -	for_each_valid_output_on_pipe(&data->display, pipe, output) {
> > +	for_each_valid_output_on_pipe(&data->display, data->pipe_id, output) {
> >  		if (output->config.connector->connector_type != DRM_MODE_CONNECTOR_eDP)
> >  			continue;
> >  
> > @@ -460,10 +455,9 @@ static void abm_gradual(data_t *data)
> >  	int convergence_delay = 10;
> >  	int prev_pwm, pwm, curr;
> >  	int max_brightness;
> > -	enum pipe pipe;
> >  	igt_output_t *output;
> >  
> > -	for_each_valid_output_on_pipe(&data->display, pipe, output) {
> > +	for_each_valid_output_on_pipe(&data->display, data->pipe_id, output) {
> >  		if (output->config.connector->connector_type != DRM_MODE_CONNECTOR_eDP)
> >  			continue;
> 
> -- 
> Jani Nikula, Intel

-- 
Ville Syrjälä
Intel
