Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D8EA10E02E
 for <igt-dev@lists.freedesktop.org>; Wed, 23 Aug 2023 14:57:36 +0000 (UTC)
Date: Wed, 23 Aug 2023 16:57:01 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Message-ID: <20230823145701.xiilegwtkdeicstk@kamilkon-desk.igk.intel.com>
References: <20230823114354.787212-1-bhanuprakash.modem@intel.com>
 <20230823114354.787212-8-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230823114354.787212-8-bhanuprakash.modem@intel.com>
Subject: Re: [igt-dev] [i-g-t 7/7] tests/i915/pm: Separate display specific
 tests from i915_pm_rpm
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Hi Bhanuprakash,

On 2023-08-23 at 17:13:54 +0530, Bhanuprakash Modem wrote:
> Separate display specific tests, from i915_pm_rpm and create
> a new binary "kms_pm_rpm" for them.
> 
> Note: This patch can be split into multiple, but still it is
> a good starting point to review.
> 
> Cc: Anshuman Gupta <anshuman.gupta@intel.com>
> Cc: Swati Sharma <swati2.sharma@intel.com>
> Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
> ---
>  tests/i915/i915_pm_rpm.c               |  869 -------------
>  tests/i915/kms_pm_rpm.c                | 1665 ++++++++++++++++++++++++
>  tests/intel-ci/blacklist-pre-merge.txt |    8 +-
>  tests/intel-ci/blacklist.txt           |    2 +-
>  tests/intel-ci/fast-feedback.testlist  |    6 +-
>  tests/meson.build                      |    1 +
>  6 files changed, 1674 insertions(+), 877 deletions(-)
>  create mode 100644 tests/i915/kms_pm_rpm.c
> 
> diff --git a/tests/i915/i915_pm_rpm.c b/tests/i915/i915_pm_rpm.c
> index 17413ffe5..2a6b077a2 100644
> --- a/tests/i915/i915_pm_rpm.c
> +++ b/tests/i915/i915_pm_rpm.c
> @@ -43,25 +43,10 @@
>  /**
>   * TEST: i915 pm rpm
>   *
> - * SUBTEST: basic-pci-d3-state
> - * Description: Validate PCI device D3 state enter-exit scenario using runtime PM
> - * Feature: pm_rpm
> - * Functionality: D3 state entry-exit
> - * Run type: BAT
> - * Test category: pm_rpm
> - *
>   * SUBTEST: basic-rte
>   * Feature: pm_rpm
>   * Run type: BAT
>   *
> - * SUBTEST: cursor
> - * Feature: pm_rpm
> - * Run type: FULL
> - *
> - * SUBTEST: cursor-dpms
> - * Feature: pm_rpm
> - * Run type: FULL
> - *
>   * SUBTEST: debugfs-forcewake-user
>   * Feature: pm_rpm
>   * Run type: FULL
> @@ -94,10 +79,6 @@
>   * Feature: gtt, pm_rpm, synchronization
>   * Run type: FULL
>   *
> - * SUBTEST: fences-dpms
> - * Feature: gtt, pm_rpm, synchronization
> - * Run type: FULL
> - *
>   * SUBTEST: gem-evict-pwrite
>   * Feature: gtt, pm_rpm
>   * Run type: FULL
> @@ -127,50 +108,6 @@
>   * Feature: pm_rpm
>   * Run type: FULL
>   *
> - * SUBTEST: i2c
> - * Feature: pm_rpm
> - * Run type: FULL
> - *
> - * SUBTEST: legacy-planes
> - * Feature: pm_rpm
> - * Run type: FULL
> - *
> - * SUBTEST: legacy-planes-dpms
> - * Feature: pm_rpm
> - * Run type: FULL
> - *
> - * SUBTEST: modeset-lpsp
> - * Feature: pm_rpm
> - * Run type: FULL
> - *
> - * SUBTEST: modeset-lpsp-stress
> - * Feature: pm_rpm
> - * Run type: FULL
> - *
> - * SUBTEST: modeset-lpsp-stress-no-wait
> - * Feature: pm_rpm
> - * Run type: FULL
> - *
> - * SUBTEST: modeset-non-lpsp
> - * Feature: non-lpsp, pm_rpm
> - * Run type: FULL
> - *
> - * SUBTEST: modeset-non-lpsp-stress
> - * Feature: non-lpsp, pm_rpm
> - * Run type: FULL
> - *
> - * SUBTEST: modeset-non-lpsp-stress-no-wait
> - * Feature: non-lpsp, pm_rpm
> - * Run type: FULL
> - *
> - * SUBTEST: modeset-pc8-residency-stress
> - * Feature: pm_rpm
> - * Run type: FULL
> - *
> - * SUBTEST: modeset-stress-extra-wait
> - * Feature: pm_rpm
> - * Run type: FULL
> - *
>   * SUBTEST: module-reload
>   * Feature: pm_rpm
>   * Run type: BAT
> @@ -214,18 +151,6 @@
>   * SUBTEST: system-suspend-execbuf
>   * Feature: pm_rpm
>   * Run type: FULL
> - *
> - * SUBTEST: system-suspend-modeset
> - * Feature: pm_rpm
> - * Run type: FULL
> - *
> - * SUBTEST: universal-planes
> - * Feature: pm_rpm
> - * Run type: FULL
> - *
> - * SUBTEST: universal-planes-dpms
> - * Feature: pm_rpm
> - * Run type: FULL
>   */
>  
>  #if defined(__linux__)
> @@ -707,343 +632,6 @@ static void fini_mode_set_data(struct mode_set_data *data)
>  	}
>  }
>  
> -static void get_drm_info(struct compare_data *data)
> -{
> -	int i;
> -
> -	data->res = drmModeGetResources(drm_fd);
> -	if (!data->res)
> -		return;
> -
> -	igt_assert(data->res->count_connectors <= MAX_CONNECTORS);
> -	igt_assert(data->res->count_encoders <= MAX_ENCODERS);
> -	igt_assert(data->res->count_crtcs <= MAX_CRTCS);
> -
> -	for (i = 0; i < data->res->count_connectors; i++) {
> -		/* Don't use GetConnectorCurrent, we want to force a reprobe
> -		 * here. */
> -		data->connectors[i] = drmModeGetConnector(drm_fd,
> -						data->res->connectors[i]);
> -		data->edids[i] = get_connector_edid(data->connectors[i], i);
> -	}
> -	for (i = 0; i < data->res->count_encoders; i++)
> -		data->encoders[i] = drmModeGetEncoder(drm_fd,
> -						data->res->encoders[i]);
> -	for (i = 0; i < data->res->count_crtcs; i++)
> -		data->crtcs[i] = drmModeGetCrtc(drm_fd, data->res->crtcs[i]);
> -}
> -
> -static void free_drm_info(struct compare_data *data)
> -{
> -	int i;
> -
> -	if (!data->res)
> -		return;
> -
> -	for (i = 0; i < data->res->count_connectors; i++) {
> -		drmModeFreeConnector(data->connectors[i]);
> -		drmModeFreePropertyBlob(data->edids[i]);
> -	}
> -	for (i = 0; i < data->res->count_encoders; i++)
> -		drmModeFreeEncoder(data->encoders[i]);
> -	for (i = 0; i < data->res->count_crtcs; i++)
> -		drmModeFreeCrtc(data->crtcs[i]);
> -
> -	drmModeFreeResources(data->res);
> -}
> -
> -#define COMPARE(d1, d2, data) igt_assert_eq(d1->data, d2->data)
> -#define COMPARE_ARRAY(d1, d2, size, data) do { \
> -	for (i = 0; i < size; i++) \
> -		igt_assert(d1->data[i] == d2->data[i]); \
> -} while (0)
> -
> -static void assert_drm_resources_equal(struct compare_data *d1,
> -				       struct compare_data *d2)
> -{
> -	COMPARE(d1, d2, res->count_connectors);
> -	COMPARE(d1, d2, res->count_encoders);
> -	COMPARE(d1, d2, res->count_crtcs);
> -	COMPARE(d1, d2, res->min_width);
> -	COMPARE(d1, d2, res->max_width);
> -	COMPARE(d1, d2, res->min_height);
> -	COMPARE(d1, d2, res->max_height);
> -}
> -
> -static void assert_modes_equal(drmModeModeInfoPtr m1, drmModeModeInfoPtr m2)
> -{
> -	COMPARE(m1, m2, clock);
> -	COMPARE(m1, m2, hdisplay);
> -	COMPARE(m1, m2, hsync_start);
> -	COMPARE(m1, m2, hsync_end);
> -	COMPARE(m1, m2, htotal);
> -	COMPARE(m1, m2, hskew);
> -	COMPARE(m1, m2, vdisplay);
> -	COMPARE(m1, m2, vsync_start);
> -	COMPARE(m1, m2, vsync_end);
> -	COMPARE(m1, m2, vtotal);
> -	COMPARE(m1, m2, vscan);
> -	COMPARE(m1, m2, vrefresh);
> -	COMPARE(m1, m2, flags);
> -	COMPARE(m1, m2, type);
> -	igt_assert(strcmp(m1->name, m2->name) == 0);
> -}
> -
> -static void assert_drm_connectors_equal(drmModeConnectorPtr c1,
> -					drmModeConnectorPtr c2)
> -{
> -	int i;
> -
> -	COMPARE(c1, c2, connector_id);
> -	COMPARE(c1, c2, connector_type);
> -	COMPARE(c1, c2, connector_type_id);
> -	COMPARE(c1, c2, mmWidth);
> -	COMPARE(c1, c2, mmHeight);
> -	COMPARE(c1, c2, count_modes);
> -	COMPARE(c1, c2, count_props);
> -	COMPARE(c1, c2, count_encoders);
> -	COMPARE_ARRAY(c1, c2, c1->count_props, props);
> -	COMPARE_ARRAY(c1, c2, c1->count_encoders, encoders);
> -
> -	for (i = 0; i < c1->count_modes; i++)
> -		assert_modes_equal(&c1->modes[0], &c2->modes[0]);
> -}
> -
> -static void assert_drm_encoders_equal(drmModeEncoderPtr e1,
> -				      drmModeEncoderPtr e2)
> -{
> -	COMPARE(e1, e2, encoder_id);
> -	COMPARE(e1, e2, encoder_type);
> -	COMPARE(e1, e2, possible_crtcs);
> -	COMPARE(e1, e2, possible_clones);
> -}
> -
> -static void assert_drm_crtcs_equal(drmModeCrtcPtr c1, drmModeCrtcPtr c2)
> -{
> -	COMPARE(c1, c2, crtc_id);
> -}
> -
> -static void assert_drm_edids_equal(drmModePropertyBlobPtr e1,
> -				   drmModePropertyBlobPtr e2)
> -{
> -	if (!e1 && !e2)
> -		return;
> -	igt_assert(e1 && e2);
> -
> -	COMPARE(e1, e2, length);
> -
> -	igt_assert(memcmp(e1->data, e2->data, e1->length) == 0);
> -}
> -
> -static void assert_drm_infos_equal(struct compare_data *d1,
> -				   struct compare_data *d2)
> -{
> -	int i;
> -
> -	if (d1->res == d2->res)
> -		return;
> -
> -	igt_assert(d1->res);
> -	igt_assert(d2->res);
> -
> -	assert_drm_resources_equal(d1, d2);
> -
> -	for (i = 0; i < d1->res->count_connectors; i++) {
> -		assert_drm_connectors_equal(d1->connectors[i],
> -					    d2->connectors[i]);
> -		assert_drm_edids_equal(d1->edids[i], d2->edids[i]);
> -	}
> -
> -	for (i = 0; i < d1->res->count_encoders; i++)
> -		assert_drm_encoders_equal(d1->encoders[i], d2->encoders[i]);
> -
> -	for (i = 0; i < d1->res->count_crtcs; i++)
> -		assert_drm_crtcs_equal(d1->crtcs[i], d2->crtcs[i]);
> -}
> -
> -static bool find_i2c_path(const char *connector_name,
> -			  char *i2c_path, size_t i2c_path_size)
> -{
> -	struct dirent *dirent;
> -	DIR *dir;
> -	int sysfs_card_fd = igt_sysfs_open(drm_fd);
> -	int connector_fd = -1;
> -	bool found_i2c_file = false;
> -	ssize_t r;
> -
> -	dir = fdopendir(sysfs_card_fd);
> -	igt_assert(dir);
> -
> -	while ((dirent = readdir(dir))) {
> -		/* Skip "cardx-" prefix */
> -		char *dirname = strchr(dirent->d_name, '-');
> -		if (dirname==NULL)
> -			continue;
> -		++dirname;
> -
> -		if (strcmp(dirname, connector_name) == 0) {
> -			connector_fd = openat(sysfs_card_fd, dirent->d_name, O_RDONLY);
> -			break;
> -		}
> -	}
> -	closedir(dir);
> -
> -	if (connector_fd < 0)
> -		return false;
> -
> -	/* try the standard "ddc" symlink first */
> -	r = readlinkat(connector_fd, "ddc", i2c_path, i2c_path_size);
> -	if (r > 0 && r != i2c_path_size) {
> -		int num;
> -
> -		i2c_path[r] = '\0';
> -
> -		if (sscanf(basename(i2c_path), "i2c-%d", &num) == 1) {
> -			snprintf(i2c_path, i2c_path_size, "/dev/i2c-%d", num);
> -			return true;
> -		}
> -	}
> -
> -	dir = fdopendir(connector_fd);
> -	igt_assert(dir);
> -
> -	/* fall back to old "i2c-?" symlink */
> -	/* FIXME nuke this at some point */
> -	while ((dirent = readdir(dir))) {
> -		if (strncmp(dirent->d_name, "i2c-", 4) == 0) {
> -			sprintf(i2c_path, "/dev/%s", dirent->d_name);
> -			found_i2c_file = true;
> -		}
> -	}
> -	closedir(dir);
> -	return found_i2c_file;
> -}
> -
> -
> -static bool i2c_read_edid(const char *connector_name, unsigned char *edid)
> -{
> -	char i2c_path[PATH_MAX];
> -	bool result;
> -	int rc, fd;
> -	struct i2c_msg msgs[] = {
> -		{ /* Start at 0. */
> -			.addr = 0x50,
> -			.flags = 0,
> -			.len = 1,
> -			.buf = edid,
> -		}, { /* Now read the EDID. */
> -			.addr = 0x50,
> -			.flags = I2C_M_RD,
> -			.len = 128,
> -			.buf = edid,
> -		}
> -	};
> -	struct i2c_rdwr_ioctl_data msgset = {
> -		.msgs = msgs,
> -		.nmsgs = 2,
> -	};
> -
> -	result = find_i2c_path(connector_name, i2c_path, sizeof(i2c_path));
> -	if (!result)
> -		return false;
> -
> -	igt_info("Testing %s %s\n", connector_name, i2c_path);
> -
> -	fd = open(i2c_path, O_RDWR);
> -	igt_assert_neq(fd, -1);
> -
> -	rc = ioctl(fd, I2C_RDWR, &msgset);
> -	if (rc==-1) {
> -		igt_debug("I2C access failed with errno %d, %s\n",
> -				errno, strerror(errno));
> -		errno = 0;
> -	}
> -
> -	close(fd);
> -	return rc >= 0;
> -}
> -
> -static void format_hex_string(const unsigned char edid[static EDID_BLOCK_SIZE],
> -			      char buf[static EDID_BLOCK_SIZE * 5 + 1])
> -{
> -	for (int i = 0; i < EDID_BLOCK_SIZE; ++i)
> -		sprintf(buf+i*5, "0x%02x ", edid[i]);
> -}
> -
> -static bool is_mst_connector(int fd, uint32_t connector_id)
> -{
> -	return kmstest_get_property(fd, connector_id,
> -				    DRM_MODE_OBJECT_CONNECTOR,
> -				    "PATH", NULL, NULL, NULL);
> -}
> -
> -static void test_i2c(struct mode_set_data *data)
> -{
> -	bool edid_mistmach_i2c_vs_drm = false;
> -	igt_display_t display;
> -	igt_display_require(&display, drm_fd);
> -
> -	for (int i = 0; i < data->res->count_connectors; i++) {
> -		unsigned char *drm_edid = data->edids[i] ? data->edids[i]->data : NULL;
> -		unsigned char i2c_edid[EDID_BLOCK_SIZE] = {};
> -
> -		igt_output_t *output = igt_output_from_connector(&display,
> -								 data->connectors[i]);
> -		char *connector_name = (char *) igt_output_name(output);
> -
> -		bool got_i2c_edid = i2c_read_edid(connector_name, i2c_edid);
> -		bool got_drm_edid = drm_edid != NULL;
> -		bool is_vga = data->connectors[i]->connector_type == DRM_MODE_CONNECTOR_VGA;
> -
> -		bool edids_equal;
> -
> -		if (data->connectors[i]->connection != DRM_MODE_CONNECTED ||
> -		    is_mst_connector(drm_fd, data->connectors[i]->connector_id))
> -			continue;
> -
> -		/* We fail to detect some VGA monitors using our i2c method. If you look
> -		 * at the dmesg of these cases, you'll see the Kernel complaining about
> -		 * the EDID reading mostly FFs and then disabling bit-banging. Since we
> -		 * don't want to reimplement everything the Kernel does, let's just
> -		 * accept the fact that some VGA outputs won't be properly detected. */
> -		if (is_vga)
> -			continue;
> -
> -		if (!got_i2c_edid && !got_drm_edid)
> -			continue;
> -
> -		if (got_i2c_edid && got_drm_edid)
> -			edids_equal = (0 == memcmp(drm_edid, i2c_edid, EDID_BLOCK_SIZE));
> -		else
> -			edids_equal = false;
> -
> -
> -		if (!edids_equal) {
> -			char buf[5 * EDID_BLOCK_SIZE + 1];
> -			igt_critical("Detected EDID mismatch on connector %s\n",
> -				     connector_name);
> -
> -			if(got_i2c_edid)
> -				format_hex_string(i2c_edid, buf);
> -			else
> -				sprintf(buf, "NULL");
> -
> -			igt_critical("i2c: %s\n", buf);
> -
> -			if(got_drm_edid)
> -				format_hex_string(drm_edid, buf);
> -			else
> -				sprintf(buf, "NULL");
> -
> -			igt_critical("drm: %s\n", buf);
> -
> -			edid_mistmach_i2c_vs_drm = true;
> -		}
> -	}
> -	igt_fail_on_f(edid_mistmach_i2c_vs_drm,
> -			"There is an EDID mismatch between i2c and DRM!\n");
> -}
> -
>  static void setup_pc8(void)
>  {
>  	has_pc8 = false;
> @@ -1165,102 +753,6 @@ static void pc8_residency_subtest(void)
>  		     "PC8+ residency didn't stop with screen enabled.\n");
>  }
>  
> -static void modeset_subtest(enum screen_type type, int rounds, int wait_flags)
> -{
> -	int i;
> -
> -	if (wait_flags & WAIT_PC8_RES)
> -		igt_require(has_pc8);
> -
> -	if (wait_flags & WAIT_EXTRA)
> -		rounds /= 2;
> -
> -	for (i = 0; i < rounds; i++) {
> -		if (wait_flags & USE_DPMS)
> -			disable_all_screens_dpms(&ms_data);
> -		else
> -			disable_all_screens(&ms_data);
> -
> -		if (wait_flags & WAIT_STATUS)
> -			igt_assert(wait_for_suspended());
> -		if (wait_flags & WAIT_PC8_RES)
> -			igt_assert(pc8_plus_residency_changed(30));
> -		if (wait_flags & WAIT_EXTRA)
> -			sleep(5);
> -
> -		/* If we skip this line it's because the type of screen we want
> -		 * is not connected. */
> -		igt_require(enable_one_screen_with_type(&ms_data, type));
> -		if (wait_flags & WAIT_STATUS)
> -			igt_assert(wait_for_active());
> -		if (wait_flags & WAIT_PC8_RES)
> -			igt_assert(!pc8_plus_residency_changed(5));
> -		if (wait_flags & WAIT_EXTRA)
> -			sleep(5);
> -	}
> -}
> -
> -/* Test of the DRM resources reported by the IOCTLs are still the same. This
> - * ensures we still see the monitors with the same eyes. We get the EDIDs and
> - * compare them, which ensures we use DP AUX or GMBUS depending on what's
> - * connected. */
> -static void drm_resources_equal_subtest(void)
> -{
> -	struct compare_data pre_suspend, during_suspend, post_suspend;
> -
> -	enable_one_screen_and_wait(&ms_data);
> -	get_drm_info(&pre_suspend);
> -	igt_assert(wait_for_active());
> -
> -	disable_all_screens_and_wait(&ms_data);
> -	get_drm_info(&during_suspend);
> -	igt_assert(wait_for_suspended());
> -
> -	enable_one_screen_and_wait(&ms_data);
> -	get_drm_info(&post_suspend);
> -	igt_assert(wait_for_active());
> -
> -	assert_drm_infos_equal(&pre_suspend, &during_suspend);
> -	assert_drm_infos_equal(&pre_suspend, &post_suspend);
> -
> -	free_drm_info(&pre_suspend);
> -	free_drm_info(&during_suspend);
> -	free_drm_info(&post_suspend);
> -}
> -
> -static void i2c_subtest_check_environment(void)
> -{
> -	int i2c_dev_files = 0;
> -	DIR *dev_dir;
> -	struct dirent *dirent;
> -
> -	/* Make sure the /dev/i2c-* files exist. */
> -	igt_require(modprobe("i2c-dev") == 0);
> -
> -	dev_dir = opendir("/dev");
> -	igt_assert(dev_dir);
> -	while ((dirent = readdir(dev_dir))) {
> -		if (strncmp(dirent->d_name, "i2c-", 4) == 0)
> -			i2c_dev_files++;
> -	}
> -	closedir(dev_dir);
> -	igt_require(i2c_dev_files);
> -}
> -
> -/* Try to use raw I2C, which also needs interrupts. */
> -static void i2c_subtest(void)
> -{
> -	i2c_subtest_check_environment();
> -
> -	enable_one_screen_and_wait(&ms_data);
> -
> -	disable_all_screens_and_wait(&ms_data);
> -	test_i2c(&ms_data);
> -	igt_assert(wait_for_suspended());
> -
> -	enable_one_screen(&ms_data);
> -}
> -
>  struct read_entry_elapsed {
>  	uint64_t elapsed;
>  	char *path;
> @@ -1875,27 +1367,6 @@ static bool device_in_pci_d3(struct pci_device *pci_dev)
>  	return (val & 0x3) == 0x3;
>  }
>  
> -static void pci_d3_state_subtest(void)
> -{
> -	struct pci_device *pci_dev, *bridge_pci_dev;
> -
> -	igt_require(has_runtime_pm);
> -
> -	pci_dev = igt_device_get_pci_device(drm_fd);
> -	bridge_pci_dev = pci_device_get_parent_bridge(pci_dev);
> -
> -	disable_all_screens_and_wait(&ms_data);
> -	igt_assert(igt_wait(device_in_pci_d3(pci_dev), 2000, 100));
> -
> -	if (gem_has_lmem(drm_fd))
> -		igt_require_f(pci_device_has_kernel_driver(bridge_pci_dev),
> -			      "pci bridge device does not bind with pcieport driver\n");
> -
> -	enable_one_screen_or_forcewake_get_and_wait(&ms_data);
> -	igt_assert(!device_in_pci_d3(pci_dev));
> -	forcewake_put(&ms_data);
> -}
> -
>  __noreturn static void stay_subtest(void)
>  {
>  	disable_all_screens_and_wait(&ms_data);
> @@ -1951,287 +1422,6 @@ static void system_suspend_execbuf_subtest(void)
>  	gem_close(drm_fd, handle);
>  }
>  
> -static void system_suspend_modeset_subtest(void)
> -{
> -	disable_all_screens_and_wait(&ms_data);
> -	igt_system_suspend_autoresume(SUSPEND_STATE_MEM, SUSPEND_TEST_NONE);
> -	igt_assert(wait_for_suspended());
> -
> -	enable_one_screen_and_wait(&ms_data);
> -	disable_all_screens_and_wait(&ms_data);
> -}
> -
> -/* Enable a screen, activate DPMS, then do a modeset. At some point our driver
> - * produced WARNs on this case. */
> -static void dpms_mode_unset_subtest(enum screen_type type)
> -{
> -	disable_all_screens_and_wait(&ms_data);
> -
> -	igt_require(enable_one_screen_with_type(&ms_data, type));
> -	igt_assert(wait_for_active());
> -
> -	disable_all_screens_dpms(&ms_data);
> -	igt_assert(wait_for_suspended());
> -
> -	disable_all_screens_and_wait(&ms_data);
> -}
> -
> -static void fill_igt_fb(struct igt_fb *fb, uint32_t color)
> -{
> -	int i;
> -	uint32_t *ptr;
> -
> -	ptr = gem_mmap__device_coherent(drm_fd, fb->gem_handle, 0, fb->size, PROT_WRITE);
> -	for (i = 0; i < fb->size/sizeof(uint32_t); i++)
> -		ptr[i] = color;
> -	igt_assert(munmap(ptr, fb->size) == 0);
> -}
> -
> -/* At some point, this test triggered WARNs in the Kernel. */
> -static void cursor_subtest(bool dpms)
> -{
> -	int rc;
> -	struct igt_fb cursor_fb1, cursor_fb2, cursor_fb3;
> -	uint32_t crtc_id;
> -
> -	disable_all_screens_and_wait(&ms_data);
> -
> -	igt_require(default_mode_params);
> -	crtc_id = default_mode_params->crtc_id;
> -
> -	igt_create_fb(drm_fd, 64, 64, DRM_FORMAT_ARGB8888,
> -		      DRM_FORMAT_MOD_LINEAR, &cursor_fb1);
> -	igt_create_fb(drm_fd, 64, 64, DRM_FORMAT_ARGB8888,
> -		      DRM_FORMAT_MOD_LINEAR, &cursor_fb2);
> -	igt_create_fb(drm_fd, 64, 64, DRM_FORMAT_XRGB8888,
> -		      I915_FORMAT_MOD_X_TILED, &cursor_fb3);
> -
> -	fill_igt_fb(&cursor_fb1, 0xFF00FFFF);
> -	fill_igt_fb(&cursor_fb2, 0xFF00FF00);
> -	fill_igt_fb(&cursor_fb3, 0xFFFF0000);
> -
> -	set_mode_for_params_and_wait(default_mode_params);
> -
> -	rc = drmModeSetCursor(drm_fd, crtc_id, cursor_fb1.gem_handle,
> -			      cursor_fb1.width, cursor_fb1.height);
> -	igt_assert_eq(rc, 0);
> -	rc = drmModeMoveCursor(drm_fd, crtc_id, 0, 0);
> -	igt_assert_eq(rc, 0);
> -	igt_assert(wait_for_active());
> -
> -	disable_or_dpms_all_screens_and_wait(&ms_data, dpms);
> -
> -	/* First, just move the cursor. */
> -	rc = drmModeMoveCursor(drm_fd, crtc_id, 1, 1);
> -	igt_assert_eq(rc, 0);
> -	igt_assert(wait_for_suspended());
> -
> -	/* Then unset it, and set a new one. */
> -	rc = drmModeSetCursor(drm_fd, crtc_id, 0, 0, 0);
> -	igt_assert_eq(rc, 0);
> -	igt_assert(wait_for_suspended());
> -
> -	rc = drmModeSetCursor(drm_fd, crtc_id, cursor_fb2.gem_handle,
> -			      cursor_fb1.width, cursor_fb2.height);
> -	igt_assert_eq(rc, 0);
> -	igt_assert(wait_for_suspended());
> -
> -	/* Move the new cursor. */
> -	rc = drmModeMoveCursor(drm_fd, crtc_id, 2, 2);
> -	igt_assert_eq(rc, 0);
> -	igt_assert(wait_for_suspended());
> -
> -	/* Now set a new one without unsetting the previous one. */
> -	rc = drmModeSetCursor(drm_fd, crtc_id, cursor_fb1.gem_handle,
> -			      cursor_fb1.width, cursor_fb1.height);
> -	igt_assert_eq(rc, 0);
> -	igt_assert(wait_for_suspended());
> -
> -	/* Cursor 3 was created with tiling and painted with a GTT mmap, so
> -	 * hopefully it has some fences around it. */
> -	rc = drmModeRmFB(drm_fd, cursor_fb3.fb_id);
> -	igt_assert_eq(rc, 0);
> -	__gem_set_tiling(drm_fd, cursor_fb3.gem_handle, false, cursor_fb3.strides[0]);
> -	igt_assert(wait_for_suspended());
> -
> -	rc = drmModeSetCursor(drm_fd, crtc_id, cursor_fb3.gem_handle,
> -			      cursor_fb3.width, cursor_fb3.height);
> -	igt_assert_eq(rc, 0);
> -	igt_assert(wait_for_suspended());
> -
> -	/* Make sure nothing remains for the other tests. */
> -	rc = drmModeSetCursor(drm_fd, crtc_id, 0, 0, 0);
> -	igt_assert_eq(rc, 0);
> -	igt_assert(wait_for_suspended());
> -}
> -
> -static enum plane_type get_plane_type(uint32_t plane_id)
> -{
> -	int i;
> -	bool found;
> -	uint64_t prop_value;
> -	drmModePropertyPtr prop;
> -	const char *enum_name = NULL;
> -	enum plane_type type;
> -
> -	found = kmstest_get_property(drm_fd, plane_id, DRM_MODE_OBJECT_PLANE,
> -				     "type", NULL, &prop_value, &prop);
> -	igt_assert(found);
> -
> -	igt_assert(prop->flags & DRM_MODE_PROP_ENUM);
> -	igt_assert(prop_value < prop->count_enums);
> -
> -	for (i = 0; i < prop->count_enums; i++) {
> -		if (prop->enums[i].value == prop_value) {
> -			enum_name = prop->enums[i].name;
> -			break;
> -		}
> -	}
> -	igt_assert(enum_name);
> -
> -	if (strcmp(enum_name, "Overlay") == 0)
> -		type = PLANE_OVERLAY;
> -	else if (strcmp(enum_name, "Primary") == 0)
> -		type = PLANE_PRIMARY;
> -	else if (strcmp(enum_name, "Cursor") == 0)
> -		type = PLANE_CURSOR;
> -	else
> -		igt_assert(0);
> -
> -	drmModeFreeProperty(prop);
> -
> -	return type;
> -}
> -
> -static void test_one_plane(bool dpms, uint32_t plane_id,
> -			   enum plane_type plane_type)
> -{
> -	int rc;
> -	uint32_t plane_format, plane_w, plane_h;
> -	uint32_t crtc_id;
> -	struct igt_fb plane_fb1, plane_fb2;
> -	int32_t crtc_x = 0, crtc_y = 0;
> -	uint64_t modifier;
> -
> -	disable_all_screens_and_wait(&ms_data);
> -
> -	crtc_id = default_mode_params->crtc_id;
> -
> -	switch (plane_type) {
> -	case PLANE_OVERLAY:
> -		plane_format = DRM_FORMAT_XRGB8888;
> -		plane_w = 64;
> -		plane_h = 64;
> -		modifier = I915_FORMAT_MOD_X_TILED;
> -		break;
> -	case PLANE_PRIMARY:
> -		plane_format = DRM_FORMAT_XRGB8888;
> -		plane_w = default_mode_params->mode->hdisplay;
> -		plane_h = default_mode_params->mode->vdisplay;
> -		modifier = I915_FORMAT_MOD_X_TILED;
> -		break;
> -	case PLANE_CURSOR:
> -		plane_format = DRM_FORMAT_ARGB8888;
> -		plane_w = 64;
> -		plane_h = 64;
> -		modifier = DRM_FORMAT_MOD_LINEAR;
> -		break;
> -	default:
> -		igt_assert(0);
> -		break;
> -	}
> -
> -	igt_create_fb(drm_fd, plane_w, plane_h, plane_format, modifier,
> -		      &plane_fb1);
> -	igt_create_fb(drm_fd, plane_w, plane_h, plane_format, modifier,
> -		      &plane_fb2);
> -	fill_igt_fb(&plane_fb1, 0xFF00FFFF);
> -	fill_igt_fb(&plane_fb2, 0xFF00FF00);
> -
> -	set_mode_for_params_and_wait(default_mode_params);
> -
> -	rc = drmModeSetPlane(drm_fd, plane_id, crtc_id, plane_fb1.fb_id, 0,
> -			     0, 0, plane_fb1.width, plane_fb1.height,
> -			     0 << 16, 0 << 16, plane_fb1.width << 16,
> -			     plane_fb1.height << 16);
> -	igt_assert_eq(rc, 0);
> -
> -	disable_or_dpms_all_screens_and_wait(&ms_data, dpms);
> -
> -	/* Just move the plane around. */
> -	if (plane_type != PLANE_PRIMARY) {
> -		crtc_x++;
> -		crtc_y++;
> -	}
> -	rc = drmModeSetPlane(drm_fd, plane_id, crtc_id, plane_fb1.fb_id, 0,
> -			     crtc_x, crtc_y, plane_fb1.width, plane_fb1.height,
> -			     0 << 16, 0 << 16, plane_fb1.width << 16,
> -			     plane_fb1.height << 16);
> -	igt_assert_eq(rc, 0);
> -	igt_assert(wait_for_suspended());
> -
> -	/* Unset, then change the plane. */
> -	rc = drmModeSetPlane(drm_fd, plane_id, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
> -	igt_assert_eq(rc, 0);
> -	igt_assert(wait_for_suspended());
> -
> -	rc = drmModeSetPlane(drm_fd, plane_id, crtc_id, plane_fb2.fb_id, 0,
> -			     crtc_x, crtc_y, plane_fb2.width, plane_fb2.height,
> -			     0 << 16, 0 << 16, plane_fb2.width << 16,
> -			     plane_fb2.height << 16);
> -	igt_assert_eq(rc, 0);
> -	igt_assert(wait_for_suspended());
> -
> -	/* Now change the plane without unsetting first. */
> -	rc = drmModeSetPlane(drm_fd, plane_id, crtc_id, plane_fb1.fb_id, 0,
> -			     crtc_x, crtc_y, plane_fb1.width, plane_fb1.height,
> -			     0 << 16, 0 << 16, plane_fb1.width << 16,
> -			     plane_fb1.height << 16);
> -	igt_assert_eq(rc, 0);
> -	igt_assert(wait_for_suspended());
> -
> -	/* Make sure nothing remains for the other tests. */
> -	rc = drmModeSetPlane(drm_fd, plane_id, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
> -	igt_assert_eq(rc, 0);
> -	igt_assert(wait_for_suspended());
> -}
> -
> -/* This one also triggered WARNs on our driver at some point in time. */
> -static void planes_subtest(bool universal, bool dpms)
> -{
> -	int i, crtc_idx;
> -	drmModePlaneResPtr planes;
> -
> -	igt_require(default_mode_params);
> -	crtc_idx = kmstest_get_crtc_idx(ms_data.res,
> -					default_mode_params->crtc_id);
> -
> -	igt_assert_eq(drmSetClientCap(drm_fd, DRM_CLIENT_CAP_UNIVERSAL_PLANES,
> -				      universal), 0);
> -
> -	planes = drmModeGetPlaneResources(drm_fd);
> -	for (i = 0; i < planes->count_planes; i++) {
> -		drmModePlanePtr plane;
> -
> -		plane = drmModeGetPlane(drm_fd, planes->planes[i]);
> -		igt_assert(plane);
> -
> -		if (plane->possible_crtcs & (1 << crtc_idx)) {
> -			enum plane_type type;
> -
> -			type = universal ? get_plane_type(plane->plane_id) :
> -					   PLANE_OVERLAY;
> -			igt_dynamic_f("plane-%d", plane->plane_id)
> -				test_one_plane(dpms, plane->plane_id, type);
> -		}
> -		drmModeFreePlane(plane);
> -	}
> -	drmModeFreePlaneResources(planes);
> -
> -	igt_assert_eq(drmSetClientCap(drm_fd, DRM_CLIENT_CAP_UNIVERSAL_PLANES,
> -				      1), 0);
> -}
> -
>  static void pm_test_tiling(void)
>  {
>  	uint32_t *handles;
> @@ -2436,22 +1626,6 @@ igt_main_args("", long_options, help_str, opt_handler, NULL)
>  		igt_subtest("stay")
>  			stay_subtest();
>  
> -	/* Essential things */
> -	igt_subtest("drm-resources-equal")
> -		drm_resources_equal_subtest();
> -	igt_subtest("basic-pci-d3-state")
> -		pci_d3_state_subtest();
> -
> -	/* Basic modeset */
> -	igt_subtest("modeset-lpsp")
> -		modeset_subtest(SCREEN_TYPE_LPSP, 1, WAIT_STATUS);
> -	igt_subtest("modeset-non-lpsp")
> -		modeset_subtest(SCREEN_TYPE_NON_LPSP, 1, WAIT_STATUS);
> -	igt_subtest("dpms-lpsp")
> -		modeset_subtest(SCREEN_TYPE_LPSP, 1, WAIT_STATUS | USE_DPMS);
> -	igt_subtest("dpms-non-lpsp")
> -		modeset_subtest(SCREEN_TYPE_NON_LPSP, 1, WAIT_STATUS | USE_DPMS);
> -
>  	/* GEM */
>  	igt_subtest_with_dynamic("gem-mmap-type") {
>  		for_each_mmap_offset_type(drm_fd, t) {
> @@ -2477,25 +1651,9 @@ igt_main_args("", long_options, help_str, opt_handler, NULL)
>  		gem_evict_pwrite_subtest();
>  	}
>  
> -	/* Planes and cursors */
> -	igt_subtest("cursor")
> -		cursor_subtest(false);
> -	igt_subtest("cursor-dpms")
> -		cursor_subtest(true);
> -	igt_subtest_with_dynamic("legacy-planes")
> -		planes_subtest(false, false);
> -	igt_subtest_with_dynamic("legacy-planes-dpms")
> -		planes_subtest(false, true);
> -	igt_subtest_with_dynamic("universal-planes")
> -		planes_subtest(true, false);
> -	igt_subtest_with_dynamic("universal-planes-dpms")
> -		planes_subtest(true, true);
> -
>  	/* Misc */
>  	igt_subtest("reg-read-ioctl")
>  		reg_read_ioctl_subtest();
> -	igt_subtest("i2c")
> -		i2c_subtest();
>  	igt_subtest("pc8-residency")
>  		pc8_residency_subtest();
>  	igt_subtest("debugfs-read")
> @@ -2504,33 +1662,10 @@ igt_main_args("", long_options, help_str, opt_handler, NULL)
>  		debugfs_forcewake_user_subtest();
>  	igt_subtest("sysfs-read")
>  		sysfs_read_subtest();
> -	igt_subtest("dpms-mode-unset-lpsp")
> -		dpms_mode_unset_subtest(SCREEN_TYPE_LPSP);
> -	igt_subtest("dpms-mode-unset-non-lpsp")
> -		dpms_mode_unset_subtest(SCREEN_TYPE_NON_LPSP);
>  	igt_subtest("fences") {
>  		gem_require_mappable_ggtt(drm_fd);
>  		fences_subtest(false);
>  	}
> -	igt_subtest("fences-dpms") {
> -		gem_require_mappable_ggtt(drm_fd);
> -		fences_subtest(true);
> -	}
> -
> -	/* Modeset stress */
> -	igt_subtest("modeset-lpsp-stress")
> -		modeset_subtest(SCREEN_TYPE_LPSP, rounds, WAIT_STATUS);
> -	igt_subtest("modeset-non-lpsp-stress")
> -		modeset_subtest(SCREEN_TYPE_NON_LPSP, rounds, WAIT_STATUS);
> -	igt_subtest("modeset-lpsp-stress-no-wait")
> -		modeset_subtest(SCREEN_TYPE_LPSP, rounds, DONT_WAIT);
> -	igt_subtest("modeset-non-lpsp-stress-no-wait")
> -		modeset_subtest(SCREEN_TYPE_NON_LPSP, rounds, DONT_WAIT);
> -	igt_subtest("modeset-pc8-residency-stress")
> -		modeset_subtest(SCREEN_TYPE_ANY, rounds, WAIT_PC8_RES);
> -	igt_subtest("modeset-stress-extra-wait")
> -		modeset_subtest(SCREEN_TYPE_ANY, rounds,
> -				WAIT_STATUS | WAIT_EXTRA);
>  
>  	/* System suspend */
>  	igt_subtest("system-suspend-devices")
> @@ -2539,8 +1674,6 @@ igt_main_args("", long_options, help_str, opt_handler, NULL)
>  		system_suspend_subtest(SUSPEND_STATE_MEM, SUSPEND_TEST_NONE);
>  	igt_subtest("system-suspend-execbuf")
>  		system_suspend_execbuf_subtest();
> -	igt_subtest("system-suspend-modeset")
> -		system_suspend_modeset_subtest();
>  	igt_subtest("system-hibernate-devices")
>  		system_suspend_subtest(SUSPEND_STATE_DISK,
>  				       SUSPEND_TEST_DEVICES);
> @@ -2600,8 +1733,6 @@ igt_main_args("", long_options, help_str, opt_handler, NULL)
>  		igt_assert(setup_environment(true));
>  		pci_dev = igt_device_get_pci_device(drm_fd);
>  		igt_assert(igt_wait(device_in_pci_d3(pci_dev), 2000, 100));
> -		if (enable_one_screen_with_type(&ms_data, SCREEN_TYPE_ANY))
> -			drm_resources_equal_subtest();
>  		teardown_environment(true);
>  
>  		/* Remove our mmio_debugging module */
> diff --git a/tests/i915/kms_pm_rpm.c b/tests/i915/kms_pm_rpm.c
> new file mode 100644
> index 000000000..547f2e19c
> --- /dev/null
> +++ b/tests/i915/kms_pm_rpm.c
> @@ -0,0 +1,1665 @@
> +/* SPDX-License-Identifier: MIT */
-- ^^ ---------------------------- ^^

Use '//' in .c files, please also check your patches with perl
script checkpatch.pl from linux kernel, there are other style
errors.

> +/*
> + * Copyright © 2023 Intel Corporation
> + *
> + * Permission is hereby granted, free of charge, to any person obtaining a

Delete this text, it is replaced by SPDX.

> + * copy of this software and associated documentation files (the "Software"),
> + * to deal in the Software without restriction, including without limitation
> + * the rights to use, copy, modify, merge, publish, distribute, sublicense,
> + * and/or sell copies of the Software, and to permit persons to whom the
> + * Software is furnished to do so, subject to the following conditions:
> + *
> + * The above copyright notice and this permission notice (including the next
> + * paragraph) shall be included in all copies or substantial portions of the
> + * Software.
> + *
> + * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
> + * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
> + * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
> + * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
> + * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
> + * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS
> + * IN THE SOFTWARE.
> + *
> + * Authors:
> + *    Paulo Zanoni <paulo.r.zanoni@intel.com>
> + *    Bhanuprakash Modem <bhanuprakash.modem@intel.com>
> + *
> + */
> +
> +#include "config.h"

Move this after sys includes.

> +
> +#include <stdio.h>
> +#include <stdint.h>
> +#include <stdbool.h>
> +#include <string.h>
> +#include <ftw.h>
------------ ^
Sort alphabetically.

> +
> +#include <unistd.h>
> +#include <fcntl.h>
------------ ^
> +#include <dirent.h>
------------ ^
> +#include <sys/ioctl.h>
> +#include <sys/mman.h>
> +#include <sys/types.h>
> +#include <sys/stat.h>

Please sort system includes, also place TEST documentation
after includes (so we will not place docs in a middle).

> +/**
> + * TEST: kms pm rpm
> + * Category: Display
> + * Description: Test to validate Runtime PM
> + *
> + * SUBTEST: basic-pci-d3-state
> + * Description: Validate PCI device D3 state enter-exit scenario using runtime PM
> + * Driver requirement: i915
> + * Functionality: pm_rpm
> + * Mega feature: Display Power
> + * Run type: FULL
> + * Test category: functionality test
> + *
> + * SUBTEST: cursor
> + * Description: Validate cursor movements along with suspends using runtime PM
> + * Driver requirement: i915
> + * Functionality: cursor, pm_rpm, suspend
> + * Mega feature: Display Power
> + * Run type: FULL
> + * Test category: functionality test
> + *
> + * SUBTEST: cursor-dpms
> + * Description: Validate cursor movements along with dpms using runtime PM
> + * Driver requirement: i915
> + * Functionality: cursor, dpms, pm_rpm
> + * Mega feature: Display Power
> + * Run type: FULL
> + * Test category: functionality test
> + *
> + * SUBTEST: dpms-lpsp
> + * Description: Validate basic modeset with dpms on lpsp screen using runtime PM
> + * Driver requirement: i915
> + * Functionality: dpms, pm_rpm
> + * Mega feature: Display Power
> + * Run type: FULL
> + * Test category: functionality test
> + *
> + * SUBTEST: dpms-mode-unset-lpsp
> + * Description: Validate basic modeset (negative) with dpms on lpsp screen using runtime PM
> + * Driver requirement: i915
> + * Functionality: dpms, pm_rpm
> + * Mega feature: Display Power
> + * Run type: FULL
> + * Test category: functionality test
> + *
> + * SUBTEST: dpms-mode-unset-non-lpsp
> + * Description: Validate basic modeset (negative) with dpms on non-lpsp screen using runtime PM
> + * Driver requirement: i915
> + * Functionality: dpms, pm_rpm
> + * Mega feature: Display Power
> + * Run type: FULL
> + * Test category: functionality test
> + *
> + * SUBTEST: dpms-non-lpsp
> + * Description: Validate basic modeset with dpms on non-lpsp screen using runtime PM
> + * Driver requirement: i915
> + * Functionality: dpms, pm_rpm
> + * Mega feature: Display Power
> + * Run type: FULL
> + * Test category: functionality test
> + *
> + * SUBTEST: drm-resources-equal
> + * Description: Validate the DRM resources reported by the IOCTLs are still the same.
> + * Driver requirement: i915
> + * Functionality: pm_rpm
> + * Mega feature: Display Power
> + * Run type: FULL
> + * Test category: functionality test
> + *
> + * SUBTEST: fences-dpms
> + * Description: Sanity test for drm fences with dpms.
> + * Driver requirement: i915
> + * Functionality: dpms, pm_rpm
> + * Mega feature: Display Power
> + * Run type: FULL
> + * Test category: functionality test
> + *
> + * SUBTEST: i2c
> + * Description: Validate exposed edids using raw I2C read method.
> + * Driver requirement: i915
> + * Functionality: pm_rpm
> + * Mega feature: Display Power
> + * Run type: FULL
> + * Test category: functionality test
> + *
> + * SUBTEST: legacy-planes
> + * Description: Validate legacy plane (set/unset/change).
> + * Driver requirement: i915
> + * Functionality: pm_rpm, plane
> + * Mega feature: Display Power
> + * Run type: FULL
> + * Test category: functionality test
> + *
> + * SUBTEST: legacy-planes-dpms
> + * Description: Validate legacy plane (set/unset/change) with dpms.
> + * Driver requirement: i915
> + * Functionality: pm_rpm, plane
> + * Mega feature: Display Power
> + * Run type: FULL
> + * Test category: functionality test
> + *
> + * SUBTEST: modeset-lpsp
> + * Description: Validate basic modeset on lpsp screen using runtime PM
> + * Driver requirement: i915
> + * Functionality: pm_rpm
> + * Mega feature: Display Power
> + * Run type: FULL
> + * Test category: functionality test
> + *
> + * SUBTEST: modeset-lpsp-stress
> + * Description: Stress test with modeset on lpsp screen using runtime PM
> + * Driver requirement: i915
> + * Functionality: pm_rpm
> + * Mega feature: Display Power
> + * Run type: FULL
> + * Test category: functionality test
> + *
> + * SUBTEST: modeset-lpsp-stress-no-wait
> + * Description: Stress test with modeset (no wait)on lpsp screen using runtime PM
> + * Driver requirement: i915
> + * Functionality: pm_rpm
> + * Mega feature: Display Power
> + * Run type: FULL
> + * Test category: functionality test
> + *
> + * SUBTEST: modeset-non-lpsp
> + * Description: Validate basic modeset on non-lpsp screen using runtime PM
> + * Driver requirement: i915
> + * Functionality: pm_rpm
> + * Mega feature: Display Power
> + * Run type: FULL
> + * Test category: functionality test
> + *
> + * SUBTEST: modeset-non-lpsp-stress
> + * Description: Stress test with modeset on non-lpsp screen using runtime PM
> + * Driver requirement: i915
> + * Functionality: pm_rpm
> + * Mega feature: Display Power
> + * Run type: FULL
> + * Test category: functionality test
> + *
> + * SUBTEST: modeset-non-lpsp-stress-no-wait
> + * Description: Stress test with modeset (no wait) on non-lpsp screen using runtime PM
> + * Driver requirement: i915
> + * Functionality: pm_rpm
> + * Mega feature: Display Power
> + * Run type: FULL
> + * Test category: functionality test
> + *
> + * SUBTEST: modeset-pc8-residency-stress
> + * Description: Stress test with modeset (pc8 residency) using runtime PM
> + * Driver requirement: i915
> + * Functionality: pm_rpm
> + * Mega feature: Display Power
> + * Run type: FULL
> + * Test category: functionality test
> + *
> + * SUBTEST: modeset-stress-extra-wait
> + * Description: Stress test with modeset (extra wait) using runtime PM
> + * Driver requirement: i915
> + * Functionality: pm_rpm
> + * Mega feature: Display Power
> + * Run type: FULL
> + * Test category: functionality test
> + *
> + * SUBTEST: system-suspend-modeset
> + * Description: Validate basic modeset with suspend
> + * Driver requirement: i915
> + * Functionality: pm_rpm, suspend
> + * Mega feature: Display Power
> + * Run type: FULL
> + * Test category: functionality test
> + *
> + * SUBTEST: universal-planes
> + * Description: Validate universal plane (set/unset/change).
> + * Driver requirement: i915
> + * Functionality: pm_rpm, plane
> + * Mega feature: Display Power
> + * Run type: FULL
> + * Test category: functionality test
> + *
> + * SUBTEST: universal-planes-dpms
> + * Description: Validate universal plane (set/unset/change) with dpms.
> + * Driver requirement: i915
> + * Functionality: pm_rpm, plane
> + * Mega feature: Display Power
> + * Run type: FULL
> + * Test category: functionality test
> + */
> +
> +#if defined(__linux__)
> +#include <linux/i2c.h>
> +#include <linux/i2c-dev.h>
> +#elif defined(__FreeBSD__)
> +#include <dev/iicbus/iic.h>
> +#define	addr	slave
> +#endif
> +
> +#include <drm.h>
-------------^
Sort it.

> +
> +#include "i915/gem.h"
> +#include "i915/gem_create.h"
> +#include "igt.h"
> +#include "igt_kmod.h"
> +#include "igt_sysfs.h"
> +#include "igt_debugfs.h"
---------------- ^
> +#include "igt_device.h"
---------------- ^
> +#include "igt_edid.h"
---------------- ^

Regards,
Kamil

> +#include "intel_blt.h"
> +
> +#define MSR_PC8_RES	0x630
> +#define MSR_PC9_RES	0x631
> +#define MSR_PC10_RES	0x632
> +
> +#define MAX_CONNECTORS	32
> +#define MAX_ENCODERS	32
> +#define MAX_CRTCS	16
> +
> +#define WIDTH 64
> +#define HEIGHT 64
> +#define STRIDE (WIDTH)
> +#define SIZE (HEIGHT * STRIDE)
> +
> +enum pc8_status {
> +	PC8_ENABLED,
> +	PC8_DISABLED
> +};
> +
> +enum screen_type {
> +	SCREEN_TYPE_LPSP,
> +	SCREEN_TYPE_NON_LPSP,
> +	SCREEN_TYPE_ANY,
> +};
> +
> +enum plane_type {
> +	PLANE_OVERLAY,
> +	PLANE_PRIMARY,
> +	PLANE_CURSOR,
> +};
> +
> +/* Wait flags */
> +#define DONT_WAIT	0
> +#define WAIT_STATUS	1
> +#define WAIT_PC8_RES	2
> +#define WAIT_EXTRA	4
> +#define USE_DPMS	8
> +
> +int drm_fd, msr_fd, pc8_status_fd;
> +int debugfs;
> +bool has_runtime_pm, has_pc8;
> +struct mode_set_data ms_data;
> +
> +/* Stuff used when creating FBs and mode setting. */
> +struct mode_set_data {
> +	drmModeResPtr res;
> +	drmModeConnectorPtr connectors[MAX_CONNECTORS];
> +	drmModePropertyBlobPtr edids[MAX_CONNECTORS];
> +	igt_display_t display;
> +
> +	uint32_t devid;
> +	int fw_fd;
> +};
> +
> +/* Stuff we query at different times so we can compare. */
> +struct compare_data {
> +	drmModeResPtr res;
> +	drmModeEncoderPtr encoders[MAX_ENCODERS];
> +	drmModeConnectorPtr connectors[MAX_CONNECTORS];
> +	drmModeCrtcPtr crtcs[MAX_CRTCS];
> +	drmModePropertyBlobPtr edids[MAX_CONNECTORS];
> +};
> +
> +struct modeset_params {
> +	uint32_t crtc_id;
> +	uint32_t connector_id;
> +	struct igt_fb fb;
> +	drmModeModeInfoPtr mode;
> +};
> +
> +struct data_t {
> +	int width;
> +	int height;
> +	uint32_t region;
> +};
> +
> +struct modeset_params lpsp_mode_params;
> +struct modeset_params non_lpsp_mode_params;
> +struct modeset_params *default_mode_params;
> +
> +static int modprobe(const char *driver)
> +{
> +	return igt_kmod_load(driver, NULL);
> +}
> +
> +/* If the read fails, then the machine doesn't support PC8+ residencies. */
> +static bool supports_pc8_plus_residencies(void)
> +{
> +	int rc;
> +	uint64_t val;
> +
> +	rc = pread(msr_fd, &val, sizeof(uint64_t), MSR_PC8_RES);
> +	if (rc != sizeof(val))
> +		return false;
> +	rc = pread(msr_fd, &val, sizeof(uint64_t), MSR_PC9_RES);
> +	if (rc != sizeof(val))
> +		return false;
> +	rc = pread(msr_fd, &val, sizeof(uint64_t), MSR_PC10_RES);
> +	if (rc != sizeof(val))
> +		return false;
> +
> +	return igt_pm_pc8_plus_residencies_enabled(msr_fd);
> +}
> +
> +static uint64_t get_residency(uint32_t type)
> +{
> +	int rc;
> +	uint64_t ret;
> +
> +	rc = pread(msr_fd, &ret, sizeof(uint64_t), type);
> +	igt_assert(rc == sizeof(ret));
> +
> +	return ret;
> +}
> +
> +static bool pc8_plus_residency_changed(unsigned int timeout_sec)
> +{
> +	uint64_t res_pc8, res_pc9, res_pc10;
> +
> +	res_pc8 = get_residency(MSR_PC8_RES);
> +	res_pc9 = get_residency(MSR_PC9_RES);
> +	res_pc10 = get_residency(MSR_PC10_RES);
> +
> +	return igt_wait(res_pc8 != get_residency(MSR_PC8_RES) ||
> +			res_pc9 != get_residency(MSR_PC9_RES) ||
> +			res_pc10 != get_residency(MSR_PC10_RES),
> +			timeout_sec * 1000, 100);
> +}
> +
> +static enum pc8_status get_pc8_status(void)
> +{
> +	ssize_t n_read;
> +	char buf[150]; /* The whole file has less than 100 chars. */
> +
> +	lseek(pc8_status_fd, 0, SEEK_SET);
> +	n_read = read(pc8_status_fd, buf, ARRAY_SIZE(buf));
> +	igt_assert(n_read >= 0);
> +	buf[n_read] = '\0';
> +
> +	if (strstr(buf, "\nEnabled: yes\n"))
> +		return PC8_ENABLED;
> +	else
> +		return PC8_DISABLED;
> +}
> +
> +static bool wait_for_pc8_status(enum pc8_status status)
> +{
> +	return igt_wait(get_pc8_status() == status, 10000, 100);
> +}
> +
> +static bool wait_for_suspended(void)
> +{
> +	if (has_pc8 && !has_runtime_pm) {
> +		return wait_for_pc8_status(PC8_ENABLED);
> +	} else {
> +		bool suspended = igt_wait_for_pm_status(IGT_RUNTIME_PM_STATUS_SUSPENDED);
> +
> +		if (!suspended) {
> +			/* Dump runtime pm status even if test skips */
> +			__igt_debugfs_dump(drm_fd, "i915_runtime_pm_status", IGT_LOG_INFO);
> +		}
> +
> +		return suspended;
> +	}
> +}
> +
> +static bool wait_for_active(void)
> +{
> +	if (has_pc8 && !has_runtime_pm)
> +		return wait_for_pc8_status(PC8_DISABLED);
> +	else
> +		return igt_wait_for_pm_status(IGT_RUNTIME_PM_STATUS_ACTIVE);
> +}
> +
> +static void disable_all_screens_dpms(struct mode_set_data *data)
> +{
> +	if (!data->res)
> +		return;
> +
> +	for (int i = 0; i < data->res->count_connectors; i++) {
> +		drmModeConnectorPtr c = data->connectors[i];
> +
> +		kmstest_set_connector_dpms(drm_fd, c, DRM_MODE_DPMS_OFF);
> +	}
> +}
> +
> +static void disable_all_screens(struct mode_set_data *data)
> +{
> +	if (data->res)
> +		kmstest_unset_all_crtcs(drm_fd, data->res);
> +}
> +
> +#define disable_all_screens_and_wait(data) do { \
> +	disable_all_screens(data); \
> +	igt_assert(wait_for_suspended()); \
> +} while (0)
> +
> +static void disable_or_dpms_all_screens(struct mode_set_data *data, bool dpms)
> +{
> +	if (dpms)
> +		disable_all_screens_dpms(&ms_data);
> +	else
> +		disable_all_screens(&ms_data);
> +}
> +
> +#define disable_or_dpms_all_screens_and_wait(data, dpms) do { \
> +	disable_or_dpms_all_screens((data), (dpms)); \
> +	igt_assert(wait_for_suspended()); \
> +} while (0)
> +
> +static bool init_modeset_params_for_type(struct mode_set_data *data,
> +					 struct modeset_params *params,
> +					 enum screen_type type)
> +{
> +	drmModeConnectorPtr connector = NULL;
> +	drmModeModeInfoPtr mode = NULL;
> +	igt_output_t *output = NULL;
> +	igt_display_t *display = &data->display;
> +
> +	if (!data->res || !display)
> +		return false;
> +
> +	for_each_connected_output(display, output) {
> +		drmModeConnectorPtr c = output->config.connector;
> +
> +		if (type == SCREEN_TYPE_LPSP &&
> +		     !i915_output_is_lpsp_capable(drm_fd, output))
> +			continue;
> +
> +		if (type == SCREEN_TYPE_NON_LPSP &&
> +		    i915_output_is_lpsp_capable(drm_fd, output))
> +			continue;
> +
> +		connector = c;
> +		mode = igt_output_get_mode(output);
> +		break;
> +	}
> +
> +	if (!connector || !mode)
> +		return false;
> +
> +	igt_create_pattern_fb(drm_fd, mode->hdisplay, mode->vdisplay,
> +			      DRM_FORMAT_XRGB8888, DRM_FORMAT_MOD_LINEAR,
> +			      &params->fb);
> +
> +	params->crtc_id = kmstest_find_crtc_for_connector(drm_fd, data->res,
> +							  connector, 0);
> +	params->connector_id = connector->connector_id;
> +	params->mode = mode;
> +
> +	return true;
> +}
> +
> +static void init_modeset_cached_params(struct mode_set_data *data)
> +{
> +	bool lpsp, non_lpsp;
> +
> +	lpsp = init_modeset_params_for_type(data, &lpsp_mode_params,
> +					    SCREEN_TYPE_LPSP);
> +	non_lpsp = init_modeset_params_for_type(data, &non_lpsp_mode_params,
> +						SCREEN_TYPE_NON_LPSP);
> +
> +	if (lpsp)
> +		default_mode_params = &lpsp_mode_params;
> +	else if (non_lpsp)
> +		default_mode_params = &non_lpsp_mode_params;
> +	else
> +		default_mode_params = NULL;
> +}
> +
> +static bool set_mode_for_params(struct modeset_params *params)
> +{
> +	int rc;
> +
> +	rc = drmModeSetCrtc(drm_fd, params->crtc_id, params->fb.fb_id, 0, 0,
> +			    &params->connector_id, 1, params->mode);
> +	return (rc == 0);
> +}
> +
> +#define set_mode_for_params_and_wait(params) do { \
> +	igt_assert(set_mode_for_params(params)); \
> +	igt_assert(wait_for_active()); \
> +} while (0)
> +
> +static bool enable_one_screen_with_type(struct mode_set_data *data,
> +					enum screen_type type)
> +{
> +	struct modeset_params *params = NULL;
> +
> +	switch (type) {
> +	case SCREEN_TYPE_ANY:
> +		params = default_mode_params;
> +		break;
> +	case SCREEN_TYPE_LPSP:
> +		params = &lpsp_mode_params;
> +		break;
> +	case SCREEN_TYPE_NON_LPSP:
> +		params = &non_lpsp_mode_params;
> +		break;
> +	default:
> +		igt_assert(0);
> +	}
> +
> +	if (!params)
> +		return false;
> +
> +	return set_mode_for_params(params);
> +}
> +
> +static void enable_one_screen(struct mode_set_data *data)
> +{
> +	/* SKIP if there are no connected screens. */
> +	igt_require(enable_one_screen_with_type(data, SCREEN_TYPE_ANY));
> +}
> +
> +#define enable_one_screen_and_wait(data) do { \
> +	enable_one_screen(data); \
> +	igt_assert(wait_for_active()); \
> +} while (0)
> +
> +static void
> +enable_one_screen_or_forcewake_get_and_wait(struct mode_set_data *data)
> +{
> +	bool headless;
> +
> +	/* Try to resume by enabling any type of display */
> +	headless = !enable_one_screen_with_type(data, SCREEN_TYPE_ANY);
> +
> +	/*
> +	 * Get User Forcewake to trigger rpm resume in case of headless
> +	 * as well as no display being connected.
> +	 */
> +	if (headless) {
> +		data->fw_fd = igt_open_forcewake_handle(drm_fd);
> +		igt_require(data->fw_fd > 0);
> +	}
> +	igt_assert(wait_for_active());
> +}
> +
> +static void forcewake_put(struct mode_set_data *data)
> +{
> +	if (data->fw_fd <= 0)
> +		return;
> +
> +	data->fw_fd = close(data->fw_fd);
> +	igt_assert_eq(data->fw_fd, 0);
> +}
> +
> +static drmModePropertyBlobPtr get_connector_edid(drmModeConnectorPtr connector,
> +						 int index)
> +{
> +	bool found;
> +	uint64_t prop_value;
> +	drmModePropertyPtr prop;
> +	drmModePropertyBlobPtr blob = NULL;
> +
> +	found = kmstest_get_property(drm_fd, connector->connector_id,
> +				     DRM_MODE_OBJECT_CONNECTOR, "EDID",
> +				     NULL, &prop_value, &prop);
> +
> +	if (found) {
> +		igt_assert(prop->flags & DRM_MODE_PROP_BLOB);
> +		igt_assert(prop->count_blobs == 0);
> +
> +		blob = drmModeGetPropertyBlob(drm_fd, prop_value);
> +
> +		drmModeFreeProperty(prop);
> +	}
> +
> +	return blob;
> +}
> +
> +static void init_mode_set_data(struct mode_set_data *data)
> +{
> +	data->res = drmModeGetResources(drm_fd);
> +	if (data->res) {
> +		igt_assert(data->res->count_connectors <= MAX_CONNECTORS);
> +		for (int i = 0; i < data->res->count_connectors; i++) {
> +			data->connectors[i] =
> +				drmModeGetConnector(drm_fd,
> +						    data->res->connectors[i]);
> +			data->edids[i] = get_connector_edid(data->connectors[i], i);
> +		}
> +
> +		kmstest_set_vt_graphics_mode();
> +		igt_display_require(&data->display, drm_fd);
> +	}
> +
> +	init_modeset_cached_params(&ms_data);
> +}
> +
> +static void fini_mode_set_data(struct mode_set_data *data)
> +{
> +	if (data->res) {
> +		for (int i = 0; i < data->res->count_connectors; i++) {
> +			drmModeFreeConnector(data->connectors[i]);
> +			drmModeFreePropertyBlob(data->edids[i]);
> +		}
> +		drmModeFreeResources(data->res);
> +		igt_display_fini(&data->display);
> +	}
> +}
> +
> +static void get_drm_info(struct compare_data *data)
> +{
> +	int i;
> +
> +	data->res = drmModeGetResources(drm_fd);
> +	if (!data->res)
> +		return;
> +
> +	igt_assert(data->res->count_connectors <= MAX_CONNECTORS);
> +	igt_assert(data->res->count_encoders <= MAX_ENCODERS);
> +	igt_assert(data->res->count_crtcs <= MAX_CRTCS);
> +
> +	for (i = 0; i < data->res->count_connectors; i++) {
> +		/* Don't use GetConnectorCurrent, we want to force a reprobe
> +		 * here. */
> +		data->connectors[i] = drmModeGetConnector(drm_fd,
> +						data->res->connectors[i]);
> +		data->edids[i] = get_connector_edid(data->connectors[i], i);
> +	}
> +	for (i = 0; i < data->res->count_encoders; i++)
> +		data->encoders[i] = drmModeGetEncoder(drm_fd,
> +						data->res->encoders[i]);
> +	for (i = 0; i < data->res->count_crtcs; i++)
> +		data->crtcs[i] = drmModeGetCrtc(drm_fd, data->res->crtcs[i]);
> +}
> +
> +static void free_drm_info(struct compare_data *data)
> +{
> +	int i;
> +
> +	if (!data->res)
> +		return;
> +
> +	for (i = 0; i < data->res->count_connectors; i++) {
> +		drmModeFreeConnector(data->connectors[i]);
> +		drmModeFreePropertyBlob(data->edids[i]);
> +	}
> +	for (i = 0; i < data->res->count_encoders; i++)
> +		drmModeFreeEncoder(data->encoders[i]);
> +	for (i = 0; i < data->res->count_crtcs; i++)
> +		drmModeFreeCrtc(data->crtcs[i]);
> +
> +	drmModeFreeResources(data->res);
> +}
> +
> +#define COMPARE(d1, d2, data) igt_assert_eq(d1->data, d2->data)
> +#define COMPARE_ARRAY(d1, d2, size, data) do { \
> +	for (i = 0; i < size; i++) \
> +		igt_assert(d1->data[i] == d2->data[i]); \
> +} while (0)
> +
> +static void assert_drm_resources_equal(struct compare_data *d1,
> +				       struct compare_data *d2)
> +{
> +	COMPARE(d1, d2, res->count_connectors);
> +	COMPARE(d1, d2, res->count_encoders);
> +	COMPARE(d1, d2, res->count_crtcs);
> +	COMPARE(d1, d2, res->min_width);
> +	COMPARE(d1, d2, res->max_width);
> +	COMPARE(d1, d2, res->min_height);
> +	COMPARE(d1, d2, res->max_height);
> +}
> +
> +static void assert_modes_equal(drmModeModeInfoPtr m1, drmModeModeInfoPtr m2)
> +{
> +	COMPARE(m1, m2, clock);
> +	COMPARE(m1, m2, hdisplay);
> +	COMPARE(m1, m2, hsync_start);
> +	COMPARE(m1, m2, hsync_end);
> +	COMPARE(m1, m2, htotal);
> +	COMPARE(m1, m2, hskew);
> +	COMPARE(m1, m2, vdisplay);
> +	COMPARE(m1, m2, vsync_start);
> +	COMPARE(m1, m2, vsync_end);
> +	COMPARE(m1, m2, vtotal);
> +	COMPARE(m1, m2, vscan);
> +	COMPARE(m1, m2, vrefresh);
> +	COMPARE(m1, m2, flags);
> +	COMPARE(m1, m2, type);
> +	igt_assert(strcmp(m1->name, m2->name) == 0);
> +}
> +
> +static void assert_drm_connectors_equal(drmModeConnectorPtr c1,
> +					drmModeConnectorPtr c2)
> +{
> +	int i;
> +
> +	COMPARE(c1, c2, connector_id);
> +	COMPARE(c1, c2, connector_type);
> +	COMPARE(c1, c2, connector_type_id);
> +	COMPARE(c1, c2, mmWidth);
> +	COMPARE(c1, c2, mmHeight);
> +	COMPARE(c1, c2, count_modes);
> +	COMPARE(c1, c2, count_props);
> +	COMPARE(c1, c2, count_encoders);
> +	COMPARE_ARRAY(c1, c2, c1->count_props, props);
> +	COMPARE_ARRAY(c1, c2, c1->count_encoders, encoders);
> +
> +	for (i = 0; i < c1->count_modes; i++)
> +		assert_modes_equal(&c1->modes[0], &c2->modes[0]);
> +}
> +
> +static void assert_drm_encoders_equal(drmModeEncoderPtr e1,
> +				      drmModeEncoderPtr e2)
> +{
> +	COMPARE(e1, e2, encoder_id);
> +	COMPARE(e1, e2, encoder_type);
> +	COMPARE(e1, e2, possible_crtcs);
> +	COMPARE(e1, e2, possible_clones);
> +}
> +
> +static void assert_drm_crtcs_equal(drmModeCrtcPtr c1, drmModeCrtcPtr c2)
> +{
> +	COMPARE(c1, c2, crtc_id);
> +}
> +
> +static void assert_drm_edids_equal(drmModePropertyBlobPtr e1,
> +				   drmModePropertyBlobPtr e2)
> +{
> +	if (!e1 && !e2)
> +		return;
> +	igt_assert(e1 && e2);
> +
> +	COMPARE(e1, e2, length);
> +
> +	igt_assert(memcmp(e1->data, e2->data, e1->length) == 0);
> +}
> +
> +static void assert_drm_infos_equal(struct compare_data *d1,
> +				   struct compare_data *d2)
> +{
> +	int i;
> +
> +	if (d1->res == d2->res)
> +		return;
> +
> +	igt_assert(d1->res);
> +	igt_assert(d2->res);
> +
> +	assert_drm_resources_equal(d1, d2);
> +
> +	for (i = 0; i < d1->res->count_connectors; i++) {
> +		assert_drm_connectors_equal(d1->connectors[i],
> +					    d2->connectors[i]);
> +		assert_drm_edids_equal(d1->edids[i], d2->edids[i]);
> +	}
> +
> +	for (i = 0; i < d1->res->count_encoders; i++)
> +		assert_drm_encoders_equal(d1->encoders[i], d2->encoders[i]);
> +
> +	for (i = 0; i < d1->res->count_crtcs; i++)
> +		assert_drm_crtcs_equal(d1->crtcs[i], d2->crtcs[i]);
> +}
> +
> +static void setup_pc8(void)
> +{
> +	has_pc8 = false;
> +
> +	/* Only Haswell supports the PC8 feature. */
> +	if (!IS_HASWELL(ms_data.devid) && !IS_BROADWELL(ms_data.devid))
> +		return;
> +
> +	/* Make sure our Kernel supports MSR and the module is loaded. */
> +	igt_require(modprobe("msr") == 0);
> +
> +	msr_fd = open("/dev/cpu/0/msr", O_RDONLY);
> +	igt_assert_f(msr_fd >= 0,
> +		     "Can't open /dev/cpu/0/msr.\n");
> +
> +	/* Non-ULT machines don't support PC8+. */
> +	if (!supports_pc8_plus_residencies())
> +		return;
> +
> +	pc8_status_fd = openat(debugfs, "i915_pc8_status", O_RDONLY);
> +	if (pc8_status_fd == -1)
> +		pc8_status_fd = openat(debugfs,
> +				       "i915_runtime_pm_status", O_RDONLY);
> +	igt_assert_f(pc8_status_fd >= 0,
> +		     "Can't open /sys/kernel/debug/dri/0/i915_runtime_pm_status");
> +
> +	has_pc8 = true;
> +}
> +
> +static void dump_file(int dir, const char *filename)
> +{
> +	char *contents;
> +
> +	contents = igt_sysfs_get(dir, filename);
> +	if (!contents)
> +		return;
> +
> +	igt_info("%s:\n%s\n", filename, contents);
> +	free(contents);
> +}
> +
> +static bool setup_environment(bool display_enabled)
> +{
> +	if (has_runtime_pm)
> +		goto out;
> +
> +	drm_fd = __drm_open_driver(DRIVER_INTEL);
> +	igt_require(drm_fd != -1);
> +	igt_device_set_master(drm_fd);
> +
> +	debugfs = igt_debugfs_dir(drm_fd);
> +	igt_require(debugfs != -1);
> +
> +	ms_data.devid = intel_get_drm_devid(drm_fd);
> +
> +	if (display_enabled)
> +		init_mode_set_data(&ms_data);
> +
> +	igt_pm_enable_sata_link_power_management();
> +
> +	has_runtime_pm = igt_setup_runtime_pm(drm_fd);
> +	setup_pc8();
> +
> +	igt_info("Runtime PM support: %d\n", has_runtime_pm);
> +	igt_info("PC8 residency support: %d\n", has_pc8);
> +	igt_require(has_runtime_pm);
> +	igt_require(igt_pm_dmc_loaded(debugfs));
> +
> +out:
> +	if (display_enabled)
> +		disable_all_screens(&ms_data);
> +	dump_file(debugfs, "i915_runtime_pm_status");
> +
> +	return wait_for_suspended();
> +}
> +
> +static void teardown_environment(bool display_enabled)
> +{
> +	close(msr_fd);
> +	if (has_pc8)
> +		close(pc8_status_fd);
> +
> +	igt_restore_runtime_pm();
> +
> +	igt_pm_restore_sata_link_power_management();
> +
> +	if (display_enabled)
> +		fini_mode_set_data(&ms_data);
> +
> +	close(debugfs);
> +	close(drm_fd);
> +
> +	has_runtime_pm = false;
> +}
> +
> +static void modeset_subtest(enum screen_type type, int rounds, int wait_flags)
> +{
> +	int i;
> +
> +	if (wait_flags & WAIT_PC8_RES)
> +		igt_require(has_pc8);
> +
> +	if (wait_flags & WAIT_EXTRA)
> +		rounds /= 2;
> +
> +	for (i = 0; i < rounds; i++) {
> +		if (wait_flags & USE_DPMS)
> +			disable_all_screens_dpms(&ms_data);
> +		else
> +			disable_all_screens(&ms_data);
> +
> +		if (wait_flags & WAIT_STATUS)
> +			igt_assert(wait_for_suspended());
> +		if (wait_flags & WAIT_PC8_RES)
> +			igt_assert(pc8_plus_residency_changed(30));
> +		if (wait_flags & WAIT_EXTRA)
> +			sleep(5);
> +
> +		/* If we skip this line it's because the type of screen we want
> +		 * is not connected. */
> +		igt_require(enable_one_screen_with_type(&ms_data, type));
> +		if (wait_flags & WAIT_STATUS)
> +			igt_assert(wait_for_active());
> +		if (wait_flags & WAIT_PC8_RES)
> +			igt_assert(!pc8_plus_residency_changed(5));
> +		if (wait_flags & WAIT_EXTRA)
> +			sleep(5);
> +	}
> +}
> +
> +/* Test of the DRM resources reported by the IOCTLs are still the same. This
> + * ensures we still see the monitors with the same eyes. We get the EDIDs and
> + * compare them, which ensures we use DP AUX or GMBUS depending on what's
> + * connected. */
> +static void drm_resources_equal_subtest(void)
> +{
> +	struct compare_data pre_suspend, during_suspend, post_suspend;
> +
> +	enable_one_screen_and_wait(&ms_data);
> +	get_drm_info(&pre_suspend);
> +	igt_assert(wait_for_active());
> +
> +	disable_all_screens_and_wait(&ms_data);
> +	get_drm_info(&during_suspend);
> +	igt_assert(wait_for_suspended());
> +
> +	enable_one_screen_and_wait(&ms_data);
> +	get_drm_info(&post_suspend);
> +	igt_assert(wait_for_active());
> +
> +	assert_drm_infos_equal(&pre_suspend, &during_suspend);
> +	assert_drm_infos_equal(&pre_suspend, &post_suspend);
> +
> +	free_drm_info(&pre_suspend);
> +	free_drm_info(&during_suspend);
> +	free_drm_info(&post_suspend);
> +}
> +
> +static bool find_i2c_path(const char *connector_name,
> +			  char *i2c_path, size_t i2c_path_size)
> +{
> +	struct dirent *dirent;
> +	DIR *dir;
> +	int sysfs_card_fd = igt_sysfs_open(drm_fd);
> +	int connector_fd = -1;
> +	bool found_i2c_file = false;
> +	ssize_t r;
> +
> +	dir = fdopendir(sysfs_card_fd);
> +	igt_assert(dir);
> +
> +	while ((dirent = readdir(dir))) {
> +		/* Skip "cardx-" prefix */
> +		char *dirname = strchr(dirent->d_name, '-');
> +		if (dirname==NULL)
> +			continue;
> +		++dirname;
> +
> +		if (strcmp(dirname, connector_name) == 0) {
> +			connector_fd = openat(sysfs_card_fd, dirent->d_name, O_RDONLY);
> +			break;
> +		}
> +	}
> +	closedir(dir);
> +
> +	if (connector_fd < 0)
> +		return false;
> +
> +	/* try the standard "ddc" symlink first */
> +	r = readlinkat(connector_fd, "ddc", i2c_path, i2c_path_size);
> +	if (r > 0 && r != i2c_path_size) {
> +		int num;
> +
> +		i2c_path[r] = '\0';
> +
> +		if (sscanf(basename(i2c_path), "i2c-%d", &num) == 1) {
> +			snprintf(i2c_path, i2c_path_size, "/dev/i2c-%d", num);
> +			return true;
> +		}
> +	}
> +
> +	dir = fdopendir(connector_fd);
> +	igt_assert(dir);
> +
> +	/* fall back to old "i2c-?" symlink */
> +	/* FIXME nuke this at some point */
> +	while ((dirent = readdir(dir))) {
> +		if (strncmp(dirent->d_name, "i2c-", 4) == 0) {
> +			sprintf(i2c_path, "/dev/%s", dirent->d_name);
> +			found_i2c_file = true;
> +		}
> +	}
> +	closedir(dir);
> +	return found_i2c_file;
> +}
> +
> +static bool i2c_read_edid(const char *connector_name, unsigned char *edid)
> +{
> +	char i2c_path[PATH_MAX];
> +	bool result;
> +	int rc, fd;
> +	struct i2c_msg msgs[] = {
> +		{ /* Start at 0. */
> +			.addr = 0x50,
> +			.flags = 0,
> +			.len = 1,
> +			.buf = edid,
> +		}, { /* Now read the EDID. */
> +			.addr = 0x50,
> +			.flags = I2C_M_RD,
> +			.len = 128,
> +			.buf = edid,
> +		}
> +	};
> +	struct i2c_rdwr_ioctl_data msgset = {
> +		.msgs = msgs,
> +		.nmsgs = 2,
> +	};
> +
> +	result = find_i2c_path(connector_name, i2c_path, sizeof(i2c_path));
> +	if (!result)
> +		return false;
> +
> +	igt_info("Testing %s %s\n", connector_name, i2c_path);
> +
> +	fd = open(i2c_path, O_RDWR);
> +	igt_assert_neq(fd, -1);
> +
> +	rc = ioctl(fd, I2C_RDWR, &msgset);
> +	if (rc==-1) {
> +		igt_debug("I2C access failed with errno %d, %s\n",
> +				errno, strerror(errno));
> +		errno = 0;
> +	}
> +
> +	close(fd);
> +	return rc >= 0;
> +}
> +
> +static void format_hex_string(const unsigned char edid[static EDID_BLOCK_SIZE],
> +			      char buf[static EDID_BLOCK_SIZE * 5 + 1])
> +{
> +	for (int i = 0; i < EDID_BLOCK_SIZE; ++i)
> +		sprintf(buf+i*5, "0x%02x ", edid[i]);
> +}
> +
> +static bool is_mst_connector(int fd, uint32_t connector_id)
> +{
> +	return kmstest_get_property(fd, connector_id,
> +				    DRM_MODE_OBJECT_CONNECTOR,
> +				    "PATH", NULL, NULL, NULL);
> +}
> +
> +static void test_i2c(struct mode_set_data *data)
> +{
> +	bool edid_mistmach_i2c_vs_drm = false;
> +	igt_display_t display;
> +	igt_display_require(&display, drm_fd);
> +
> +	for (int i = 0; i < data->res->count_connectors; i++) {
> +		unsigned char *drm_edid = data->edids[i] ? data->edids[i]->data : NULL;
> +		unsigned char i2c_edid[EDID_BLOCK_SIZE] = {};
> +
> +		igt_output_t *output = igt_output_from_connector(&display,
> +								 data->connectors[i]);
> +		char *connector_name = (char *) igt_output_name(output);
> +
> +		bool got_i2c_edid = i2c_read_edid(connector_name, i2c_edid);
> +		bool got_drm_edid = drm_edid != NULL;
> +		bool is_vga = data->connectors[i]->connector_type == DRM_MODE_CONNECTOR_VGA;
> +
> +		bool edids_equal;
> +
> +		if (data->connectors[i]->connection != DRM_MODE_CONNECTED ||
> +		    is_mst_connector(drm_fd, data->connectors[i]->connector_id))
> +			continue;
> +
> +		/* We fail to detect some VGA monitors using our i2c method. If you look
> +		 * at the dmesg of these cases, you'll see the Kernel complaining about
> +		 * the EDID reading mostly FFs and then disabling bit-banging. Since we
> +		 * don't want to reimplement everything the Kernel does, let's just
> +		 * accept the fact that some VGA outputs won't be properly detected. */
> +		if (is_vga)
> +			continue;
> +
> +		if (!got_i2c_edid && !got_drm_edid)
> +			continue;
> +
> +		if (got_i2c_edid && got_drm_edid)
> +			edids_equal = (0 == memcmp(drm_edid, i2c_edid, EDID_BLOCK_SIZE));
> +		else
> +			edids_equal = false;
> +
> +
> +		if (!edids_equal) {
> +			char buf[5 * EDID_BLOCK_SIZE + 1];
> +			igt_critical("Detected EDID mismatch on connector %s\n",
> +				     connector_name);
> +
> +			if(got_i2c_edid)
> +				format_hex_string(i2c_edid, buf);
> +			else
> +				sprintf(buf, "NULL");
> +
> +			igt_critical("i2c: %s\n", buf);
> +
> +			if(got_drm_edid)
> +				format_hex_string(drm_edid, buf);
> +			else
> +				sprintf(buf, "NULL");
> +
> +			igt_critical("drm: %s\n", buf);
> +
> +			edid_mistmach_i2c_vs_drm = true;
> +		}
> +	}
> +	igt_fail_on_f(edid_mistmach_i2c_vs_drm,
> +			"There is an EDID mismatch between i2c and DRM!\n");
> +}
> +
> +static void i2c_subtest_check_environment(void)
> +{
> +	int i2c_dev_files = 0;
> +	DIR *dev_dir;
> +	struct dirent *dirent;
> +
> +	/* Make sure the /dev/i2c-* files exist. */
> +	igt_require(modprobe("i2c-dev") == 0);
> +
> +	dev_dir = opendir("/dev");
> +	igt_assert(dev_dir);
> +	while ((dirent = readdir(dev_dir))) {
> +		if (strncmp(dirent->d_name, "i2c-", 4) == 0)
> +			i2c_dev_files++;
> +	}
> +	closedir(dev_dir);
> +	igt_require(i2c_dev_files);
> +}
> +
> +/* Try to use raw I2C, which also needs interrupts. */
> +static void i2c_subtest(void)
> +{
> +	i2c_subtest_check_environment();
> +
> +	enable_one_screen_and_wait(&ms_data);
> +
> +	disable_all_screens_and_wait(&ms_data);
> +	test_i2c(&ms_data);
> +	igt_assert(wait_for_suspended());
> +
> +	enable_one_screen(&ms_data);
> +}
> +
> +struct read_entry_elapsed {
> +	uint64_t elapsed;
> +	char *path;
> +} max_read_entry;
> +
> +static bool device_in_pci_d3(struct pci_device *pci_dev)
> +{
> +	uint16_t val;
> +	int rc;
> +
> +	rc = pci_device_cfg_read_u16(pci_dev, &val, 0xd4);
> +	igt_assert_eq(rc, 0);
> +
> +	igt_debug("%s: PCI D3 state=%d\n", __func__, val & 0x3);
> +	return (val & 0x3) == 0x3;
> +}
> +
> +static void pci_d3_state_subtest(void)
> +{
> +	struct pci_device *pci_dev, *bridge_pci_dev;
> +
> +	igt_require(has_runtime_pm);
> +
> +	pci_dev = igt_device_get_pci_device(drm_fd);
> +	bridge_pci_dev = pci_device_get_parent_bridge(pci_dev);
> +
> +	disable_all_screens_and_wait(&ms_data);
> +	igt_assert(igt_wait(device_in_pci_d3(pci_dev), 2000, 100));
> +
> +	if (gem_has_lmem(drm_fd))
> +		igt_require_f(pci_device_has_kernel_driver(bridge_pci_dev),
> +			      "pci bridge device does not bind with pcieport driver\n");
> +
> +	enable_one_screen_or_forcewake_get_and_wait(&ms_data);
> +	igt_assert(!device_in_pci_d3(pci_dev));
> +	forcewake_put(&ms_data);
> +}
> +
> +__noreturn static void stay_subtest(void)
> +{
> +	disable_all_screens_and_wait(&ms_data);
> +
> +	while (1)
> +		sleep(600);
> +}
> +
> +static void system_suspend_modeset_subtest(void)
> +{
> +	disable_all_screens_and_wait(&ms_data);
> +	igt_system_suspend_autoresume(SUSPEND_STATE_MEM, SUSPEND_TEST_NONE);
> +	igt_assert(wait_for_suspended());
> +
> +	enable_one_screen_and_wait(&ms_data);
> +	disable_all_screens_and_wait(&ms_data);
> +}
> +
> +/* Enable a screen, activate DPMS, then do a modeset. At some point our driver
> + * produced WARNs on this case. */
> +static void dpms_mode_unset_subtest(enum screen_type type)
> +{
> +	disable_all_screens_and_wait(&ms_data);
> +
> +	igt_require(enable_one_screen_with_type(&ms_data, type));
> +	igt_assert(wait_for_active());
> +
> +	disable_all_screens_dpms(&ms_data);
> +	igt_assert(wait_for_suspended());
> +
> +	disable_all_screens_and_wait(&ms_data);
> +}
> +
> +static void fill_igt_fb(struct igt_fb *fb, uint32_t color)
> +{
> +	int i;
> +	uint32_t *ptr;
> +
> +	ptr = gem_mmap__device_coherent(drm_fd, fb->gem_handle, 0, fb->size, PROT_WRITE);
> +	for (i = 0; i < fb->size/sizeof(uint32_t); i++)
> +		ptr[i] = color;
> +	igt_assert(munmap(ptr, fb->size) == 0);
> +}
> +
> +/* At some point, this test triggered WARNs in the Kernel. */
> +static void cursor_subtest(bool dpms)
> +{
> +	int rc;
> +	struct igt_fb cursor_fb1, cursor_fb2, cursor_fb3;
> +	uint32_t crtc_id;
> +
> +	disable_all_screens_and_wait(&ms_data);
> +
> +	igt_require(default_mode_params);
> +	crtc_id = default_mode_params->crtc_id;
> +
> +	igt_create_fb(drm_fd, 64, 64, DRM_FORMAT_ARGB8888,
> +		      DRM_FORMAT_MOD_LINEAR, &cursor_fb1);
> +	igt_create_fb(drm_fd, 64, 64, DRM_FORMAT_ARGB8888,
> +		      DRM_FORMAT_MOD_LINEAR, &cursor_fb2);
> +	igt_create_fb(drm_fd, 64, 64, DRM_FORMAT_XRGB8888,
> +		      I915_FORMAT_MOD_X_TILED, &cursor_fb3);
> +
> +	fill_igt_fb(&cursor_fb1, 0xFF00FFFF);
> +	fill_igt_fb(&cursor_fb2, 0xFF00FF00);
> +	fill_igt_fb(&cursor_fb3, 0xFFFF0000);
> +
> +	set_mode_for_params_and_wait(default_mode_params);
> +
> +	rc = drmModeSetCursor(drm_fd, crtc_id, cursor_fb1.gem_handle,
> +			      cursor_fb1.width, cursor_fb1.height);
> +	igt_assert_eq(rc, 0);
> +	rc = drmModeMoveCursor(drm_fd, crtc_id, 0, 0);
> +	igt_assert_eq(rc, 0);
> +	igt_assert(wait_for_active());
> +
> +	disable_or_dpms_all_screens_and_wait(&ms_data, dpms);
> +
> +	/* First, just move the cursor. */
> +	rc = drmModeMoveCursor(drm_fd, crtc_id, 1, 1);
> +	igt_assert_eq(rc, 0);
> +	igt_assert(wait_for_suspended());
> +
> +	/* Then unset it, and set a new one. */
> +	rc = drmModeSetCursor(drm_fd, crtc_id, 0, 0, 0);
> +	igt_assert_eq(rc, 0);
> +	igt_assert(wait_for_suspended());
> +
> +	rc = drmModeSetCursor(drm_fd, crtc_id, cursor_fb2.gem_handle,
> +			      cursor_fb1.width, cursor_fb2.height);
> +	igt_assert_eq(rc, 0);
> +	igt_assert(wait_for_suspended());
> +
> +	/* Move the new cursor. */
> +	rc = drmModeMoveCursor(drm_fd, crtc_id, 2, 2);
> +	igt_assert_eq(rc, 0);
> +	igt_assert(wait_for_suspended());
> +
> +	/* Now set a new one without unsetting the previous one. */
> +	rc = drmModeSetCursor(drm_fd, crtc_id, cursor_fb1.gem_handle,
> +			      cursor_fb1.width, cursor_fb1.height);
> +	igt_assert_eq(rc, 0);
> +	igt_assert(wait_for_suspended());
> +
> +	/* Cursor 3 was created with tiling and painted with a GTT mmap, so
> +	 * hopefully it has some fences around it. */
> +	rc = drmModeRmFB(drm_fd, cursor_fb3.fb_id);
> +	igt_assert_eq(rc, 0);
> +	__gem_set_tiling(drm_fd, cursor_fb3.gem_handle, false, cursor_fb3.strides[0]);
> +	igt_assert(wait_for_suspended());
> +
> +	rc = drmModeSetCursor(drm_fd, crtc_id, cursor_fb3.gem_handle,
> +			      cursor_fb3.width, cursor_fb3.height);
> +	igt_assert_eq(rc, 0);
> +	igt_assert(wait_for_suspended());
> +
> +	/* Make sure nothing remains for the other tests. */
> +	rc = drmModeSetCursor(drm_fd, crtc_id, 0, 0, 0);
> +	igt_assert_eq(rc, 0);
> +	igt_assert(wait_for_suspended());
> +}
> +
> +static enum plane_type get_plane_type(uint32_t plane_id)
> +{
> +	int i;
> +	bool found;
> +	uint64_t prop_value;
> +	drmModePropertyPtr prop;
> +	const char *enum_name = NULL;
> +	enum plane_type type;
> +
> +	found = kmstest_get_property(drm_fd, plane_id, DRM_MODE_OBJECT_PLANE,
> +				     "type", NULL, &prop_value, &prop);
> +	igt_assert(found);
> +
> +	igt_assert(prop->flags & DRM_MODE_PROP_ENUM);
> +	igt_assert(prop_value < prop->count_enums);
> +
> +	for (i = 0; i < prop->count_enums; i++) {
> +		if (prop->enums[i].value == prop_value) {
> +			enum_name = prop->enums[i].name;
> +			break;
> +		}
> +	}
> +	igt_assert(enum_name);
> +
> +	if (strcmp(enum_name, "Overlay") == 0)
> +		type = PLANE_OVERLAY;
> +	else if (strcmp(enum_name, "Primary") == 0)
> +		type = PLANE_PRIMARY;
> +	else if (strcmp(enum_name, "Cursor") == 0)
> +		type = PLANE_CURSOR;
> +	else
> +		igt_assert(0);
> +
> +	drmModeFreeProperty(prop);
> +
> +	return type;
> +}
> +
> +static void test_one_plane(bool dpms, uint32_t plane_id,
> +			   enum plane_type plane_type)
> +{
> +	int rc;
> +	uint32_t plane_format, plane_w, plane_h;
> +	uint32_t crtc_id;
> +	struct igt_fb plane_fb1, plane_fb2;
> +	int32_t crtc_x = 0, crtc_y = 0;
> +	uint64_t modifier;
> +
> +	disable_all_screens_and_wait(&ms_data);
> +
> +	crtc_id = default_mode_params->crtc_id;
> +
> +	switch (plane_type) {
> +	case PLANE_OVERLAY:
> +		plane_format = DRM_FORMAT_XRGB8888;
> +		plane_w = 64;
> +		plane_h = 64;
> +		modifier = I915_FORMAT_MOD_X_TILED;
> +		break;
> +	case PLANE_PRIMARY:
> +		plane_format = DRM_FORMAT_XRGB8888;
> +		plane_w = default_mode_params->mode->hdisplay;
> +		plane_h = default_mode_params->mode->vdisplay;
> +		modifier = I915_FORMAT_MOD_X_TILED;
> +		break;
> +	case PLANE_CURSOR:
> +		plane_format = DRM_FORMAT_ARGB8888;
> +		plane_w = 64;
> +		plane_h = 64;
> +		modifier = DRM_FORMAT_MOD_LINEAR;
> +		break;
> +	default:
> +		igt_assert(0);
> +		break;
> +	}
> +
> +	igt_create_fb(drm_fd, plane_w, plane_h, plane_format, modifier,
> +		      &plane_fb1);
> +	igt_create_fb(drm_fd, plane_w, plane_h, plane_format, modifier,
> +		      &plane_fb2);
> +	fill_igt_fb(&plane_fb1, 0xFF00FFFF);
> +	fill_igt_fb(&plane_fb2, 0xFF00FF00);
> +
> +	set_mode_for_params_and_wait(default_mode_params);
> +
> +	rc = drmModeSetPlane(drm_fd, plane_id, crtc_id, plane_fb1.fb_id, 0,
> +			     0, 0, plane_fb1.width, plane_fb1.height,
> +			     0 << 16, 0 << 16, plane_fb1.width << 16,
> +			     plane_fb1.height << 16);
> +	igt_assert_eq(rc, 0);
> +
> +	disable_or_dpms_all_screens_and_wait(&ms_data, dpms);
> +
> +	/* Just move the plane around. */
> +	if (plane_type != PLANE_PRIMARY) {
> +		crtc_x++;
> +		crtc_y++;
> +	}
> +	rc = drmModeSetPlane(drm_fd, plane_id, crtc_id, plane_fb1.fb_id, 0,
> +			     crtc_x, crtc_y, plane_fb1.width, plane_fb1.height,
> +			     0 << 16, 0 << 16, plane_fb1.width << 16,
> +			     plane_fb1.height << 16);
> +	igt_assert_eq(rc, 0);
> +	igt_assert(wait_for_suspended());
> +
> +	/* Unset, then change the plane. */
> +	rc = drmModeSetPlane(drm_fd, plane_id, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
> +	igt_assert_eq(rc, 0);
> +	igt_assert(wait_for_suspended());
> +
> +	rc = drmModeSetPlane(drm_fd, plane_id, crtc_id, plane_fb2.fb_id, 0,
> +			     crtc_x, crtc_y, plane_fb2.width, plane_fb2.height,
> +			     0 << 16, 0 << 16, plane_fb2.width << 16,
> +			     plane_fb2.height << 16);
> +	igt_assert_eq(rc, 0);
> +	igt_assert(wait_for_suspended());
> +
> +	/* Now change the plane without unsetting first. */
> +	rc = drmModeSetPlane(drm_fd, plane_id, crtc_id, plane_fb1.fb_id, 0,
> +			     crtc_x, crtc_y, plane_fb1.width, plane_fb1.height,
> +			     0 << 16, 0 << 16, plane_fb1.width << 16,
> +			     plane_fb1.height << 16);
> +	igt_assert_eq(rc, 0);
> +	igt_assert(wait_for_suspended());
> +
> +	/* Make sure nothing remains for the other tests. */
> +	rc = drmModeSetPlane(drm_fd, plane_id, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
> +	igt_assert_eq(rc, 0);
> +	igt_assert(wait_for_suspended());
> +}
> +
> +/* This one also triggered WARNs on our driver at some point in time. */
> +static void planes_subtest(bool universal, bool dpms)
> +{
> +	int i, crtc_idx;
> +	drmModePlaneResPtr planes;
> +
> +	igt_require(default_mode_params);
> +	crtc_idx = kmstest_get_crtc_idx(ms_data.res,
> +					default_mode_params->crtc_id);
> +
> +	igt_assert_eq(drmSetClientCap(drm_fd, DRM_CLIENT_CAP_UNIVERSAL_PLANES,
> +				      universal), 0);
> +
> +	planes = drmModeGetPlaneResources(drm_fd);
> +	for (i = 0; i < planes->count_planes; i++) {
> +		drmModePlanePtr plane;
> +
> +		plane = drmModeGetPlane(drm_fd, planes->planes[i]);
> +		igt_assert(plane);
> +
> +		if (plane->possible_crtcs & (1 << crtc_idx)) {
> +			enum plane_type type;
> +
> +			type = universal ? get_plane_type(plane->plane_id) :
> +					   PLANE_OVERLAY;
> +			igt_dynamic_f("plane-%d", plane->plane_id)
> +				test_one_plane(dpms, plane->plane_id, type);
> +		}
> +		drmModeFreePlane(plane);
> +	}
> +	drmModeFreePlaneResources(planes);
> +
> +	igt_assert_eq(drmSetClientCap(drm_fd, DRM_CLIENT_CAP_UNIVERSAL_PLANES,
> +				      1), 0);
> +}
> +
> +static void fences_subtest(void)
> +{
> +	int i;
> +	uint32_t *buf_ptr;
> +	uint32_t tiling = false, swizzle;
> +	struct modeset_params params;
> +	drmModeConnectorPtr c = NULL;
> +
> +	disable_all_screens_and_wait(&ms_data);
> +
> +	igt_require(default_mode_params);
> +	params.crtc_id = default_mode_params->crtc_id;
> +	params.connector_id = default_mode_params->connector_id;
> +	params.mode = default_mode_params->mode;
> +	igt_create_fb(drm_fd, params.mode->hdisplay, params.mode->vdisplay,
> +		      DRM_FORMAT_XRGB8888, I915_FORMAT_MOD_X_TILED,
> +		      &params.fb);
> +
> +	/* Even though we passed "true" as the tiling argument, double-check
> +	 * that the fb is really tiled. */
> +	gem_get_tiling(drm_fd, params.fb.gem_handle, &tiling, &swizzle);
> +	igt_assert(tiling);
> +
> +	buf_ptr = gem_mmap__gtt(drm_fd, params.fb.gem_handle, params.fb.size,
> +				PROT_WRITE | PROT_READ);
> +	for (i = 0; i < params.fb.size/sizeof(uint32_t); i++)
> +		buf_ptr[i] = i;
> +
> +	set_mode_for_params_and_wait(&params);
> +
> +	disable_or_dpms_all_screens_and_wait(&ms_data, true);
> +
> +	for (i = 0; i < params.fb.size/sizeof(uint32_t); i++)
> +		igt_assert_eq(buf_ptr[i], i);
> +	igt_assert(wait_for_suspended());
> +
> +	for (i = 0; i < ms_data.res->count_connectors; i++)
> +		if (ms_data.connectors[i]->connector_id ==
> +		    params.connector_id)
> +			c = ms_data.connectors[i];
> +	igt_assert(c);
> +
> +	kmstest_set_connector_dpms(drm_fd, c, DRM_MODE_DPMS_ON);
> +	igt_assert(wait_for_active());
> +
> +	for (i = 0; i < params.fb.size/sizeof(uint32_t); i++)
> +		igt_assert_eq(buf_ptr[i], i);
> +
> +	igt_assert(munmap(buf_ptr, params.fb.size) == 0);
> +}
> +
> +int rounds = 10;
> +bool stay = false;
> +
> +static int opt_handler(int opt, int opt_index, void *data)
> +{
> +	switch (opt) {
> +	case 'l':
> +		rounds = 50;
> +		break;
> +	case 's':
> +		stay = true;
> +		break;
> +	default:
> +		return IGT_OPT_HANDLER_ERROR;
> +	}
> +
> +	return IGT_OPT_HANDLER_SUCCESS;
> +}
> +
> +const char *help_str =
> +	"  --stress\t\tMake the stress-tests more stressful.\n"
> +	"  --stay\t\tDisable all screen and try to go into runtime pm. Useful for debugging.";
> +static struct option long_options[] = {
> +	{"stress", 0, 0, 'l'},
> +	{"stay", 0, 0, 's'},
> +	{ 0, 0, 0, 0 }
> +};
> +
> +igt_main_args("", long_options, help_str, opt_handler, NULL)
> +{
> +	igt_fixture {
> +		igt_require(setup_environment(true));
> +	}
> +
> +	if (stay)
> +		igt_subtest("stay")
> +			stay_subtest();
> +
> +	/* Essential things */
> +	igt_subtest("drm-resources-equal")
> +		drm_resources_equal_subtest();
> +	igt_subtest("basic-pci-d3-state")
> +		pci_d3_state_subtest();
> +
> +	/* Basic modeset */
> +	igt_subtest("modeset-lpsp")
> +		modeset_subtest(SCREEN_TYPE_LPSP, 1, WAIT_STATUS);
> +	igt_subtest("modeset-non-lpsp")
> +		modeset_subtest(SCREEN_TYPE_NON_LPSP, 1, WAIT_STATUS);
> +	igt_subtest("dpms-lpsp")
> +		modeset_subtest(SCREEN_TYPE_LPSP, 1, WAIT_STATUS | USE_DPMS);
> +	igt_subtest("dpms-non-lpsp")
> +		modeset_subtest(SCREEN_TYPE_NON_LPSP, 1, WAIT_STATUS | USE_DPMS);
> +
> +	/* Planes and cursors */
> +	igt_subtest("cursor")
> +		cursor_subtest(false);
> +	igt_subtest("cursor-dpms")
> +		cursor_subtest(true);
> +	igt_subtest_with_dynamic("legacy-planes")
> +		planes_subtest(false, false);
> +	igt_subtest_with_dynamic("legacy-planes-dpms")
> +		planes_subtest(false, true);
> +	igt_subtest_with_dynamic("universal-planes")
> +		planes_subtest(true, false);
> +	igt_subtest_with_dynamic("universal-planes-dpms")
> +		planes_subtest(true, true);
> +
> +	/* Misc */
> +	igt_subtest("i2c")
> +		i2c_subtest();
> +	igt_subtest("dpms-mode-unset-lpsp")
> +		dpms_mode_unset_subtest(SCREEN_TYPE_LPSP);
> +	igt_subtest("dpms-mode-unset-non-lpsp")
> +		dpms_mode_unset_subtest(SCREEN_TYPE_NON_LPSP);
> +	igt_subtest("fences-dpms") {
> +		gem_require_mappable_ggtt(drm_fd);
> +		fences_subtest();
> +	}
> +
> +	/* Modeset stress */
> +	igt_subtest("modeset-lpsp-stress")
> +		modeset_subtest(SCREEN_TYPE_LPSP, rounds, WAIT_STATUS);
> +	igt_subtest("modeset-non-lpsp-stress")
> +		modeset_subtest(SCREEN_TYPE_NON_LPSP, rounds, WAIT_STATUS);
> +	igt_subtest("modeset-lpsp-stress-no-wait")
> +		modeset_subtest(SCREEN_TYPE_LPSP, rounds, DONT_WAIT);
> +	igt_subtest("modeset-non-lpsp-stress-no-wait")
> +		modeset_subtest(SCREEN_TYPE_NON_LPSP, rounds, DONT_WAIT);
> +	igt_subtest("modeset-pc8-residency-stress")
> +		modeset_subtest(SCREEN_TYPE_ANY, rounds, WAIT_PC8_RES);
> +	igt_subtest("modeset-stress-extra-wait")
> +		modeset_subtest(SCREEN_TYPE_ANY, rounds,
> +				WAIT_STATUS | WAIT_EXTRA);
> +
> +	/* System suspend */
> +	igt_subtest("system-suspend-modeset")
> +		system_suspend_modeset_subtest();
> +
> +	igt_fixture {
> +		teardown_environment(true);
> +		forcewake_put(&ms_data);
> +	}
> +}
> diff --git a/tests/intel-ci/blacklist-pre-merge.txt b/tests/intel-ci/blacklist-pre-merge.txt
> index d4e5ef66e..0a1315aae 100644
> --- a/tests/intel-ci/blacklist-pre-merge.txt
> +++ b/tests/intel-ci/blacklist-pre-merge.txt
> @@ -13,8 +13,8 @@
>  #
>  # Data acquired on 2020-02-19 by Martin Peres
>  ###############################################################################
> -igt@i915_pm_rpm@legacy-planes(-dpms)?
> -igt@i915_pm_rpm@universal-planes(-dpms)?
> +igt@kms_pm_rpm@legacy-planes(-dpms)?
> +igt@kms_pm_rpm@universal-planes(-dpms)?
>  
>  
>  ###############################################################################
> @@ -67,7 +67,7 @@ igt@gem_exec_alignment@.*
>  #
>  # Data acquired on 2020-02-20 by Martin Peres
>  ###############################################################################
> -igt@i915_pm_rpm@debugfs-read
> +igt@kms_pm_rpm@debugfs-read
>  
>  
>  ###############################################################################
> @@ -109,4 +109,4 @@ igt@gem_tiled_wc
>  #
>  # Data acquired on 2020-02-20 by Martin Peres
>  ###############################################################################
> -igt@i915_pm_rpm@modeset-stress-extra-wait
> +igt@kms_pm_rpm@modeset-stress-extra-wait
> diff --git a/tests/intel-ci/blacklist.txt b/tests/intel-ci/blacklist.txt
> index e13759d3e..c8bce2e0e 100644
> --- a/tests/intel-ci/blacklist.txt
> +++ b/tests/intel-ci/blacklist.txt
> @@ -13,7 +13,7 @@ igt@meta_test(@.*)?
>  # failures in tests run afterwards.
>  ###############################################
>  #igt@i915_module_load(@.*)? # danger, danger; hope for taints!
> -igt@i915_pm_rpm@module-reload
> +igt@kms_pm_rpm@module-reload
>  igt@i915_pm_rpm@gem-execbuf-stress-extra-wait
>  ###############################################
>  # GEM
> diff --git a/tests/intel-ci/fast-feedback.testlist b/tests/intel-ci/fast-feedback.testlist
> index 4e1ed921c..99dc90c79 100644
> --- a/tests/intel-ci/fast-feedback.testlist
> +++ b/tests/intel-ci/fast-feedback.testlist
> @@ -118,13 +118,13 @@ igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence
>  igt@kms_pipe_crc_basic@read-crc
>  igt@kms_pipe_crc_basic@read-crc-frame-sequence
>  igt@kms_pm_backlight@basic-brightness
> +igt@kms_pm_rpm@basic-pci-d3-state
> +igt@kms_pm_rpm@basic-rte
>  igt@kms_psr@primary_page_flip
>  igt@kms_psr@cursor_plane_move
>  igt@kms_psr@sprite_plane_onoff
>  igt@kms_psr@primary_mmap_gtt
>  igt@kms_setmode@basic-clone-single-crtc
> -igt@i915_pm_rpm@basic-pci-d3-state
> -igt@i915_pm_rpm@basic-rte
>  igt@i915_pm_rps@basic-api
>  igt@prime_self_import@basic-llseek-bad
>  igt@prime_self_import@basic-llseek-size
> @@ -160,7 +160,7 @@ igt@gem_lmem_swapping@basic
>  igt@gem_lmem_swapping@parallel-random-engines
>  igt@gem_lmem_swapping@random-engines
>  igt@gem_lmem_swapping@verify-random
> -igt@i915_pm_rpm@module-reload
> +igt@kms_pm_rpm@module-reload
>  
>  # Kernel selftests
>  igt@i915_selftest@live
> diff --git a/tests/meson.build b/tests/meson.build
> index 9cf630b94..9888c6d8d 100644
> --- a/tests/meson.build
> +++ b/tests/meson.build
> @@ -251,6 +251,7 @@ i915_progs = [
>  	'kms_pm_backlight',
>  	'kms_pm_dc',
>  	'kms_pm_lpsp',
> +	'kms_pm_rpm',
>  	'kms_psr',
>  	'kms_psr2_sf',
>  	'kms_psr2_su',
> -- 
> 2.40.0
> 
