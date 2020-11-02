Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F7A66E2A3
 for <igt-dev@lists.freedesktop.org>; Mon,  2 Nov 2020 03:51:07 +0000 (UTC)
References: <20201023100709.5211-1-karthik.b.s@intel.com>
 <20201023100709.5211-2-karthik.b.s@intel.com>
 <20201023105443.GA29526@intel.com>
From: Karthik B S <karthik.b.s@intel.com>
Message-ID: <359be11c-08fe-a7e7-256c-cc875e9bd5d0@intel.com>
Date: Mon, 2 Nov 2020 09:21:02 +0530
MIME-Version: 1.0
In-Reply-To: <20201023105443.GA29526@intel.com>
Content-Language: en-US
Subject: Re: [igt-dev] [PATCH i-g-t v2 1/2] tests/kms_content_protection:
 Add MST subtests
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Anshuman Gupta <anshuman.gupta@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>



On 10/23/2020 4:24 PM, Anshuman Gupta wrote:
> On 2020-10-23 at 15:37:08 +0530, Karthik B S wrote:
>> Add subtests to verify content protection simultaneously on
>> multiple outputs on the same MST topology.
>>
>> Signed-off-by: Anshuman Gupta <anshuman.gupta@intel.com>
>> Signed-off-by: Karthik B S <karthik.b.s@intel.com>
>> ---
>>   tests/kms_content_protection.c | 220 +++++++++++++++++++++++++++++++++
>>   1 file changed, 220 insertions(+)
>>
>> diff --git a/tests/kms_content_protection.c b/tests/kms_content_protection.c
>> index 303ed418..5807f3a3 100644
>> --- a/tests/kms_content_protection.c
>> +++ b/tests/kms_content_protection.c
>> @@ -42,6 +42,12 @@ struct data {
>>   	struct udev_monitor *uevent_monitor;
>>   } data;
>>   
>> +typedef struct {
>> +	float red;
>> +	float green;
>> +	float blue;
>> +} color_t;
>> +
>>   /* Test flags */
>>   #define CP_DPMS					(1 << 0)
>>   #define CP_LIC					(1 << 1)
>> @@ -457,6 +463,54 @@ static bool sink_hdcp2_capable(igt_output_t *output)
>>   
>>   	return strstr(buf, "HDCP2.2");
>>   }
>> +color_t red  = { 1.0f, 0.0f, 0.0f };
>> +color_t green  = { 0.0f, 0.1f, 0.0f };
>> +
>> +static void prepare_modeset_on_mst_output(igt_output_t *output, enum pipe pipe)
>> +{
>> +	drmModeConnectorPtr c = output->config.connector;
>> +	igt_display_t *display = &data.display;
>> +	drmModeModeInfo *mode;
>> +	igt_plane_t *primary;
>> +	int i;
>> +
>> +	mode = igt_output_get_mode(output);
>> +
>> +	/*
>> +	 * TODO: Add logic to use the highest possible modes on each output.
>> +	 * Currently using 2k modes by default on all the outputs.
>> +	 */
>> +	igt_debug("Before mode override: Output %s Mode hdisplay %d Mode vdisplay %d\n",
>> +		   output->name, mode->hdisplay, mode->vdisplay);
>> +
>> +	if (mode->hdisplay > 1920 && mode->vdisplay > 1080) {
>> +		for (i = 0; i < c->count_modes; i++) {
>> +			if (c->modes[i].hdisplay <= 1920 && c->modes[i].vdisplay <= 1080) {
>> +				mode = &c->modes[i];
>> +				igt_output_override_mode(output, mode);
>> +				break;
>> +			}
>> +		}
>> +	}
>> +
>> +	igt_debug("After mode overide: Output %s Mode hdisplay %d Mode vdisplay %d\n",
>> +		   output->name, mode->hdisplay, mode->vdisplay);
>> +
>> +	if (pipe % 2) {
>> +		igt_create_color_fb(display->drm_fd, mode->hdisplay, mode->vdisplay,
>> +				    DRM_FORMAT_XRGB8888, LOCAL_DRM_FORMAT_MOD_NONE,
>> +				    red.red, red.blue, red.green, &data.red);
>> +	} else {
>> +		igt_create_color_fb(display->drm_fd, mode->hdisplay, mode->vdisplay,
>> +				    DRM_FORMAT_XRGB8888, LOCAL_DRM_FORMAT_MOD_NONE,
>> +				    green.red, green.blue, green.green, &data.green);
>> +	}
>> +
>> +	igt_output_set_pipe(output, pipe);
>> +	primary = igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
>> +	igt_plane_set_fb(primary, NULL);
>> +	igt_plane_set_fb(primary, pipe % 2 ? &data.red : &data.green);
>> +}
>>   
>>   static void
>>   test_content_protection(enum igt_commit_style s, int content_type)
>> @@ -496,6 +550,149 @@ test_content_protection(enum igt_commit_style s, int content_type)
>>   	igt_require_f(valid_tests, "No connector found with HDCP capability\n");
>>   }
>>   
>> +static bool is_output_support_cp_capable(igt_output_t *output, int content_type)
>> +{
>> +		if (!output->props[IGT_CONNECTOR_CONTENT_PROTECTION])
>> +			return false;
>> +
>> +		if (!output->props[IGT_CONNECTOR_HDCP_CONTENT_TYPE] &&
>> +		    content_type)
>> +			return false;
>> +
>> +		if (content_type && !sink_hdcp2_capable(output)) {
>> +			igt_info("\tSkip %s (Sink has no HDCP2.2 support)\n",
>> +				 output->name);
>> +			return false;
>> +		} else if (!sink_hdcp_capable(output)) {
>> +			igt_info("\tSkip %s (Sink has no HDCP support)\n",
>> +				 output->name);
>> +			return false;
>> +		}
>> +
>> +		return true;
>> +}
>> +
>> +static int parse_path_blob(char *blob_data)
>> +{
>> +	int connector_id;
>> +	char *encoder;
>> +
>> +	encoder = strtok(blob_data, ":");
>> +	igt_assert_f(!strcmp(encoder, "mst"), "PATH connector property expected to have 'mst'\n");
>> +
>> +	connector_id = atoi(strtok(NULL, "-"));
>> +
>> +	return connector_id;
>> +}
>> +
>> +static bool is_dp_mst_output(igt_output_t *output, int i)
>> +{
>> +	drmModePropertyBlobPtr path_blob = NULL;
>> +	uint64_t path_blob_id;
>> +	drmModeConnector *connector = output->config.connector;
>> +	struct kmstest_connector_config config;
>> +	const char *encoder;
>> +	int connector_id;
>> +	static int prev_connector_id;
>> +
>> +	kmstest_get_connector_config(data.drm_fd, output->config.connector->connector_id, -1, &config);
>> +	encoder = kmstest_encoder_type_str(config.encoder->encoder_type);
>> +
>> +	if (strcmp(encoder, "DP MST"))
>> +		return false;
>> +
>> +	igt_assert(kmstest_get_property(data.drm_fd, connector->connector_id,
>> +		   DRM_MODE_OBJECT_CONNECTOR, "PATH", NULL,
>> +		   &path_blob_id, NULL));
>> +
>> +	igt_assert(path_blob = drmModeGetPropertyBlob(data.drm_fd, path_blob_id));
>> +
>> +	connector_id = parse_path_blob((char *) path_blob->data);
>> +
>> +	/* Check if all the MST outputs are in the same topology */
>> +	if (i == 0) {
>> +		prev_connector_id = connector_id;
>> +	} else {
>> +		if (connector_id != prev_connector_id)
>> +			return false;
>> +	}
>> +
>> +	drmModeFreePropertyBlob(path_blob);
>> +
>> +	return true;
>> +}
>> +
>> +static void
>> +test_content_protection_mst(int content_type)
>> +{
>> +	igt_display_t *display = &data.display;
>> +	igt_output_t *output;
>> +	int valid_outputs = 0, ret, count, max_pipe = 0;
>> +	enum pipe pipe;
>> +	igt_output_t *mst_output[IGT_MAX_PIPES];
>> +
>> +	for_each_connected_output(display, output) {
>> +		if (!is_dp_mst_output(output, valid_outputs))
>> +			continue;
>> +
>> +		if (!is_output_support_cp_capable(output, content_type))
>> +			continue;
>> +
>> +		mst_output[valid_outputs] = output;
>> +		valid_outputs++;
>> +	}
>> +
>> +	igt_require_f(valid_outputs > 1, "No DP MST set up with >= 2 outputs found in a single topology\n");
>> +
>> +	for_each_pipe(display, pipe)
>> +		max_pipe++;
>> +
>> +	if (valid_outputs > max_pipe)
>> +		valid_outputs = max_pipe;
>> +
>> +	pipe = PIPE_A;
>> +
>> +	for (count = 0; count < valid_outputs; count++) {
>> +		igt_assert_f(igt_pipe_connector_valid(pipe, mst_output[count]), "Output-pipe combination invalid\n");
>> +
>> +		prepare_modeset_on_mst_output(mst_output[count], pipe);
>> +		pipe++;
>> +	}
>> +
>> +	igt_display_commit2(display, COMMIT_ATOMIC);
>> +
>> +	for (count = 0; count < valid_outputs; count++) {
>> +		igt_output_set_prop_value(mst_output[count], IGT_CONNECTOR_CONTENT_PROTECTION, CP_DESIRED);
>> +
>> +		if (output->props[IGT_CONNECTOR_HDCP_CONTENT_TYPE])
>> +			igt_output_set_prop_value(mst_output[count], IGT_CONNECTOR_HDCP_CONTENT_TYPE, content_type);
>> +	}
>> +
>> +	igt_display_commit2(display, COMMIT_ATOMIC);
>> +
>> +	for (count = 0; count < valid_outputs; count++) {
>> +		igt_info("CP Prop check to be ENABLED %s\n", mst_output[count]->name);
> 		this is a debug log, in case we need it it should be some like "Test CP Prop to be ENABLED" .

Thanks for the review.
I'll update this.
>> +		ret = wait_for_prop_value(mst_output[count], CP_ENABLED, KERNEL_AUTH_TIME_ALLOWED_MSEC);
>> +		igt_assert_f(ret, "Content Protection not enabled output %s\n", mst_output[count]->name);
>> +
>> +		igt_kmsg("HDCP Prop is ENABLED %s\n", mst_output[count]->name);
> 		this is dmesg log for debugging not required any more.

I'll remove this.
>> +
>> +		if (data.cp_tests & CP_LIC)
>> +			test_cp_lic(mst_output[count]);
>> +	}
>> +
>> +	for (count = 0; count < valid_outputs; count++) {
>> +		igt_info("CP Prop check to be ENABLED %s\n", mst_output[count]->name);
>> +		ret = wait_for_prop_value(mst_output[count], CP_ENABLED, KERNEL_AUTH_TIME_ALLOWED_MSEC);
> 		this should be all possible combination of disabling CP property on one connector and extected to be ENABLED
> 		on another DP MST connector, currently it is not testing like disabling HDCP on second connecotr and expected
> 		to be enable on first connector.

I'll update this accordingly.
>> +		igt_assert_f(ret, "Content Protection not enabled output %s\n", mst_output[count]->name);
>> +
>> +		igt_info("CP Prop being UNDESIRED on %s\n", mst_output[count]->name);
> 		this should be debug log.

I'll update this.
>> +		test_cp_disable(mst_output[count], COMMIT_ATOMIC);
>> +
>> +		igt_kmsg("HDCP Prop is UNDESIRED %s\n", mst_output[count]->name);
> 		this is dmesg log for debugging not required any more.

I'll remove this.

Thanks,
Karthik.B.S
> Thanks ,
> Anshuman
>> +	}
>> +}
>> +
>>   static void test_content_protection_cleanup(void)
>>   {
>>   	igt_display_t *display = &data.display;
>> @@ -512,6 +709,7 @@ static void test_content_protection_cleanup(void)
>>   			continue;
>>   
>>   		igt_info("CP Prop being UNDESIRED on %s\n", output->name);
>> +		igt_kmsg("HDCP Prop being UNDESIRED %s\n", output->name);
> 		this is dmesg log for debugging not required any more.
>>   		test_cp_disable(output, COMMIT_ATOMIC);
>>   	}
>>   }
>> @@ -592,6 +790,28 @@ igt_main
>>   		test_content_protection(COMMIT_ATOMIC, HDCP_CONTENT_TYPE_0);
>>   	}
>>   
>> +	igt_describe("Test Content protection over DP MST");
>> +	igt_subtest("dp-mst-type-0") {
>> +		test_content_protection_mst(HDCP_CONTENT_TYPE_0);
>> +	}
>> +
>> +	igt_describe("Test Content protection over DP MST with LIC");
>> +	igt_subtest("dp-mst-lic-type-0") {
>> +		data.cp_tests = CP_LIC;
>> +		test_content_protection_mst(HDCP_CONTENT_TYPE_0);
>> +	}
>> +
>> +	igt_describe("Test Content protection over DP MST");
>> +	igt_subtest("dp-mst-type-1") {
>> +		test_content_protection_mst(HDCP_CONTENT_TYPE_1);
>> +	}
>> +
>> +	igt_describe("Test Content protection over DP MST with LIC");
>> +	igt_subtest("dp-mst-lic-type-1") {
>> +		data.cp_tests = CP_LIC;
>> +		test_content_protection_mst(HDCP_CONTENT_TYPE_1);
>> +	}
>> +
>>   	igt_fixture {
>>   		test_content_protection_cleanup();
>>   		igt_display_fini(&data.display);
>> -- 
>> 2.22.0
>>
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
