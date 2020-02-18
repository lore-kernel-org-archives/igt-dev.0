Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from fireflyinternet.com (unknown [77.68.26.236])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF1A06E3B7
 for <igt-dev@lists.freedesktop.org>; Tue, 18 Feb 2020 18:52:07 +0000 (UTC)
MIME-Version: 1.0
From: Chris Wilson <chris@chris-wilson.co.uk>
References: <20200217142155.501499-1-lionel.g.landwerlin@intel.com>
 <20200217142155.501499-4-lionel.g.landwerlin@intel.com>
In-Reply-To: <20200217142155.501499-4-lionel.g.landwerlin@intel.com>
Message-ID: <158205192295.8112.16837698601608333438@skylake-alporthouse-com>
Date: Tue, 18 Feb 2020 18:52:02 +0000
Subject: Re: [igt-dev] [PATCH i-g-t 3/6] lib/i915: Add support for loading
 perf configurations
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Lionel Landwerlin <lionel.g.landwerlin@intel.com>, igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

Quoting Lionel Landwerlin (2020-02-17 14:21:52)
> +void
> +intel_perf_load_perf_configs(struct intel_perf *perf, int drm_fd)
> +{
> +       int drm_card = get_card_for_fd(drm_fd);
> +       struct dirent *entry;
> +       char metrics_path[128];
> +       DIR *metrics_dir;
> +       struct intel_perf_metric_set *metric_set;
> +
> +       snprintf(metrics_path, sizeof(metrics_path),
> +                "/sys/class/drm/card%d/metrics", drm_card);

        if (fstat(i915, &st) || !S_ISCHR(st.st_mode))
                return NULL;

        snprintf(path, pathlen, "/sys/dev/char/%d:%d/metrics",
                 major(st.st_rdev), minor(st.st_rdev));


> +       metrics_dir = opendir(metrics_path);
> +       if (!metrics_dir)
> +               return;
> +
> +       while ((entry = readdir(metrics_dir))) {
> +               char *metric_id_path;
> +               uint64_t metric_id;
> +
> +               if (entry->d_type != DT_DIR)
> +                       continue;
> +
> +               asprintf(&metric_id_path, "%s/%s/id",
> +                        metrics_path, entry->d_name);

I'd suggest using openat.

> +
> +               if (!read_file_uint64(metric_id_path, &metric_id)) {
> +                       free(metric_id_path);
> +                       continue;
> +               }
> +
> +               free(metric_id_path);
> +
> +               igt_list_for_each_entry(metric_set, &perf->metric_sets, link) {
> +                       if (!strcmp(metric_set->hw_config_guid, entry->d_name)) {
> +                               metric_set->perf_oa_metrics_set = metric_id;
> +                               break;
> +                       }
> +               }
> +       }
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
