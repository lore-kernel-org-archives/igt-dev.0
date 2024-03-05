Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 829B5C54798
	for <igt-dev@archiver.kernel.org>; Tue,  5 Mar 2024 17:34:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D42610E158;
	Tue,  5 Mar 2024 17:34:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eVPwJ+cs";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 006D510E553
 for <igt-dev@lists.freedesktop.org>; Tue,  5 Mar 2024 17:34:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709660089; x=1741196089;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=bXz4hCQK/vj5rJHvV7/pjgf8vnfPFd/JljXtHbZMjJs=;
 b=eVPwJ+csuDai1j6E4SwIEEI1PF82fBuk30yWBQuSMR7yDPwuu0vAWF+W
 ql9pN/RjVEhz9FDJV6xMM4Vi4l7otVtJWpi83oo+rCeM0nW4+HIf2YgJJ
 ylCZxtYb9ewYNLOLX3Tf28uwVB71DFaOYUMSoBNw6LRxVtNdo34QuB7aj
 CAg5ubmFEydrKpzAucqEuIzxTmePxwEN+cjwTb5r0zPSneOeRR7aH+x8a
 zoQWatWJ4l0Fes4LKGc1nfknkB4Isl7SDz8ef9JGbznNHqqB01hafTzcq
 OTJ62QZd+thUJTZvNAuw+3e1f5P7RGE7eh3owXKjuE4Nhr9IQ/zb1wD8V g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11003"; a="29653637"
X-IronPort-AV: E=Sophos;i="6.06,206,1705392000"; d="scan'208";a="29653637"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Mar 2024 09:34:47 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,206,1705392000"; d="scan'208";a="14020272"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by fmviesa004-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Mar 2024 09:34:44 -0800
Date: Tue, 5 Mar 2024 18:34:41 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: "Modem, Bhanuprakash" <bhanuprakash.modem@intel.com>,
 Kunal Joshi <kunal1.joshi@intel.com>, Karthik B S <karthik.b.s@intel.com>
Subject: Re: [PATCH i-g-t 3/4] tests/intel/kms_big_joiner: revamp
 kms_big_joiner
Message-ID: <20240305173441.v7fekh5afklqymlx@kamilkon-desk.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 "Modem, Bhanuprakash" <bhanuprakash.modem@intel.com>,
 Kunal Joshi <kunal1.joshi@intel.com>,
 Karthik B S <karthik.b.s@intel.com>
References: <20240303172216.254535-1-kunal1.joshi@intel.com>
 <20240303172216.254535-4-kunal1.joshi@intel.com>
 <93e8badc-b8d1-40ae-a0d1-779746609d31@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <93e8badc-b8d1-40ae-a0d1-779746609d31@intel.com>
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

Hi Modem,,
On 2024-03-05 at 17:14:27 +0530, Modem, Bhanuprakash wrote:
> Hi Kunal,
> 
> On 03-03-2024 10:52 pm, Kunal Joshi wrote:
> > big joiner outputs are statically assigned to pipe,
> > assign dynamically also add support for forcing
> > joiner, support for forcing joiner was introduced with
> > below kmd patch
> > 
> > drm/i915: Add bigjoiner force enable option to debugfs
> > 
> > Cc: Karthik B S <karthik.b.s@intel.com>
> > Cc: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
> > Signed-off-by: Kunal Joshi <kunal1.joshi@intel.com>
> > ---
> >   tests/intel/kms_big_joiner.c | 494 +++++++++++++++++++----------------
> >   1 file changed, 270 insertions(+), 224 deletions(-)
> > 
> > diff --git a/tests/intel/kms_big_joiner.c b/tests/intel/kms_big_joiner.c
> > index 28678b958..a4f6b8782 100644
> > --- a/tests/intel/kms_big_joiner.c
> > +++ b/tests/intel/kms_big_joiner.c
> > @@ -1,27 +1,6 @@
> > +/* SPDX-License-Identifier: MIT */
> >   /*
> > - * Copyright © 2020 Intel Corporation
> > - *
> > - * Permission is hereby granted, free of charge, to any person obtaining a
> > - * copy of this software and associated documentation files (the "Software"),
> > - * to deal in the Software without restriction, including without limitation
> > - * the rights to use, copy, modify, merge, publish, distribute, sublicense,
> > - * and/or sell copies of the Software, and to permit persons to whom the
> > - * Software is furnished to do so, subject to the following conditions:
> > - *
> > - * The above copyright notice and this permission notice (including the next
> > - * paragraph) shall be included in all copies or substantial portions of the
> > - * Software.
> > - *
> > - * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
> > - * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
> > - * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
> > - * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
> > - * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
> > - * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS
> > - * IN THE SOFTWARE.
> > - *
> > - * Author:
> > - *  Karthik B S <karthik.b.s@intel.com>
> > + * Copyright © 2024 Intel Corporation
> 
> I think, we don't need to touch the license part.
> 
> @kmail JFYI
> 

We useally do not touch existing licence, you could consider adding 2024
year to it if you make much changes.

Regards,
Kamil

> >    */
> >   /**
> > @@ -37,22 +16,36 @@
> >   #include "igt.h"
> >   /**
> > - * SUBTEST: invalid-modeset
> > - * Description: Verify if the modeset on the adjoining pipe is rejected when
> > - *              the pipe is active with a big joiner modeset
> > - *
> >    * SUBTEST: basic
> >    * Description: Verify the basic modeset on big joiner mode on all pipes
> >    *
> > - * SUBTEST: 2x-modeset
> > - * Description: Verify simultaneous modeset on 2 big joiner outputs
> > + * SUBTEST: force-joiner-basic
> > + * Description: Verify the basic modeset on force joiner mode on all pipes
> > + *
> > + * SUBTEST: invalid-modeset
> > + * Description: Verify the invalid modeset on big joiner mode on all pipes
> > + *
> > + * SUBTEST: force-joiner-invalid-modeset
> > + * Description: Verify the invalid modeset on force joiner mode on all pipes
> >    */
> > +IGT_TEST_DESCRIPTION("Test big joiner / force joiner");
> > -IGT_TEST_DESCRIPTION("Test big joiner");
> > +#define MAX_OUTPUTS 256
> > +#define MAX_COMBINATIONS 1000
> > +#define INVALID_TEST_OUTPUT 2
> > +typedef struct {
> > +    int combination[MAX_OUTPUTS];
> > +} Combination;
> > -struct bigjoiner_output {
> > -	uint32_t output_id;
> > -	drmModeModeInfo mode;
> > +enum tests {
> > +	BASIC,
> > +	INVALID_MODESET,
> > +	INVALID,
> > +};
> > +
> > +enum joiner_type {
> > +	BIG_JOINER = 1 << 1,
> > +	INVALID_JOINER = -1,
> >   };
> >   typedef struct {
> > @@ -60,273 +53,326 @@ typedef struct {
> >   	igt_display_t display;
> >   	struct igt_fb fb;
> >   	int n_pipes;
> > -	enum pipe pipe1;
> > -	enum pipe pipe2;
> > -	struct bigjoiner_output output[2];
> > +	uint64_t big_joiner_outputs[IGT_MAX_PIPES];
> > +	uint64_t non_big_joiner_outputs[IGT_MAX_PIPES];
> > +	uint64_t combined_outputs[IGT_MAX_PIPES];
> > +	int big_joiner_output_count;
> > +	int non_big_joiner_output_count;
> > +	int combined_output_count;
> > +	int output_count;
> > +	enum pipe pipe_seq[IGT_MAX_PIPES];
> >   } data_t;
> >   static int max_dotclock;
> > -static void test_invalid_modeset(data_t *data)
> > +static bool output_supports_force_joiner(igt_output_t *output)
> >   {
> > -	igt_output_t *output;
> > -	igt_display_t *display = &data->display;
> > -	int ret;
> > +	return output->config.connector->connector_type ==
> > +	       DRM_MODE_CONNECTOR_DisplayPort ||
> > +	       output->config.connector->connector_type ==
> > +	       DRM_MODE_CONNECTOR_eDP;
> > +}
> 
> I think, this is not a source of truth. Perhaps, you can just check if
> debugfs is present or not.
> 
> > -	igt_info("Bigjoiner test on ");
> > -	for_each_connected_output(display, output){
> > -		enum pipe p = output->pending_pipe;
> > -		drmModeModeInfo *mode;
> > -		igt_pipe_t *pipe;
> > -		igt_plane_t *plane;
> > +static void generate_combinations(int output_count, int pipe_count,
> > +				  int pipes_per_output,
> > +				  Combination combinations[MAX_COMBINATIONS],
> > +				  uint64_t *num_combinations)
> 
> If possible, can you please add some documentation? I am not able to
> understand this logic.
> 
> > +{
> > +	int i, index;
> > +	int current_combination[MAX_OUTPUTS];
> > -		if (p == PIPE_NONE)
> > -			continue;
> > +	for (i = 0; i < output_count; ++i)
> > +		current_combination[i] = i * pipes_per_output;
> > -		mode = igt_output_get_mode(output);
> > -		igt_info("pipe:%s, output:%s, mode:", kmstest_pipe_name(p), igt_output_name(output));
> > -		kmstest_dump_mode(mode);
> > +	while (current_combination[0] <= pipe_count - output_count * pipes_per_output) {
> > +		for (i = 0; i < output_count; ++i)
> > +			combinations[*num_combinations].combination[i] = current_combination[i];
> > -		pipe = &display->pipes[p];
> > -		plane = igt_pipe_get_plane_type(pipe, DRM_PLANE_TYPE_PRIMARY);
> > +		(*num_combinations)++;
> > -		igt_plane_set_fb(plane, &data->fb);
> > -		igt_fb_set_size(&data->fb, plane, mode->hdisplay, mode->vdisplay);
> > -		igt_plane_set_size(plane, mode->hdisplay, mode->vdisplay);
> > -	}
> > +		index = output_count - 1;
> > +		while (index >= 0 && current_combination[index] == pipe_count - (output_count - index) * pipes_per_output)
> > +			index--;
> > -	igt_assert(!igt_check_bigjoiner_support(display));
> > +		if (index < 0)
> > +			break;
> > -	/* This commit is expectd to fail as this pipe is being used for big joiner */
> > -	ret = igt_display_try_commit_atomic(display, DRM_MODE_ATOMIC_TEST_ONLY |
> > -					    DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);
> > +		current_combination[index]++;
> > +		for (i = index + 1; i < output_count; ++i)
> > +			current_combination[i] = current_combination[i - 1] + pipes_per_output;
> > +    }
> > +}
> > -	igt_display_reset(&data->display);
> > -	igt_display_commit2(display, COMMIT_ATOMIC);
> > +static igt_output_t *get_output_by_id(data_t *data, uint64_t output_id)
> > +{
> > +	igt_output_t *output;
> > -	igt_assert_lt(ret, 0);
> > +	for_each_connected_output(&data->display, output) {
> > +		if (output->id == output_id)
> > +			return output;
> > +	}
> > +	igt_assert("Output not found\n");
> 
> igt_assert without condition?
> 
> > +	return NULL;
> >   }
> > -static void test_basic_modeset(data_t *data)
> > +static void test_invalid_modeset_two_joiner(data_t *data, bool force_joiner,
> > +					    bool combined)
> >   {
> > +	int i, j, ret;
> > +	igt_output_t *output;
> > +	uint64_t *outputs;
> > +	igt_plane_t *primary[INVALID_TEST_OUTPUT];
> > +	igt_fb_t fb[INVALID_TEST_OUTPUT];
> >   	drmModeModeInfo *mode;
> > -	igt_output_t *output, *bigjoiner_output = NULL;
> > -	igt_display_t *display = &data->display;
> > -	igt_pipe_t *pipe;
> > -	igt_plane_t *plane;
> > -
> > -	igt_display_reset(display);
> > -	for_each_connected_output(display, output) {
> > -		if (data->output[0].output_id == output->id) {
> > -			bigjoiner_output = output;
> > -			break;
> > +	outputs = force_joiner ? data->non_big_joiner_outputs :
> > +		  combined ? data->combined_outputs : data->big_joiner_outputs;
> > +
> > +	for (i = 0; i < data->n_pipes-1; i++) {
> > +		igt_display_reset(&data->display);
> > +		for (j = 0; j < INVALID_TEST_OUTPUT; j++) {
> > +			output = get_output_by_id(data, outputs[j]);
> > +			igt_assert(output);
> > +			if (force_joiner) {
> > +				igt_force_bigjoiner_enable(data->drm_fd, output->name, true);
> > +				igt_assert(igt_check_force_bigjoiner_status(data->drm_fd, output->name) == 1);
> > +			}
> > +			igt_output_set_pipe(output, data->pipe_seq[i + j]);
> > +			mode = igt_output_get_mode(output);
> > +			igt_info(" Assigning pipe %s to %s with mode %dx%d@%d%s",
> > +				 kmstest_pipe_name(data->pipe_seq[i + j]),
> > +				 igt_output_name(output), mode->hdisplay,
> > +				 mode->vdisplay, mode->vrefresh,
> > +				 j == INVALID_TEST_OUTPUT - 1 ? "\n" : ", ");
> > +			primary[j] = igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
> > +			igt_create_pattern_fb(data->drm_fd, mode->hdisplay, mode->vdisplay, DRM_FORMAT_XRGB8888,
> > +								  DRM_FORMAT_MOD_LINEAR, &fb[j]);
> > +			igt_plane_set_fb(primary[j], &fb[j]);
> > +		}
> > +		ret = igt_display_try_commit2(&data->display, COMMIT_ATOMIC);
> > +		igt_assert_f(ret != 0, "Commit shouldn't have passed\n");
> > +		if (force_joiner) {
> > +			for (j = 0; j < INVALID_TEST_OUTPUT; j++) {
> > +				output = get_output_by_id(data, outputs[j]);
> > +				igt_assert(output);
> > +				igt_force_bigjoiner_enable(data->drm_fd, output->name, false);
> > +				igt_assert(igt_check_force_bigjoiner_status(data->drm_fd, output->name) == 0);
> > +			}
> >   		}
> >   	}
> > -
> > -	igt_output_set_pipe(bigjoiner_output, data->pipe1);
> > -
> > -	mode = &data->output[0].mode;
> > -	igt_output_override_mode(bigjoiner_output, mode);
> > -
> > -	pipe = &display->pipes[data->pipe1];
> > -	plane = igt_pipe_get_plane_type(pipe, DRM_PLANE_TYPE_PRIMARY);
> > -
> > -	igt_plane_set_fb(plane, &data->fb);
> > -	igt_fb_set_size(&data->fb, plane, mode->hdisplay, mode->vdisplay);
> > -	igt_plane_set_size(plane, mode->hdisplay, mode->vdisplay);
> > -
> > -	igt_display_commit2(display, COMMIT_ATOMIC);
> > -
> > -	igt_output_set_pipe(bigjoiner_output, PIPE_NONE);
> > -	igt_plane_set_fb(plane, NULL);
> > -	igt_display_commit2(display, COMMIT_ATOMIC);
> >   }
> > -static void test_dual_display(data_t *data)
> > +static void tets_big_joiner_on_last_pipe(data_t *data, bool force_joiner)
> >   {
> > +	int i, len, ret;
> > +	uint64_t *outputs;
> > +	igt_output_t *output;
> > +	igt_plane_t *primary;
> > +	igt_fb_t fb;
> >   	drmModeModeInfo *mode;
> > -	igt_output_t *output, *bigjoiner_output[2];
> > -	igt_display_t *display = &data->display;
> > -	igt_pipe_t *pipe;
> > -	igt_plane_t *plane1, *plane2;
> > -	int count = 0;
> > -	igt_display_reset(display);
> > +	len = force_joiner ? data->non_big_joiner_output_count : data->big_joiner_output_count;
> > +	outputs = force_joiner ? data->non_big_joiner_outputs : data->big_joiner_outputs;
> > -	for_each_connected_output(display, output) {
> > -		if (data->output[count].output_id == output->id) {
> > -			bigjoiner_output[count] = output;
> > -			count++;
> > +	for (i = 0; i < len; i++) {
> > +		igt_display_reset(&data->display);
> > +		output = get_output_by_id(data, outputs[i]);
> > +		if (force_joiner) {
> > +			igt_force_bigjoiner_enable(data->drm_fd, output->name, true);
> > +			igt_assert(igt_check_force_bigjoiner_status(data->drm_fd, output->name) == 1);
> >   		}
> > -
> > -		if (count > 1)
> > -			break;
> > +		igt_output_set_pipe(output, data->pipe_seq[data->n_pipes - 1]);
> > +		mode = igt_output_get_mode(output);
> > +		igt_info(" Assigning pipe %s to %s with mode %dx%d@%d\n",
> > +				 kmstest_pipe_name(data->pipe_seq[data->n_pipes - 1]),
> > +				 igt_output_name(output), mode->hdisplay,
> > +				 mode->vdisplay, mode->vrefresh);
> > +		primary = igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
> > +		igt_create_pattern_fb(data->drm_fd, mode->hdisplay, mode->vdisplay, DRM_FORMAT_XRGB8888,
> > +							  DRM_FORMAT_MOD_LINEAR, &fb);
> > +		igt_plane_set_fb(primary, &fb);
> > +		ret = igt_display_try_commit2(&data->display, COMMIT_ATOMIC);
> > +		igt_assert_f(ret != 0, "Commit shouldn't have passed\n");
> >   	}
> > +	if (force_joiner) {
> > +		for (i = 0; i < len; i++) {
> > +			output = get_output_by_id(data, outputs[i]);
> > +			igt_force_bigjoiner_enable(data->drm_fd, output->name, false);
> > +		}
> > +	}
> > +}
> > -	igt_output_set_pipe(bigjoiner_output[0], data->pipe1);
> > -	igt_output_set_pipe(bigjoiner_output[1], data->pipe2);
> > -
> > -	/* Set up first big joiner output on Pipe A*/
> > -	mode = &data->output[0].mode;
> > -	igt_output_override_mode(bigjoiner_output[0], mode);
> > -
> > -	pipe = &display->pipes[data->pipe1];
> > -	plane1 = igt_pipe_get_plane_type(pipe, DRM_PLANE_TYPE_PRIMARY);
> > -
> > -	igt_plane_set_fb(plane1, &data->fb);
> > -	igt_fb_set_size(&data->fb, plane1, mode->hdisplay, mode->vdisplay);
> > -	igt_plane_set_size(plane1, mode->hdisplay, mode->vdisplay);
> > -
> > -	/* Set up second big joiner output on Pipe C*/
> > -	mode = &data->output[1].mode;
> > -	igt_output_override_mode(bigjoiner_output[1], mode);
> > -
> > -	pipe = &display->pipes[data->pipe2];
> > -	plane2 = igt_pipe_get_plane_type(pipe, DRM_PLANE_TYPE_PRIMARY);
> > -
> > -	igt_plane_set_fb(plane2, &data->fb);
> > -	igt_fb_set_size(&data->fb, plane2, mode->hdisplay, mode->vdisplay);
> > -	igt_plane_set_size(plane2, mode->hdisplay, mode->vdisplay);
> > -
> > -	igt_display_commit2(display, COMMIT_ATOMIC);
> > +static void test_basic_modeset(data_t *data, int num_outputs,
> > +			       Combination combinations[MAX_COMBINATIONS],
> > +			       uint64_t num_combinations, bool force_joiner)
> > +{
> > +	int i, j, ret;
> > +	igt_display_t *display = &data->display;
> > +	igt_output_t *output[num_outputs];
> > +	igt_plane_t *primary[num_outputs];
> > +	igt_fb_t fb[num_outputs];
> > +	drmModeModeInfo *mode;
> > -	/* Clean up */
> > -	igt_output_set_pipe(bigjoiner_output[0], PIPE_NONE);
> > -	igt_output_set_pipe(bigjoiner_output[1], PIPE_NONE);
> > -	igt_plane_set_fb(plane1, NULL);
> > -	igt_plane_set_fb(plane2, NULL);
> > -	igt_display_commit2(display, COMMIT_ATOMIC);
> > +	for (i = 0; i < num_combinations; i++) {
> > +		igt_display_reset(display);
> > +		for (j = 0; j < num_outputs; j++) {
> > +			output[j] = get_output_by_id(data,
> > +						     force_joiner ?
> > +						     data->non_big_joiner_outputs[j] :
> > +						     data->big_joiner_outputs[j]);
> > +			if (force_joiner) {
> > +				igt_force_bigjoiner_enable(data->drm_fd,
> > +							   output[j]->name, true);
> 
> Do we need to check the sysfs write status? since this helper has the return
> type as non-void.
> 
> > +				igt_assert(igt_check_force_bigjoiner_status(data->drm_fd,
> > +									    output[j]->name) == 1);
> > +			}
> > +			igt_info("Assigning pipe %d to %s%s",
> > +				 data->pipe_seq[combinations[i].combination[j]],
> 
> Let's print the pipe name which is more redable than index.
> 
> > +				 output[j]->name, j == num_outputs - 1 ? "\n" : ", ");
> > +			igt_output_set_pipe(output[j], data->pipe_seq[combinations[i].combination[j]]);
> > +			primary[j] = igt_output_get_plane_type(output[j], DRM_PLANE_TYPE_PRIMARY);
> > +			mode = igt_output_get_mode(output[j]);
> > +			igt_create_pattern_fb(data->drm_fd, mode->hdisplay, mode->vdisplay, DRM_FORMAT_XRGB8888,
> > +								  DRM_FORMAT_MOD_LINEAR, &fb[j]);
> > +			igt_plane_set_fb(primary[j], &fb[j]);
> > +		}
> > +		ret = igt_display_try_commit2(display, COMMIT_ATOMIC);
> > +		if (ret == 0)
> > +			igt_display_commit2(display, COMMIT_ATOMIC);
> 
> This commit is not required.
> 
> > +		else
> > +			igt_assert_f(ret == 0, "Commit failed\n");
> > +
> > +		if (force_joiner) {
> > +			for (j = 0; j < num_outputs; j++) {
> > +				igt_force_bigjoiner_enable(data->drm_fd, output[j]->name, false);
> > +				igt_assert(igt_check_force_bigjoiner_status(data->drm_fd, output[j]->name) == 0);
> > +			}
> > +		}
> > +    }
> >   }
> >   igt_main
> >   {
> > +	int i, j;
> >   	data_t data;
> >   	igt_output_t *output;
> > -	drmModeModeInfo mode;
> > -	int valid_output = 0, i, count = 0, j = 0;
> > -	uint16_t width = 0, height = 0;
> > -	enum pipe pipe_seq[IGT_MAX_PIPES];
> > +	i = j = 0;
> >   	igt_fixture {
> >   		data.drm_fd = drm_open_driver_master(DRIVER_INTEL | DRIVER_XE);
> >   		kmstest_set_vt_graphics_mode();
> > -
> >   		igt_display_require(&data.display, data.drm_fd);
> >   		igt_require(data.display.is_atomic);
> > -
> >   		max_dotclock = igt_get_max_dotclock(data.drm_fd);
> > +		data.big_joiner_output_count = 0;
> > +		data.non_big_joiner_output_count = 0;
> > +		data.combined_output_count = 0;
> > +		data.output_count = 0;
> >   		for_each_connected_output(&data.display, output) {
> >   			bool found = false;
> >   			drmModeConnector *connector = output->config.connector;
> > -
> > -			/*
> > -			 * Bigjoiner will come in to the picture when the
> > -			 * resolution > 5K or clock > max-dot-clock.
> > -			 */
> >   			found = bigjoiner_mode_found(data.drm_fd, connector, max_dotclock);
> > -
> >   			if (found) {
> > -				data.output[count].output_id = output->id;
> > -				memcpy(&data.output[count].mode, &mode, sizeof(drmModeModeInfo));
> > -				count++;
> > -
> > -				width = max(width, mode.hdisplay);
> > -				height = max(height, mode.vdisplay);
> > +				data.big_joiner_outputs[data.big_joiner_output_count++] = output->id;
> > +				igt_output_override_mode(output, &connector->modes[0]);
> > +			} else {
> > +				if (output_supports_force_joiner(output)) {
> > +					data.non_big_joiner_outputs[data.non_big_joiner_output_count++] = output->id;
> > +					igt_sort_connector_modes(connector, sort_drm_modes_by_res_dsc);
> 
> Do we really need to sort the connector modes?
> 
> > +					igt_output_override_mode(output, &connector->modes[0]);
> > +				}
> >   			}
> > -			valid_output++;
> > +			data.output_count++;
> >   		}
> >   		data.n_pipes = 0;
> >   		for_each_pipe(&data.display, i) {
> >   			data.n_pipes++;
> > -			pipe_seq[j] = i;
> > +			data.pipe_seq[j] = i;
> >   			j++;
> >   		}
> > -
> > -		igt_require_f(count > 0, "No output with 5k+ mode (or) clock > max-dot-clock found\n");
> > -
> > -		igt_create_pattern_fb(data.drm_fd, width, height, DRM_FORMAT_XRGB8888,
> > -				      DRM_FORMAT_MOD_LINEAR, &data.fb);
> >   	}
> >   	igt_describe("Verify the basic modeset on big joiner mode on all pipes");
> >   	igt_subtest_with_dynamic("basic") {
> > -		for (i = 0; i < data.n_pipes - 1; i++) {
> > -			data.pipe1 = pipe_seq[i];
> > -			igt_dynamic_f("pipe-%s", kmstest_pipe_name(pipe_seq[i]))
> > -				test_basic_modeset(&data);
> > +		igt_require_f(data.big_joiner_output_count > 0, "Big joiner output not found\n");
> > +		igt_require_f(data.n_pipes > 1, "Minimum of 2 pipes are required\n");
> > +
> > +		for (i = 0; i < data.big_joiner_output_count; i++) {
> > +			uint64_t num_combinations = 0;
> > +			Combination combinations[MAX_COMBINATIONS];
> > +
> > +			generate_combinations(i+1, data.n_pipes, BIG_JOINER, combinations, &num_combinations);
> > +			igt_info("Number of combinations for %d outputs and %d pipes are %ld\n",
> > +					 i+1, data.n_pipes, num_combinations);
> > +
> > +			if (num_combinations > 0)
> > +				igt_dynamic_f("%dx-big-joiner", i+1)
> > +					test_basic_modeset(&data, i+1, combinations, num_combinations, false);
> > +			else
> > +				break;
> 
> IMHO, we need to split this patch into 2:
> 1- Rewamp existing subtests
> 2- Add new subtests for forcejoiner
> 
> >   		}
> >   	}
> > -	igt_describe("Verify if the modeset on the adjoining pipe is rejected "
> > -		     "when the pipe is active with a big joiner modeset");
> > -	igt_subtest_with_dynamic("invalid-modeset") {
> > -		data.pipe1 = pipe_seq[j - 1];
> > -
> > -		igt_display_reset(&data.display);
> > -		for_each_connected_output(&data.display, output) {
> > -			if (data.output[0].output_id != output->id)
> > -				continue;
> > -
> > -			mode = data.output[0].mode;
> > -			igt_output_set_pipe(output, data.pipe1);
> > -			igt_output_override_mode(output, &mode);
> > -
> > -			igt_dynamic_f("pipe-%s-%s",
> > -				      kmstest_pipe_name(data.pipe1),
> > -				      igt_output_name(output))
> > -				test_invalid_modeset(&data);
> > +	igt_describe("Verify the basic modeset on big joiner mode on all pipes");
> > +	igt_subtest_with_dynamic("force-joiner-basic") {
> > +		igt_require_f(intel_display_ver(intel_get_drm_devid(data.drm_fd)) >= 11,
> > +                              "force joiner not supported on this platform\n");
> > +		igt_require_f(data.non_big_joiner_output_count > 0, "Big joiner output not found\n");
> > +		igt_require_f(data.n_pipes > 1, "Minimum of 2 pipes are required\n");
> > +
> > +		for (i = 0; i < data.non_big_joiner_output_count; i++) {
> > +			uint64_t num_combinations = 0;
> > +			Combination combinations[MAX_COMBINATIONS];
> > +
> > +			generate_combinations(i+1, data.n_pipes, BIG_JOINER, combinations, &num_combinations);
> > +			igt_info("Number of combinations for %d outputs and %d pipes are %ld\n",
> > +					 i+1, data.n_pipes, num_combinations);
> > +
> > +			if (num_combinations > 0)
> > +				igt_dynamic_f("%dx-joiner", i+1)
> > +					test_basic_modeset(&data, i+1, combinations, num_combinations, true);
> > +			else
> > +				break;
> >   		}
> > +	}
> > -		if(valid_output > 1) {
> > -			for (i = 0; i < data.n_pipes - 1; i++) {
> > -				igt_output_t *first_output = NULL, *second_output = NULL;
> > -
> > -				data.pipe1 = pipe_seq[i];
> > -				data.pipe2 = pipe_seq[i + 1];
> > -
> > -				igt_display_reset(&data.display);
> > -				for_each_connected_output(&data.display, output) {
> > -					if (data.output[0].output_id == output->id) {
> > -						first_output = output;
> > -						mode = data.output[0].mode;
> > +	igt_subtest_with_dynamic("invalid-modeset") {
> > +		igt_require_f(data.big_joiner_output_count > 0, "Big joiner output not found\n");
> > +		igt_require_f(data.n_pipes > 1, "Minimum of 2 pipes are required\n");
> > -						igt_output_set_pipe(output, data.pipe1);
> > -						igt_output_override_mode(output, &mode);
> > -					} else if (second_output == NULL) {
> > -						second_output = output;
> > -						igt_output_set_pipe(output, data.pipe2);
> > +		if (data.big_joiner_output_count >= 1)
> > +			igt_dynamic_f("big_joiner_on_last_pipe")
> > +				tets_big_joiner_on_last_pipe(&data, false);
> > -						break;
> > -					}
> > -				}
> > +		if (data.big_joiner_output_count > 1)
> > +			igt_dynamic_f("invalid_combinations")
> > +				test_invalid_modeset_two_joiner(&data, false, false);
> > -				igt_dynamic_f("pipe-%s-%s-pipe-%s-%s",
> > -					      kmstest_pipe_name(data.pipe1),
> > -					      igt_output_name(first_output),
> > -					      kmstest_pipe_name(data.pipe2),
> > -					      igt_output_name(second_output))
> > -					test_invalid_modeset(&data);
> > -			}
> > +		if (data.big_joiner_output_count == 1 && data.non_big_joiner_output_count > 0) {
> > +			data.combined_outputs[data.combined_output_count++] = data.big_joiner_outputs[0];
> > +			data.combined_outputs[data.combined_output_count++] = data.non_big_joiner_outputs[0];
> 
> Probably, move this logic to igt_fixture & use as:
> if (data.combined_output_count)
> 
> > +			test_invalid_modeset_two_joiner(&data, false, true);
> 
> igt_dynamic() is missing.
> 
> - Bhanu
> 
> >   		}
> >   	}
> > -	igt_describe("Verify simultaneous modeset on 2 big joiner outputs");
> > -	igt_subtest_with_dynamic("2x-modeset") {
> > -		igt_require_f(count > 1, "2 outputs with big joiner modes are required\n");
> > -		igt_require_f(data.n_pipes > 3, "Minumum of 4 pipes are required\n");
> > -		for (i = 0; (i + 2) < data.n_pipes - 1; i++) {
> > -			data.pipe1 = pipe_seq[i];
> > -			data.pipe2 = pipe_seq[i + 2];
> > -			igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(pipe_seq[i]), kmstest_pipe_name(pipe_seq[i + 2]))
> > -				test_dual_display(&data);
> > -		}
> > +	igt_subtest_with_dynamic("force-joiner-invalid-modeset") {
> > +                igt_require_f(intel_display_ver(intel_get_drm_devid(data.drm_fd)) >= 11,
> > +                              "force joiner not supported on this platform\n");
> > +		igt_require_f(data.non_big_joiner_output_count > 0, "Non big joiner output not found\n");
> > +		igt_require_f(data.n_pipes > 1, "Minimum of 2 pipes are required\n");
> > +
> > +		if (data.non_big_joiner_output_count >= 1)
> > +			igt_dynamic_f("big_joiner_on_last_pipe")
> > +				tets_big_joiner_on_last_pipe(&data, true);
> > +
> > +		if (data.non_big_joiner_output_count > 1)
> > +			igt_dynamic_f("invalid_combinations")
> > +				test_invalid_modeset_two_joiner(&data, true, false);
> >   	}
> >   	igt_fixture {
> > -		igt_remove_fb(data.drm_fd, &data.fb);
> >   		igt_display_fini(&data.display);
> >   		drm_close_driver(data.drm_fd);
> >   	}
